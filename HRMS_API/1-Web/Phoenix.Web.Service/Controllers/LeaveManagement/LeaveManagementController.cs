using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;

using Phoenix.Application.LeaveManagement.Interfaces;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.SearchCriteria.LeaveManagement;
using Phoenix.Web.Service.Base;

using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.Model.Business.Attendance;
using Phoenix.Model.Business.LeaveManagementReports;
using Phoenix.Application.EmployeeInformation.Interfaces;
using FluentValidation;
using Phoenix.CrossCutting.Resources;
using Phoenix.Model.Business.Validator.LeaveManagement;

namespace Phoenix.Web.Service.Controllers.LeaveManagement
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeaveManagementController : BaseApiController
    {
        private readonly ILeaveManagementApplication leaveManagementApplication;
        private readonly IEmployeeInformationApplication employeeInformationApplication;

        public LeaveManagementController(ILeaveManagementApplication leaveManagementApplication, IEmployeeInformationApplication employeeInformationApplication)
        {
            this.leaveManagementApplication = leaveManagementApplication;
            this.employeeInformationApplication = employeeInformationApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeeLeaves")]
        public async Task<List<LeaveDetail>> GetEmployeeLeaves(int employeeSLNo, int statusId, bool isDashBoard)
        {
            List<LeaveDetail> leaveStatusList = await leaveManagementApplication.GetEmployeeLeaves(employeeSLNo, statusId);
            if (isDashBoard)
            {
                leaveStatusList = leaveStatusList.OrderByDescending(x => x.LeaveFrom).ToList();
            }
            return leaveStatusList;
        }

        [HttpGet]
        [Route("GetEmpLeavesbyId")]
        public async Task<EmpLeavePolicyDetails> GetEmpLeavesbyLeaveId(int leaveId)
        {
            EmpLeavePolicyDetails empLeavePolicyDetails = await leaveManagementApplication.GetEmpLeavesbyLeaveId(leaveId);
            return empLeavePolicyDetails;
        }

        [Authorize]
        [HttpPost]
        [Route("GetLeavesWaitingForApproval")]
        public async Task<List<LeaveDetail>> GetLeavesWaitingForApproval(LeaveSearchCriteria searchCriteria)
        {
            List<LeaveDetail> empList = await leaveManagementApplication.GetLeavesWaitingForApproval(searchCriteria);
            return empList;
        }

        [Authorize]
        [HttpPost]
        [Route("GetTeamLeaves")]
        public async Task<List<EmployeeLeaveReport>> GetTeamLeaves([FromBody] LeaveSearchCriteria searchCriteria)
        {
            List<EmployeeLeaveReport> empList = await leaveManagementApplication.GetTeamLeaves(searchCriteria);
            return empList;
        }

        [Authorize]
        [HttpPost]
        [Route("GetMyTeamEmployeeLeaves")]
        public async Task<List<GetTeamEmpLeavesData>> GetMyTeamEmployeeLeaves(LeaveSearchCriteria searchCriteria)
        {
            List<GetTeamEmpLeavesData> leaveList = await leaveManagementApplication.GetMyTeamEmployeeLeaves(searchCriteria);
            return leaveList;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeeLeaveBalance")]
        public async Task<List<EmpLeaveBalance>> GetEmployeeLeaveBalance(int employeeSLNo)
        {
            List<EmpLeaveBalance> leavesList = await leaveManagementApplication.GetEmployeeLeaveBalance(employeeSLNo);
            return leavesList;
        }

        [Authorize]
        [HttpPost]
        [Route("UpdateEmployeeLeaveStatus")]
        public async Task<bool> UpdateEmployeeLeaveStatus([FromBody] LeaveDetail empLeaves)
        {
            bool updateEmployeeLeaveStatus = await leaveManagementApplication.UpdateEmployeeLeaveStatus(empLeaves);
            return updateEmployeeLeaveStatus;
        }

        [Authorize]
        [HttpPost]
        [Route("UpdateTeamLeaves")]
        public async Task<bool> UpdateTeamLeaves([FromBody] List<LeaveDetail> leaveDetails)
        {
            bool updateEmployeeLeaveStatus = false;
            updateEmployeeLeaveStatus = await leaveManagementApplication.UpdateTeamLeaves(leaveDetails);
            return updateEmployeeLeaveStatus;
        }

        [Authorize]
        [HttpPost]
        [Route("UpdateTeamLeavesByHR")]
        public async Task<bool> UpdateTeamLeavesByHR([FromBody] List<LeaveDetail> leaveDetails)
        {
            bool updateEmployeeLeaveStatus = false;
            updateEmployeeLeaveStatus = await leaveManagementApplication.UpdateTeamLeavesByHR(leaveDetails);
            return updateEmployeeLeaveStatus;
        }

        [Authorize]
        [HttpPost]
        [Route("SaveEmployeeLeave")]
        public async Task<EmpLeaveResponse> SaveEmployeeLeave([FromBody] EmployeeLeave empLeaveRequest)
        {
            EmpLeaveResponse saveLeaveRequest = null;
            saveLeaveRequest = await leaveManagementApplication.SaveEmployeeLeave(empLeaveRequest);
            //List<HolidayInformation> holidayInformations = null;
            //List<LeaveDetail> appliedLeaves = null;
            //appliedLeaves = await leaveManagementApplication.GetEmployeeLeaves(empLeaveRequest.EmployeeSlno, 1);
            //holidayInformations = await this.employeeInformationApplication.GetEmployeeHolidays(empLeaveRequest.EmployeeSlno);


            //LeaveInformationValidator informationValidator = new LeaveInformationValidator();
            //informationValidator.HolidayInformations = holidayInformations;
            //informationValidator.AppliedLeaves = appliedLeaves;
            //var validationResult = informationValidator.Validate(empLeaveRequest);
            //if (validationResult != null && validationResult.IsValid)
            //{
            //    saveLeaveRequest = await leaveManagementApplication.SaveEmployeeLeave(empLeaveRequest);
            //}

            return saveLeaveRequest;
        }



        [Authorize]
        [HttpGet]
        [Route("GetManagerApprovalLeaves")]
        public async Task<List<LeaveDetail>> GetManagerApprovalLeaves(int employeeSlno)
        {
            List<LeaveDetail> empList = await leaveManagementApplication.GetManagerApprovalLeaves(employeeSlno);
            return empList;
        }

        [Authorize]
        [HttpGet]
        [Route("GetUtilizedOnDuties")]
        public async Task<int> GetUtilizedOnDuties(int employeeSlno)
        {
            int utilizedOnDuties = await leaveManagementApplication.GetUtilizedOnDuties(employeeSlno);
            return utilizedOnDuties;
        }

        [HttpGet]
        [Route("GetEmpLeaveFiles")]
        public async Task<List<EmpLeaveFileDetails>> GetEmpLeaveFiles(int leaveId)
        {
            List<EmpLeaveFileDetails> leaveFileDetails = await leaveManagementApplication.GetEmpLeaveFiles(leaveId);
            return leaveFileDetails;
        }

        [Authorize]
        [HttpDelete]
        [Route("CancelLeave")]
        public async Task<bool> CancelLeave(int leaveId, int updatedBy)
        {
            bool updateEmployeeLeaveStatus = await leaveManagementApplication.CancelLeave(leaveId, updatedBy);
            return updateEmployeeLeaveStatus;
        }

        [Authorize]
        [HttpPost]
        [Route("GetLeaveBalancesReport")]
        public async Task<List<LeaveBalance>> GetLeaveBalancesReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<LeaveBalance> resultList = await leaveManagementApplication.GetLeaveBalancesReport(getLeaveReportReq);
            return resultList;
        }

        [Authorize]
        [HttpPost]
        [Route("GetEmployeeLeaveReport")]
        public async Task<List<EmployeeLeaveReport>> GetEmployeeLeaveReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<EmployeeLeaveReport> employeeLeaveReports = await leaveManagementApplication.GetEmployeeLeaveReport(getLeaveReportReq);
            return employeeLeaveReports;
        }
        [Authorize]
        [HttpPost]
        [Route("GetLeaveEntitlementReport")]
        public async Task<List<LeaveEntitlementReport>> GetLeaveEntitlementReport(LeaveReportSearchCriteria getLeaveEntitlementReportReq)
        {
            List<LeaveEntitlementReport> LeaveEntitlementReports = await leaveManagementApplication.GetLeaveEntitlementReport(getLeaveEntitlementReportReq);
            return LeaveEntitlementReports;
        }
    }
}