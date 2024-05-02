using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Configuration;
using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Masters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Masters
{
    public class BranchRepository : BaseRepository
    {

        private readonly IConfiguration configuration;
        public BranchRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<Branch>> GetHRBranch(int employeeSlno)
        {
            List<Branch> branch = null;
            if (ApplicationSettings.Current.GetAllBranchesFor.Contains(employeeSlno))
            {
                employeeSlno = 0;
            }

            if (ApplicationSettings.Current.GetBranchesFor.Contains(employeeSlno))
            {
                using (var connection = await CreateConnection(DbSchema.PORTAL))
                {
                    OracleDynamicParameters parameters = new OracleDynamicParameters();
                    parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                    branch = (await connection.QueryAsync<Branch>(DatabaseProcedures.SP_GET_HR_BRANCHES, parameters, commandType: CommandType.StoredProcedure)).ToList();
                }
            }
            else
            {
                using (var connection = await CreateConnection(DbSchema.PORTAL))
                {
                    OracleDynamicParameters parameters = new OracleDynamicParameters();
                    parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                    branch = (await connection.QueryAsync<Branch>(DatabaseProcedures.SP_GET_HR_BRANCHES, parameters, commandType: CommandType.StoredProcedure)).ToList();
                }
            }

            return branch;
        }
        public async Task<List<Branch>> GetBranchesByOfcType(int officeTypeSlno, int employeeSlno)
        {
            List<Branch> branch = null;
            if (ApplicationSettings.Current.GetAllBranchesFor.Contains(employeeSlno))
            {
                employeeSlno = 0;
            }
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "IOFFICETYPESLNO", officeTypeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                branch = (await connection.QueryAsync<Branch>(DatabaseProcedures.SP_GET_BRANCHES_BY_OFFICE_TYPE, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return branch;
        }

        public async Task<List<OfficeType>> GetOfficeType()
        {
            List<OfficeType> officeType = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                officeType = (await connection.QueryAsync<OfficeType>(DatabaseProcedures.SP_GET_OFFICE_TYPE, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return officeType;
        }


        //HRR
        public async Task<List<BranchRMS>> GetHRBranchRMS(int employeeSlno)
        {
            List<BranchRMS> branch = null;
            if (ApplicationSettings.Current.GetAllBranchesFor.Contains(employeeSlno))
            {
                employeeSlno = 0;
            }

            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                branch = (await connection.QueryAsync<BranchRMS>(DatabaseProcedures.SP_GET_HRR_BRANCHES_RMS, parameters, commandType: CommandType.StoredProcedure)).ToList();
                //leaveTypes = await GetLeaveTypeReasons(leaveTypes);

            }
            return branch;
        }

        public async Task<List<Branch>> GetAllBranches()
        {
            List<Branch> branches = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                branches = (await connection.QueryAsync<Branch>(DatabaseProcedures.SP_GET_ALL_ACTIVE_BRANCHES, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return branches;
        }
    }
}
