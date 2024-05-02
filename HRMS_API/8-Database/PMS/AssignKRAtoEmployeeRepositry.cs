using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.PMS;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Enumerations;
using static Phoenix.CrossCutting.Enumerations.Enumerations;
using Phoenix.Model.Business.Administration;
using PMDP = Phoenix.Model.Database.PerfirmanceManagement;
using System;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.Model.Business.Investment;
using Phoenix.Model.Business.LeaveManagement;

namespace Phoenix.Database.Repository.PMS
{
    public class AssignKRARepositry : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache rediscache;

        public AssignKRARepositry(IConfiguration configuration, IDistributedCache redisCache) : base(configuration)
        {
            this.configuration = configuration;
        }
        //public async Task<bool> SaveEmployeeKRADetails(List<AssignKraInformation> employeeKRADetails)
        //{
        //    bool isSaved = false;
        //    OracleDynamicParameters parameters = null;
        //    int rowsInserted = 0;
        //    //DateTime date = DateTime.Now;
        //    List<int> recordId = employeeKRADetails.Select(x => x.RecordId).ToList();
        //    List<int> kraSlno = employeeKRADetails.Select(x => x.KraSlno).ToList();
        //    List<int> kpiSlno = employeeKRADetails.Select(x => x.KpiSlno).ToList();
        //    List<int> maxScore = employeeKRADetails.Select(x => x.MaxScore).ToList();
        //    List<int> departmentSlno = employeeKRADetails.Select(x => x.DepartmentSlno).ToList();
        //    List<int> designationSlno = employeeKRADetails.Select(x => x.DesignationSlno).ToList();
        //    List<int> employeeSlno = employeeKRADetails.Select(x => x.EmployeeSlno).ToList();
        //    List<int> frequencySlno = employeeKRADetails.Select(x => x.FrequencySlno).ToList();
        //    List<long> createdBy = employeeKRADetails.Select(x => x.CreatedBy).ToList();
        //    List<int> statusId = employeeKRADetails.Select(x => x.StatusId).ToList();


        //    using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
        //    {
        //        parameters = new OracleDynamicParameters();
        //        parameters.Add(name: "iRECORDID", recordId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, recordId.Count,
        //            collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
        //        parameters.Add(name: "iKRASLNO", kraSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, kraSlno.Count,
        //            collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
        //        parameters.Add(name: "iKPISLNO", kpiSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, kpiSlno.Count,
        //            collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
        //        parameters.Add(name: "iMAXSCORE", maxScore.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, maxScore.Count,
        //            collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
        //        parameters.Add(name: "iDEPARTMENTSLNO", departmentSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, departmentSlno.Count,
        //            collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
        //        parameters.Add(name: "iDESIGNATIONSLNO", designationSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, designationSlno.Count,
        //            collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
        //        parameters.Add(name: "iEMPLOYEESLNO", employeeSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, employeeSlno.Count,
        //            collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
        //        parameters.Add(name: "iFREQUENCYSLNO", frequencySlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, frequencySlno.Count,
        //            collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
        //        parameters.Add(name: "iCREATEDBY", createdBy.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createdBy.Count,
        //            collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
        //        parameters.Add(name: "iSTATUSID", statusId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createdBy.Count,
        //            collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
        //        rowsInserted = await connection.ExecuteAsync(PerformanceManagement.SP_SAVE_EMP_KRA_KPI_MAPPING, parameters, commandType: CommandType.StoredProcedure);
        //    }
        //    isSaved = (rowsInserted * -1) > 0;
        //    return isSaved;
        //}

        public async Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformations(int departmentId, int designationId)
        {
            List<AssignKraInformation> assignedKraInformations = null;
            List<KraInformation> kraInformations = null;
            Tuple<List<KraInformation>, List<AssignKraInformation>> returnData = null;

            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iDEPARTMENT_SLNO", departmentId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iDESIGNATION_SLNO", designationId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "oKPI_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "oKRA_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(PerformanceManagement.SP_GET_ASSIGNED_KRA_INFO, parameters, commandType: CommandType.StoredProcedure);
                assignedKraInformations = results.Read<AssignKraInformation>().ToList();
                kraInformations = results.Read<KraInformation>().ToList();
                returnData = new Tuple<List<KraInformation>, List<AssignKraInformation>>(kraInformations, assignedKraInformations);
            }

