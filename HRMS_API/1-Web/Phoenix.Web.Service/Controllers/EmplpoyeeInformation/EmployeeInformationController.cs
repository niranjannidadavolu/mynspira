using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.EmployeeInformation.Interfaces;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.Attendance;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.SearchCriteria.EmployeeInformation;
using Phoenix.Model.Business.SearchCriteria.TimeSheet;
using Phoenix.Web.Service.Base;
using Phoenix.Web.Service.Helper;

namespace Phoenix.Web.Service.Controllers.EmplpoyeeInformation
{
    [Route("api/[Controller]/")]
    public class EmployeeInformationController : BaseController
    {
        private readonly IEmployeeInformationApplication employeeInformationApplication;
        public EmployeeInformationController(IEmployeeInformationApplication employeeInformationApplication)
            : base()
        {
            this.employeeInformationApplication = employeeInformationApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeeInformation")]
        public async Task<EmployeeProfile> GetEmployeeInformation(int employeeSlno)
        {
            EmployeeProfile employeeProfile = new EmployeeProfile();
            return employeeProfile;
        }


        [Authorize]
        [HttpGet]
        [Route("GetMyProfile")]
        public async Task<EmployeeProfile> GetMyProfile(int employeeSlno)
        {
            EmployeeProfile employeeProfile = null;
            employeeProfile = await employeeInformationApplication.GetEmployeeInformation(employeeSlno);
            return employeeProfile;
        }


        [Authorize]
        [HttpGet]
        [Route("GetEmployeeMinimumProfile")]
        public async Task<EmployeeProfile> GetEmployeeMinimumProfile(int employeeSlno)
        {
            EmployeeProfile employeeProfile = null;
            employeeProfile = await employeeInformationApplication.GetEmployeeMinimumProfile(employeeSlno);
            return employeeProfile;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeeProfile")]
        public async Task<EmployeeProfile> GetEmployeeProfile(string employeeId)
        {
            EmployeeProfile employeeProfile = null;
            employeeProfile = await employeeInformationApplication.GetEmployeeProfile(employeeId);
            return employeeProfile;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeeTimeSheet")]
        public async Task<List<BioMetric>> GetEmployeeTimeSheet(long employeeId)
        {
            List<BioMetric> attendance = await employeeInformationApplication.GetEmployeeTimeSheet(employeeId);
            return attendance;
        }

        [HttpGet]
        [Route("GetEmployeeHolidays")]
        public async Task<List<HolidayInformation>> GetEmployeeHolidays(long employeeId)
        {
            List<HolidayInformation> holidays = await employeeInformationApplication.GetEmployeeHolidays(employeeId);
            return holidays;
        }

        [Authorize]
        [HttpPost]
        [Route("SearchEmployeeInformations")]
        public async Task<PagedResultSet<EmployeeProfile>> SearchEmployeeInformations([FromBody] EmployeeInformationSearchCriteria searchCriteria)
        {
            PagedResultSet<EmployeeProfile> userList = null;
            userList = await employeeInformationApplication.SearchEmployeeInformations(searchCriteria);
            return userList;
        }

        [Authorize]
        [HttpPost]
        [Route("GetMyTeamMembers")]
        public async Task<PagedResultSet<EmployeeProfile>> GetMyTeamMembers([FromBody] EmployeeInformationSearchCriteria searchCriteria)
        {
            PagedResultSet<EmployeeProfile> userList = null;
            userList = await employeeInformationApplication.GetMyTeamMembers(searchCriteria);
            return userList;
        }
        [Authorize]
        [HttpPost]
        [Route("GetUpdateEmployeeEmailAddressOtp")]
        public async Task<bool> GetUpdateEmployeeEmailAddressOtp([FromBody] UpdadteEmployeeEmail updadteEmployeeEmail)
        {
            bool isUpdated = await employeeInformationApplication.GetUpdateEmployeeEmailAddressOtp(updadteEmployeeEmail);
            return isUpdated;
        }
        [Authorize]
        [HttpPost]
        [Route("UpdateEmployeePanDetails")]
        public async Task<bool> UpdateEmployeePanDetails([FromBody] UpdadteEmployeePan updadteEmployeePan)
        {
            bool isUpdated = await employeeInformationApplication.UpdateEmployeePanDetails(updadteEmployeePan);
            return isUpdated;
        }
        [Authorize]
        [HttpPut]
        [Route("UpdateEmployeePanStatus")]
        public async Task<bool> UpdateEmployeePanStatus([FromBody] UpdateEmployeePanStatus updadteEmployeePan)
        {
            bool isUpdated = await employeeInformationApplication.UpdateEmployeePanStatus(updadteEmployeePan);
            return isUpdated;
        }



        [Authorize]
        [HttpPost]
        [Route("VerifyUpdateEmployeeEmailAddressOtp")]
        public async Task<bool> VerifyUpdateEmployeeEmailAddressOtp([FromBody] UpdadteEmployeeEmail updadteEmployeeEmail)
        {
            bool isUpdated = await employeeInformationApplication.VerifyUpdateEmployeeEmailAddressOtp(updadteEmployeeEmail);
            return isUpdated;
        }
        [Authorize]
        [HttpPost]
        [Route("UpdateEmployeeFamilyDetails")]
        public async Task<bool> UpdateEmployeeFamilyDetails([FromBody] FamilyDetail familyDetails)
        {
            bool isUpdated = await employeeInformationApplication.UpdateEmployeeFamilyDetails(familyDetails);
            return isUpdated;
        }

        [Authorize]
        [HttpPost]
        [Route("UpdateEmployeeEducationDetails")]
        public async Task<bool> UpdateEmployeeEducationDetails([FromBody] EducationDetail educationDetail)
        {
            bool isUpdated = await employeeInformationApplication.UpdateEmployeeEducationDetails(educationDetail);
            return isUpdated;
        }

        [Authorize]
        [HttpPost]
        [Route("UpdateEmployeeExperienceDetails")]
        public async Task<bool> UpdateEmployeeExperienceDetails([FromBody] ExperienceDetail experienceDetail)
        {
            bool isUpdated = await employeeInformationApplication.UpdateEmployeeExperienceDetails(experienceDetail);
            return isUpdated;
        }

       

        [Authorize]
        [HttpDelete]
        [Route("DeleteEmployeeFamilyDetails")]
        public async Task<bool> DeleteEmployeeFamilyDetails(int empFamSlno)
        {
            bool isUpdated = await employeeInformationApplication.DeleteEmployeeFamilyDetails(empFamSlno);
            return isUpdated;
        }

        [Authorize]
        [HttpDelete]
        [Route("DeleteEmployeeEducationDetails")]
        public async Task<bool> DeleteEmployeeEducationDetails(int empEduSlno)
        {
            bool isUpdated = await employeeInformationApplication.DeleteEmployeeEducationDetails(empEduSlno);
            return isUpdated;
        }

        [Authorize]
        [HttpDelete]
        [Route("DeleteEmployeeExperienceDetails")]
        public async Task<bool> DeleteEmployeeExperienceDetails(int empExSlno)
        {
            bool isUpdated = await employeeInformationApplication.DeleteEmployeeExperienceDetails(empExSlno);
            return isUpdated;
        }

        [Authorize]
        [HttpGet]
        [Route("GetFamilyBloodRelationDetails")]
        public async Task<List<BloodRelation>> GetFamilyBloodRelationDetails()
        {
            List<BloodRelation> familyBloodRelations = await employeeInformationApplication.GetFamilyBloodRelationDetails();
            return familyBloodRelations;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEducationDetails")]
        public async Task<List<Education>> GetEducationDetails()
        {
            List<Education> educationDetails = await employeeInformationApplication.GetEducationDetails();
            return educationDetails;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEducationCourseDetails")]
        public async Task<List<Education>> GetEducationCourseDetails()
        {
            List<Education> educationDetails = await employeeInformationApplication.GetEducationCourseDetails();
            return educationDetails;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAdditionalQualification")]
        public async Task<List<AdditionalQualification>> GetAdditionalQualification()
        {
            List<AdditionalQualification> additionalQualification = await employeeInformationApplication.GetAdditionalQualification();
            return additionalQualification;
        }

        [Authorize]
        [HttpGet]
        [Route("CourseFilter/{slno}")]
        public async Task<List<Courses>> CourseFilter(int slno)
        {
            List<Courses> courses = await employeeInformationApplication.CourseFilter(slno);
            return courses;
        }


        [Authorize]
        [HttpGet]
        [Route("GetBloodGroup")]
        public async Task<List<BloodGroup>> GetBloodGroup()
        {
            List<BloodGroup> bloodGroup = await employeeInformationApplication.GetBloodGroup();
            return bloodGroup;
        }


        [Authorize]
        [HttpPost]
        [Route("GetReporteeTimeSheet")]
        public async Task<List<BioMetric>> GetReporteeTimeSheet([FromBody] ReporteeTimeSheetSearchCriteria searchCriteria)
        {
            List<BioMetric> projectDetails = await employeeInformationApplication.GetReporteeTimeSheet(searchCriteria);
            return projectDetails;
        }

        [HttpGet]
        [Route("SearchEmployee")]
        public async Task<List<EmployeeProfile>> SearchEmployee(string searchValue)
        {
            List<EmployeeProfile> employeeProfiles = null;
            employeeProfiles = await employeeInformationApplication.SearchEmployee(searchValue);
            foreach (EmployeeProfile profile in employeeProfiles)
            {
                profile.GrossSalary = profile.EmpStatus == 1 ? 0 : profile.GrossSalary;
            }
            return employeeProfiles;
        }

        [Authorize]
        [HttpPost]
        [Route("GetEmployeeReportingStructure")]
        public async Task<List<EmployeeReportingStructure>> GetEmployeeReportingStructure([FromBody] EmployeeReportingSearchCriteria searchCriteria)
        {
            List<EmployeeReportingStructure> projectDetails = await employeeInformationApplication.GetEmployeeReportingStructure(searchCriteria);
            return projectDetails;
        }

        //[Authorize]
        [HttpGet]
        [Route("GetEmployees")]
        public async Task<List<EmployeeDetail>> GetEmployees(int departmentId, int designationId)
        {
            List<EmployeeDetail> employeesInformation = await employeeInformationApplication.GetEmployees(departmentId, designationId);
            return employeesInformation;
        }

        [HttpGet]
        [Route("GetEmployeesByDesignation")]
        public async Task<List<EmployeeProfile>> GetEmployeesByDesignation()
        {
            List<EmployeeProfile> employeeProfiles = null;
            employeeProfiles = await employeeInformationApplication.GetEmployeesByDesignation();
            foreach (EmployeeProfile profile in employeeProfiles)
            {
                profile.GrossSalary = profile.EmpStatus == 1 ? 0 : profile.GrossSalary;
            }
            return employeeProfiles;
        }

        [Authorize]
        [HttpPost]
        [Route("GetEmployeesByBranch")]
        public async Task<List<EmployeeProfile>> GetEmployeesByBranch([FromBody] List<int> selectedBranches)
        {
            List<EmployeeProfile> employeeProfiles = await employeeInformationApplication.GetEmployeesByBranch(selectedBranches);
            return employeeProfiles;
        }
    }
}
