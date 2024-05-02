using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Masters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Masters
{
    /// <summary>
    /// Employee Investment Declarations.
    /// </summary>
    public class LeaveTypeRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public LeaveTypeRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LeaveType>> GetAssignedLeaveTypes(int employeeSlno)
        {
            List<LeaveType> leaveTypes = null;
            List<LeaveTypeReason> leaveTypeReason = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                leaveTypes = (await connection.QueryAsync<LeaveType>(DatabaseProcedures.SP_GET_EMPLOYEE_LEAVE_TYPES, parameters, commandType: CommandType.StoredProcedure)).ToList();

                leaveTypes = await GetLeaveTypeReasons(leaveTypes);

            }



            string gender = await GetEmpGender(employeeSlno);
            bool isMarried = await CheckForMaritalStatus(employeeSlno);
            int marriageCount = await CheckForExistingLeaves(employeeSlno, LeaveTypeNames.MARRIAGE_LEAVE.ToInt32OrDefault(), LeaveStatusNames.PendingAndApproval.ToInt32OrDefault());
            // leaveTypes = leaveTypes.Where(x => x.LeaveTypeId != LeaveTypeNames.ON_DUTY.ToInt32OrDefault()).ToList();
            int sclCount = 0;
            if (leaveTypes.Where(x => x.LeaveTypeId == LeaveTypeNames.SPECIAL_CASUAL_LEAVE.ToInt32OrDefault()).ToList().Count > 0 )
            {
                sclCount = await CheckForExistingLeaves(employeeSlno, LeaveTypeNames.SPECIAL_CASUAL_LEAVE.ToInt32OrDefault(), LeaveStatusNames.PendingAndApproval.ToInt32OrDefault());
            }
            int sslCount = 0;
            if (leaveTypes.Where(x => x.LeaveTypeId == LeaveTypeNames.SPECIAL_SICK_LEAVE.ToInt32OrDefault()).ToList().Count > 0)
            {
                sslCount = await CheckForExistingLeaves(employeeSlno, LeaveTypeNames.SPECIAL_SICK_LEAVE.ToInt32OrDefault(), LeaveStatusNames.PendingAndApproval.ToInt32OrDefault());
            }
            int bereavementCount = 0;
            if (leaveTypes.Where(x => x.LeaveTypeId == LeaveTypeNames.BEREAVEMENT_LEAVE.ToInt32OrDefault()).ToList().Count > 0)
            {
                bereavementCount = await CheckForExistingLeaves(employeeSlno, LeaveTypeNames.BEREAVEMENT_LEAVE.ToInt32OrDefault(), LeaveStatusNames.PendingAndApproval.ToInt32OrDefault());
            }
            if (gender == "F")
            {
                leaveTypes = leaveTypes.Where(x => (x.LeaveTypeId != LeaveTypeNames.PATERNITY_LEAVE.ToInt32OrDefault())).ToList();
            }
            else if (gender == "M")
            {
                leaveTypes = leaveTypes.Where(x => (x.LeaveTypeId != LeaveTypeNames.MATERNITY_LEAVE.ToInt32OrDefault())).ToList();
            }
            if (isMarried || marriageCount >= 1)
            {
                leaveTypes = leaveTypes.Where(x => x.LeaveTypeId != LeaveTypeNames.MARRIAGE_LEAVE.ToInt32OrDefault()).ToList();
                bool hasChildren = await CheckForChildren(employeeSlno);
                //int pChildCount = await CheckForExistingLeaves(employeeSlno, LeaveTypeNames.PATERNITY_LEAVE.ToInt32OrDefault(), LeaveStatusNames.PendingAndApproval.ToInt32OrDefault());
                //int mChildCount = await CheckForExistingLeaves(employeeSlno, LeaveTypeNames.MATERNITY_LEAVE.ToInt32OrDefault(), LeaveStatusNames.PendingAndApproval.ToInt32OrDefault());
                if (hasChildren) // || pChildCount >= 2 || mChildCount >= 2
                {
                    if (gender == "M")
                    {
                        leaveTypes = leaveTypes.Where(x => (x.LeaveTypeId != LeaveTypeNames.PATERNITY_LEAVE.ToInt32OrDefault())).ToList();
                    }
                    else if (gender == "F")
                    {
                        leaveTypes = leaveTypes.Where(x => (x.LeaveTypeId != LeaveTypeNames.MATERNITY_LEAVE.ToInt32OrDefault())).ToList();
                    }
                }
            }
            else
            {
                leaveTypes = leaveTypes.Where(x => (x.LeaveTypeId != LeaveTypeNames.PATERNITY_LEAVE.ToInt32OrDefault())).ToList();
                leaveTypes = leaveTypes.Where(x => (x.LeaveTypeId != LeaveTypeNames.MATERNITY_LEAVE.ToInt32OrDefault())).ToList();
            }
            if (sclCount >= 1 || !isMarried)
            {
                leaveTypes = leaveTypes.Where(x => (x.LeaveTypeId != LeaveTypeNames.SPECIAL_CASUAL_LEAVE.ToInt32OrDefault())).ToList();
            }
            if (sslCount >= 1)
            {
                leaveTypes = leaveTypes.Where(x => (x.LeaveTypeId != LeaveTypeNames.SPECIAL_SICK_LEAVE.ToInt32OrDefault())).ToList();
            }
            //if (bereavementCount >= 1)
            //{
            //    leaveTypes = leaveTypes.Where(x => (x.LeaveTypeId != LeaveTypeNames.BEREAVEMENT_LEAVE.ToInt32OrDefault())).ToList();
            //}
            var summerVacation = leaveTypes.Where(x => (x.LeaveTypeId == LeaveTypeNames.SUMMER_VACATION.ToInt32OrDefault())).FirstOrDefault();
            if (summerVacation != null && (summerVacation.LeaveBalance <= 0 || summerVacation.DateValidFrom > DateTime.Now.Date || summerVacation.DateValidUntil < DateTime.Now.Date))
            {
                leaveTypes = leaveTypes.Where(x => (x.LeaveTypeId != LeaveTypeNames.SUMMER_VACATION.ToInt32OrDefault())).ToList();
            }
            var winterVacation = leaveTypes.Where(x => (x.LeaveTypeId == LeaveTypeNames.WINTER_VACATION.ToInt32OrDefault())).FirstOrDefault();
            if (winterVacation != null && (winterVacation.LeaveBalance <= 0 || winterVacation.DateValidFrom > DateTime.Now.Date || winterVacation.DateValidUntil < DateTime.Now.Date))
            {
                leaveTypes = leaveTypes.Where(x => (x.LeaveTypeId != LeaveTypeNames.WINTER_VACATION.ToInt32OrDefault())).ToList();
            }
            return leaveTypes;
        }

        public async Task<List<LeaveType>> GetLeaveTypeReasons(List<LeaveType> leaveTypes)
        {
            List<LeaveTypeReason> leaveTypeReason = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();

                foreach (var item in leaveTypes)
                {
                    leaveTypeReason = null;
                    if (item.ReasonCount > 0)
                    {
                        parameters.Add(name: "iLEAVETYPEID", item.LeaveTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                        leaveTypeReason = (await connection.QueryAsync<LeaveTypeReason>(DatabaseProcedures.SP_GET_LEAVE_REASONS, parameters, commandType: CommandType.StoredProcedure)).ToList();

                    }
                    item.LeaveTypeReasons = leaveTypeReason;
                }
            }

            return leaveTypes;
        }
        public async Task<List<LeaveType>> GetLeaveTypes()
        {
            List<LeaveType> leaveTypes = null;
            string sqlQuery = "SELECT LEAVE_TYPE_ID AS LEAVETYPEID,LEAVE_TYPE_NAME AS LEAVETYPENAME,LEAVE_TYPE_CODE AS LEAVETYPECODE,IS_PAID_LEAVE AS ISPAIDLEAVE FROM PORTAL.LEAVE_TYPE WHERE STATUS=1";
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                sqlQuery = string.Format(sqlQuery, "1");
                leaveTypes = (await connection.QueryAsync<LeaveType>(sqlQuery, commandType: CommandType.Text)).ToList();
            }
            return leaveTypes;
        }

        private async Task<bool> CheckForChildren(int employeeSlno)
        {
            int childCount = 0;
            bool hasChildren = false;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "OCHILDCOUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                await connection.ExecuteAsync(DatabaseProcedures.SP_CHECK_HAS_CHILDREN, parameters, commandType: CommandType.StoredProcedure);
                childCount = parameters.Get<int>("OCHILDCOUNT");
            }
            int pChildCount = await CheckForExistingLeaves(employeeSlno, LeaveTypeNames.PATERNITY_LEAVE.ToInt32OrDefault(), LeaveStatusNames.PendingAndApproval.ToInt32OrDefault());
            int mChildCount = await CheckForExistingLeaves(employeeSlno, LeaveTypeNames.MATERNITY_LEAVE.ToInt32OrDefault(), LeaveStatusNames.PendingAndApproval.ToInt32OrDefault());
            if (pChildCount >= 2 || mChildCount >= 2 || childCount >= 2 || (childCount >= 1 && (pChildCount >= 1 || mChildCount >= 1)))
            {
                hasChildren = true;
            }
            //  hasChildren = childCount >= 2;
            return hasChildren;
        }
        private async Task<bool> CheckForMaritalStatus(int employeeSlno)
        {
            int marriageCount = 0;
            bool isMarried = false;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "OISMARRIED", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                await connection.ExecuteAsync(DatabaseProcedures.SP_CHECK_MARITAL_STATUS, parameters, commandType: CommandType.StoredProcedure);
                marriageCount = parameters.Get<int>("OISMARRIED");
            }
            isMarried = marriageCount > 0;
            return isMarried;
        }
        private async Task<int> CheckForExistingLeaves(int employeeSlno, int leaveTypeId, int leaveStatusId)
        {
            int leaveCount = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iLEAVE_TYPE_ID", leaveTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ILEAVE_STATUS_ID", leaveStatusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "OLEAVECOUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                await connection.ExecuteAsync(DatabaseProcedures.SP_CHECK_FOR_EXSISTING_LEAVES, parameters, commandType: CommandType.StoredProcedure);
                leaveCount = parameters.Get<int>("OLEAVECOUNT");
            }

            return leaveCount;
        }
        private async Task<string> GetEmpGender(int employeeSlno)
        {
            string gender = null;
            string getGenderQuery = "SELECT GENDER FROM PAYROLLNEW.P_EMP_DT  WHERE STATUS IN (1,3) AND EMPLOYEESLNO ={0}";
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                string query = string.Format(getGenderQuery, employeeSlno);
                gender = await connection.QueryFirstOrDefaultAsync<string>(query);
            }
            return gender;
        }

    }
}
