using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging.Abstractions;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.CrossCutting.Logging;
using Phoenix.CrossCutting.Resources;
using Phoenix.CrossCutting.TimePeriod;
using Phoenix.Database.Repository.LeaveManagement;
using Phoenix.Database.Repository.Masters;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Attendance;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.Payroll;
using Phoenix.Model.Business.SearchCriteria.TimeSheet;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Attendance
{
    public class BioMetricRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;
        private readonly ILoggerManager logger;
        private readonly PayrollPeriod payrollDates = null;
        public BioMetricRepository(IConfiguration configuration, IDistributedCache redisCache, ILoggerManager logger) : base(configuration)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
            this.logger = logger;
            payrollDates = GetPayrollDates(DateTime.Now).Result;

        }

        public async Task<List<BioMetric>> GetEmployeeTimeSheet(long employeeId)
        {
            List<BioMetric> attendance = null;
            IEnumerable<BioMetric> dbAttendance = null;
            int recordCount = 0;
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPNO", null, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iEMPLOYEESLNO", employeeId, dbType: OracleMappingType.Int64, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                dbAttendance = (await connection.QueryAsync<BioMetric>(DatabaseProcedures.GET_EMPLOYEE_TIME_SHEET, parmeters, commandType: CommandType.StoredProcedure)).ToList();
                recordCount = await connection.ExecuteScalarAsync<int>(string.Format(DatabaseProcedures.P_G_EMPLOYEE_TIME_SHEET_COUNT, employeeId), commandType: CommandType.Text);
                attendance = await MapOnDutiesAndRegularAttendance(dbAttendance.ToList(), employeeId.ToInt32OrDefault());
            }
            return attendance;
        }

        public async Task<List<BioMetric>> GetReporteeTimeSheet(ReporteeTimeSheetSearchCriteria searchCriteria)
        {
            List<BioMetric> attendance = null;
            IEnumerable<BioMetric> dbAttendance = null;
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "IDATAFOR", searchCriteria.ReportFor, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "IEMPLOYEESLNO", searchCriteria.ReportingManagerSlno, dbType: OracleMappingType.Int64, direction: ParameterDirection.Input);
                parmeters.Add(name: "iFROMDATE", searchCriteria.StartDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parmeters.Add(name: "iTODATE", searchCriteria.EndDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                dbAttendance = (await connection.QueryAsync<BioMetric>(DatabaseProcedures.P_GET_REPORTEE_TIME_SHEET, parmeters, commandType: CommandType.StoredProcedure)).ToList();
                attendance = await MapOnDutiesAndRegularAttendance(dbAttendance.ToList(), searchCriteria.ReportingManagerSlno);
            }
            return attendance;
        }

        private async Task<List<BioMetric>> MapOnDutiesAndRegularAttendance(List<BioMetric> attendance, int employeeSlno)
        {
            List<HolidayInformation> holidays = await CheckCompOffEmployeeHoliday(employeeSlno);
            List<LeaveDetail> leaves = await CheckCompOffEmployeLeaves(employeeSlno);
            List<LeaveDetail> earlyLeaves = await CheckEarlyLogoutEmployeLeaves(employeeSlno);
            var start = payrollDates.FromDate;
            var end = payrollDates.ToDate;
            if (attendance.Count > 0)
            {
                attendance.ForEach((item) =>
                {
                    item.CanApplyOnDuty = item.Holiday_Type == 1 ? false : true;
                    if ((item.First_Half == "ABSENT" && item.Second_Half == "PRESENT") ||
                        (item.First_Half == "PRESENT" && item.Second_Half == "ABSENT"))
                    {
                        item.RegularOnDuty = true;
                    }
                    if (item.First_Half == "PRESENT" && item.Second_Half == "PRESENT" && item.TotalHours <= 2)
                    {
                        item.CanApplyOnDuty = true;
                    }

                    if (item.First_Half == "PRESENT" && item.Second_Half == "PRESENT" && item.TotalHours >= 9 && item.AttendanceDate >= DateTime.Now.AddDays(-30) && start < DateTime.Now && end > DateTime.Now)
                    {
                        holidays = holidays.Where(i => i.HolidayDate == item.AttendanceDate).ToList();
                        var comOffs = leaves.Where(i => i.CompOffDate == item.AttendanceDate).ToList();
                        if ((item.WeekDay == "Sun" || holidays.Count > 0) && comOffs.Count <= 0)
                        {
                            item.CanApplyCompOff = true;
                        }
                    }
                    if ((item.First_Half == "PRESENT" && item.Second_Half == "ON DUTY") || (item.First_Half == "ON DUTY" && item.Second_Half == "PRESENT"))
                    {
                        item.CanNotApplyEarlyLogOutTime = true;

                    }
                    var earlyLogoutData = earlyLeaves.Where(i => i.LeaveFrom == item.AttendanceDate).ToList();
                    if (earlyLogoutData.Count > 0 || item.AttendanceDate < start)
                    {
                        item.CanNotApplyEarlyLogOutTime = true;
                    }
                });
            }
            return attendance;
        }

        private async Task<List<HolidayInformation>> CheckCompOffEmployeeHoliday(int employeeSlno)
        {
            List<HolidayInformation> holidays = null;
            using (HolidayRepository repository = new HolidayRepository(this.configuration, this.redisCache))
            {
                holidays = await repository.GetEmployeeHolidays(employeeSlno);

            }
            return holidays;
        }
        private async Task<List<LeaveDetail>> CheckCompOffEmployeLeaves(int employeeSlno)
        {
            List<LeaveDetail> leaves = null;
            using (LeaveManagementRepository repository = new LeaveManagementRepository(this.configuration, this.logger))
            {
                var start = payrollDates.FromDate;
                var end = payrollDates.ToDate;
                leaves = await repository.GetEmployeeLeavesByLeaveType(employeeSlno, start, end, LeaveTypeNames.COMPENSATORY_OFF.ToInt32OrDefault());
            }
            return leaves;
        }

        private async Task<List<LeaveDetail>> CheckEarlyLogoutEmployeLeaves(int employeeSlno)
        {
            List<LeaveDetail> leaves = null;
            using (LeaveManagementRepository repository = new LeaveManagementRepository(this.configuration, this.logger))
            {
                var start = payrollDates.FromDate;
                var end = payrollDates.ToDate;
                leaves = await repository.GetEmployeeLeavesByLeaveType(employeeSlno, start, end, LeaveTypeNames.EARLY_LOGOUT_TIME.ToInt32OrDefault());
            }
            return leaves;
        }
        private async Task<PayrollPeriod> GetPayrollDates(DateTime fromDate)
        {
            PayrollPeriod payrollPeriod = null;
            using (var connection = new PayrollPeriodRepository(this.configuration))
            {
                payrollPeriod = await connection.GetPayrollDates(fromDate);
            }
            return payrollPeriod;
        }
    }
}
