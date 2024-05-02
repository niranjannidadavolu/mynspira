using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.CrossCutting.TimePeriod;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Masters;
using Phoenix.Model.Business.Payroll;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.DateTime;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Masters
{
    /// <summary>
    /// Employee Investment Declarations.
    /// </summary>
    public class PayrollPeriodRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public PayrollPeriodRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<PayrollPeriod> GetPayrollDates(DateTime fromDate)
        {
            DateTime yearEndDate = DateTime.Now;
            PayrollPeriod payrollPeriod = null;
            Dictionary<string, DateTime> payrollDates = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "ilEAVE_FROM_DATE", fromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                payrollPeriod = await connection.QueryFirstAsync<PayrollPeriod>(DatabaseProcedures.SP_GET_PAYROLL_PERIOD, parmeters, commandType: CommandType.StoredProcedure);
            }
            if (payrollPeriod != null)
            {
                yearEndDate = yearEndDate.EndOfYear();
                if (yearEndDate.Subtract(payrollPeriod.ToDate).Days <= 6)
                {
                    payrollPeriod.ToDate = yearEndDate;
                }
            }
            return payrollPeriod;
        }

        private async Task<PayrollPeriod> GetNextPayrollDates(DateTime fromDate)
        {
            DateTime yearEndDate = DateTime.Now;
            PayrollPeriod payrollPeriod = null;
            Dictionary<string, DateTime> payrollDates = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "ilEAVE_FROM_DATE", fromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                payrollPeriod = await connection.QueryFirstAsync<PayrollPeriod>(DatabaseProcedures.SP_GET_PAYROLL_PERIOD, parmeters, commandType: CommandType.StoredProcedure);
            }
            return payrollPeriod;
        }

    }
}