            return returnData;

        }

        public async Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformationsOfDesignation(int designationId)
        {
            List<AssignKraInformation> assignedKraInformations = null;
            List<KraInformation> kraInformations = null;
            Tuple<List<KraInformation>, List<AssignKraInformation>> returnData = null;

            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iDESIGNATION_SLNO", designationId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "oKPI_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "oKRA_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(PerformanceManagement.SP_GET_KRA_FOR_DESIGNATION, parameters, commandType: CommandType.StoredProcedure);
                assignedKraInformations = results.Read<AssignKraInformation>().ToList();
                kraInformations = results.Read<KraInformation>().ToList();
                returnData = new Tuple<List<KraInformation>, List<AssignKraInformation>>(kraInformations, assignedKraInformations);
            }

            return returnData;

        }

        public async Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformationsForEmployee(int employeeSlno)
        {
            List<AssignKraInformation> assignedKraInformations = null;
            List<KraInformation> kraInformations = null;
            Tuple<List<KraInformation>, List<AssignKraInformation>> returnData = null;

            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "oKPI_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryAsync<AssignKraInformation>(PerformanceManagement.SP_GET_KRA_FOR_EMPLOYEE, parameters, commandType: CommandType.StoredProcedure);
                assignedKraInformations = results.ToList<AssignKraInformation>();
                //kraInformations = results.Read<KraInformation>().ToList();
                returnData = new Tuple<List<KraInformation>, List<AssignKraInformation>>(kraInformations, assignedKraInformations);
            }
            return returnData;
        }


        public async Task<bool> AssignKraInformation(List<KraInformation> assignKRAInformation)
        {
            bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsInserted = 0;
            //DateTime date = DateTime.Now;
            List<int> recordId = assignKRAInformation.Select(x => x.RecordId.ToInt32OrDefault()).ToList();
            List<int> kraSlno = assignKRAInformation.Select(x => x.KraSlno.ToInt32OrDefault()).ToList();
            List<int> departmentSlno = assignKRAInformation.Select(x => x.DepartmentSlno.ToInt32OrDefault()).ToList();
            List<int> designationSlno = assignKRAInformation.Select(x => x.DesignationSlno.ToInt32OrDefault()).ToList();
            List<long> createdBy = assignKRAInformation.Select(x => x.CreatedBy).ToList();
            List<int> statusId = assignKRAInformation.Select(x => x.StatusId).ToList();


            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iRECORDID", recordId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, recordId.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iKRASLNO", kraSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, kraSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iDEPARTMENTSLNO", departmentSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, departmentSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iDESIGNATIONSLNO", designationSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, designationSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iCREATEDBY", createdBy.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createdBy.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iSTATUSID", statusId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createdBy.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                rowsInserted = await connection.ExecuteAsync(PerformanceManagement.SP_ASSIGN_KRA_INFORMATION, parameters, commandType: CommandType.StoredProcedure);
            }
            isSaved = (rowsInserted * -1) > 0;
            return isSaved;
        }

        public async Task<bool> AssignKraKpiInformation(List<AssignKraInformation> assignKRAKPIInformation, int createdBy, bool isDraft)
        {
            bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsInserted = 0;

            int departmentSlno = assignKRAKPIInformation.FirstOrDefault().DepartmentSlno;
            int designationSlno = assignKRAKPIInformation.FirstOrDefault().DesignationSlno;

            assignKRAKPIInformation = assignKRAKPIInformation.Where(x => x.MaxScore > 0).ToList();

            List<int> recordId = assignKRAKPIInformation.Select(x => x.RecordId).ToList();
            List<int> kraSlno = assignKRAKPIInformation.Select(x => x.KraSlno).ToList();
            List<int> kpiSlno = assignKRAKPIInformation.Select(x => x.KpiSlno).ToList();
            List<int> frequencySlno = assignKRAKPIInformation.Select(x => x.FrequencySlno).ToList();
            List<int> maxScore = assignKRAKPIInformation.Select(x => x.MaxScore).ToList();



            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iRECORDID", recordId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, recordId.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iKRASLNO", kraSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, kraSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iKPISLNO", kpiSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, kpiSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iFREQUENCYSLNO", frequencySlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, frequencySlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iMAXSCORE", maxScore.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, maxScore.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iIS_DRAFT", isDraft, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iDEPARTMENTSLNO", designationSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iDESIGNATIONSLNO", designationSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iCREATEDBY", createdBy, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "AFFECTEDROWCOUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);

                rowsInserted = await connection.ExecuteAsync(PerformanceManagement.SP_ASSIGN_KRA_KPI_INFORMATION, parameters, commandType: CommandType.StoredProcedure);
                rowsInserted = parameters.Get<int>("AFFECTEDROWCOUNT");
            }
            isSaved = (rowsInserted) >= 0;
            return isSaved;
        }

        public async Task<bool> AssignKraInformationToDesignation(List<KraInformation> assignKRAInformationToDesignation)
        {
            bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsInserted = 0;
            //DateTime date = DateTime.Now;
            List<int> recordId = assignKRAInformationToDesignation.Select(x => x.RecordId.ToInt32OrDefault()).ToList();
            List<int> kraSlno = assignKRAInformationToDesignation.Select(x => x.KraSlno.ToInt32OrDefault()).ToList();
            List<int> kpiSlno = assignKRAInformationToDesignation.Select(x => x.KpiSlno.ToInt32OrDefault()).ToList();
            List<int> departmentSlno = assignKRAInformationToDesignation.Select(x => x.DepartmentSlno.ToInt32OrDefault()).ToList();
            List<int> designationSlno = assignKRAInformationToDesignation.Select(x => x.DesignationSlno.ToInt32OrDefault()).ToList();
            List<long> createdBy = assignKRAInformationToDesignation.Select(x => x.CreatedBy).ToList();
            List<int> statusId = assignKRAInformationToDesignation.Select(x => x.StatusId).ToList();


            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iRECORDID", recordId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, recordId.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iKRASLNO", kraSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, kraSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iDEPARTMENTSLNO", departmentSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, departmentSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iDESIGNATIONSLNO", designationSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, designationSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iCREATEDBY", createdBy.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createdBy.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iSTATUSID", statusId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createdBy.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                rowsInserted = await connection.ExecuteAsync(PerformanceManagement.SP_ASSIGN_KRA_INFORMATION, parameters, commandType: CommandType.StoredProcedure);
            }
            isSaved = (rowsInserted * -1) > 0;
            return isSaved;
        }

        public async Task<bool> AssignKraInformationToEmployee(List<KraInformation> assignKRAInformationToEmployee, int createdBy)
        {
            bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsInserted = 0;

            int departmentSlno = assignKRAInformationToEmployee.FirstOrDefault().DepartmentSlno;
            int designationSlno = assignKRAInformationToEmployee.FirstOrDefault().DesignationSlno;
            int employeeSlno = assignKRAInformationToEmployee.FirstOrDefault().EmployeeSlno;

            //DateTime date = DateTime.Now;
            List<int> recordId = assignKRAInformationToEmployee.Select(x => x.RecordId.ToInt32OrDefault()).ToList();
            List<int> kraSlno = assignKRAInformationToEmployee.Select(x => x.KraSlno.ToInt32OrDefault()).ToList();
            List<int> kpiSlno = assignKRAInformationToEmployee.Select(x => x.KpiSlno.ToInt32OrDefault()).ToList();
            List<int> frequencySlno = assignKRAInformationToEmployee.Select(x => x.FrequencySlno.ToInt32OrDefault()).ToList();
            List<int> maxScore = assignKRAInformationToEmployee.Select(x => x.MaxScore.ToInt32OrDefault()).ToList();
            List<int> isDraft = assignKRAInformationToEmployee.Select(x => x.IsDraft.ToInt32OrDefault()).ToList();

            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iRECORDID", recordId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, recordId.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iKRASLNO", kraSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, kraSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iKPISLNO", kpiSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, kraSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iFREQUENCYSLNO", frequencySlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, kraSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iMAXSCORE", maxScore.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, kraSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iDEPARTMENTSLNO", departmentSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iDESIGNATIONSLNO", designationSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iIS_DRAFT", 1, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iCREATEDBY", createdBy, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "AFFECTEDROWCOUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);

                rowsInserted = await connection.ExecuteAsync(PerformanceManagement.SP_ASSIGN_EMP_KRA_KPI_INFO, parameters, commandType: CommandType.StoredProcedure);
                //rowsInserted = parameters.Get<int>("AFFECTEDROWCOUNT");
            }
            isSaved = (rowsInserted * -1) > 0;
            return isSaved;
        }
    }
}
