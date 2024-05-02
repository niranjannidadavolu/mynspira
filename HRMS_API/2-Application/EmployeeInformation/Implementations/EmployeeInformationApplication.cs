using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Phoenix.Application.Base;
using Phoenix.Application.EmployeeInformation.Interfaces;
using Phoenix.Domain.EmployeeInformation.Interfaces;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.Attendance;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.SearchCriteria.EmployeeInformation;
using Phoenix.Model.Business.SearchCriteria.TimeSheet;
using Microsoft.Reporting.Map.WebForms.BingMaps;
using Phoenix.Model.Business.Masters;
using Phoenix.Application;
using Phoenix.CrossCutting.Logging;
using Phoenix.CrossCutting.Extension.System.String;

namespace Phoenix.Application.EmployeeInformation.Implementations
{
    public class EmployeeInformationApplication : BaseApplication, IEmployeeInformationApplication
    {
        private readonly IEmployeeInformationDomain employeeInformationDomain;
        private readonly IConfiguration configuration;
        private readonly ILoggerManager logManager;

        public EmployeeInformationApplication(IEmployeeInformationDomain employeeInformationDomain, IConfiguration configuration)
            : base(configuration)
        {
            this.employeeInformationDomain = employeeInformationDomain;
            this.configuration = configuration;
        }
        public async Task<EmployeeProfile> GetEmployeeInformation(int employeeSlno)
        {
            EmployeeProfile employeeProfile = null;
            employeeProfile = await employeeInformationDomain.GetEmployeeInformation(employeeSlno);
            return employeeProfile;
        }
        public async Task<List<BioMetric>> GetEmployeeTimeSheet(long employeeId)
        {
            List<BioMetric> attedance = await employeeInformationDomain.GetEmployeeTimeSheet(employeeId);
            return attedance;
        }
        public async Task<List<HolidayInformation>> GetEmployeeHolidays(long employeeId)
        {
            List<HolidayInformation> attedance = await employeeInformationDomain.GetEmployeeHolidays(employeeId);
            return attedance;
        }

        public async Task<PagedResultSet<EmployeeProfile>> SearchEmployeeInformations(EmployeeInformationSearchCriteria searchCriteria)
        {
            PagedResultSet<EmployeeProfile> attedance = await employeeInformationDomain.SearchEmployeeInformations(searchCriteria);
            return attedance;
        }

        public async Task<EmployeeProfile> GetEmployeeMinimumProfile(int employeeSlno)
        {
            EmployeeProfile employeeProfile = await employeeInformationDomain.GetEmployeeMinimumProfile(employeeSlno);
            return employeeProfile;
        }

        public async Task<EmployeeProfile> GetEmployeeProfile(string employeeId)
        {
            EmployeeProfile employeeProfile = await employeeInformationDomain.GetEmployeeProfile(employeeId);
            return employeeProfile;
        }

        public async Task<List<BloodRelation>> GetFamilyBloodRelationDetails()
        {
            List<BloodRelation> familyBloodRelations = await employeeInformationDomain.GetFamilyBloodRelationDetails();
            return familyBloodRelations;
        }

        public async Task<List<Education>> GetEducationDetails()
        {
            List<Education> educationDetails = await employeeInformationDomain.GetEducationDetails();
            return educationDetails;
        }

        public async Task<List<Education>> GetEducationCourseDetails()
        {
            List<Education> educationDetails = await employeeInformationDomain.GetEducationCourseDetails();
            return educationDetails;
        }

        public async Task<List<BloodGroup>> GetBloodGroup()
        {
            List<BloodGroup> bloodGroup = await employeeInformationDomain.GetBloodGroup();
            return bloodGroup;
        }

        public async Task<List<AdditionalQualification>> GetAdditionalQualification()
        {
            List<AdditionalQualification> additionalQualification = await employeeInformationDomain.GetAdditionalQualification();
            return additionalQualification;
        }

        public async Task<List<Courses>> CourseFilter(int slno)
        {
            List<Courses> courses = await employeeInformationDomain.CourseFilter(slno);
            return courses;
        }
        public async Task<bool> GetUpdateEmployeeEmailAddressOtp(UpdadteEmployeeEmail updadteEmployeeEmail)
        {
            bool isUpdated = await employeeInformationDomain.GetUpdateEmployeeEmailAddressOtp(updadteEmployeeEmail);
            return isUpdated;
        }
        public async Task<bool> UpdateEmployeePanDetails(UpdadteEmployeePan updadteEmployeePan)
        {
            bool isUpdated = await employeeInformationDomain.UpdateEmployeePanDetails(updadteEmployeePan);
            return isUpdated;
        }
        public async Task<bool> VerifyUpdateEmployeeEmailAddressOtp(UpdadteEmployeeEmail updadteEmployeeEmail)
        {
            bool isUpdated = await employeeInformationDomain.VerifyUpdateEmployeeEmailAddressOtp(updadteEmployeeEmail);
            return isUpdated;
        }
        public async Task<bool> UpdateEmployeeFamilyDetails(FamilyDetail familyDetails)
        {
            bool isUpdated = await employeeInformationDomain.UpdateEmployeeFamilyDetails(familyDetails);
            return isUpdated;
        }
        public async Task<bool> UpdateEmployeeEducationDetails(EducationDetail educationDetail)
        {
            bool isUpdated = await employeeInformationDomain.UpdateEmployeeEducationDetails(educationDetail);
            return isUpdated;
        }
        public async Task<bool> UpdateEmployeeExperienceDetails(ExperienceDetail experienceDetail)
        {
                    bool isUpdated = await employeeInformationDomain.UpdateEmployeeExperienceDetails(experienceDetail);
            return isUpdated;
        }
        public async Task<bool> UpdateEmployeePanStatus(UpdateEmployeePanStatus updadteEmployeePan)
        {
            bool isUpdated = await employeeInformationDomain.UpdateEmployeePanStatus(updadteEmployeePan);
            return isUpdated;
        }
        public async Task<bool> DeleteEmployeeFamilyDetails(int empFamSlno)
        {
            bool isDeleted = await employeeInformationDomain.DeleteEmployeeFamilyDetails(empFamSlno);
            return isDeleted;
        }
        public async Task<bool> DeleteEmployeeEducationDetails(int empEduSlno)
        {
            bool isDeleted = await employeeInformationDomain.DeleteEmployeeEducationDetails(empEduSlno);
            return isDeleted;
        }
        public async Task<bool> DeleteEmployeeExperienceDetails(int empExSlno)
        {
            bool isDeleted = await employeeInformationDomain.DeleteEmployeeExperienceDetails(empExSlno);
            return isDeleted;
        }

        public async Task<PagedResultSet<EmployeeProfile>> GetMyTeamMembers(EmployeeInformationSearchCriteria searchCriteria)
        {
            PagedResultSet<EmployeeProfile> attedance = await employeeInformationDomain.GetMyTeamMembers(searchCriteria);
            return attedance;
        }

        public async Task<List<BioMetric>> GetReporteeTimeSheet(ReporteeTimeSheetSearchCriteria searchCriteria)
        {
            List<BioMetric> attedance = await employeeInformationDomain.GetReporteeTimeSheet(searchCriteria);
            return attedance;
        }

        public async Task<List<EmployeeProfile>> SearchEmployee(string searchValue)
        {
            List<EmployeeProfile> employeeProfiles = null;

            if(searchValue.IsNotNullOrEmpty())
            {
                employeeProfiles = await employeeInformationDomain.SearchEmployee(searchValue);
            }
            return employeeProfiles;
        }

        public async Task<List<EmployeeProfile>> GetEmployeesByDesignation()
        {
            List<EmployeeProfile> employeeProfiles = null;

            employeeProfiles = await employeeInformationDomain.GetEmployeesByDesignation();
            return employeeProfiles;
        }

        public async Task<List<EmployeeReportingStructure>> GetEmployeeReportingStructure(EmployeeReportingSearchCriteria searchCriteria)
        {
            List<EmployeeReportingStructure> reportingStructure = await employeeInformationDomain.GetEmployeeReportingStructure(searchCriteria);
            return reportingStructure;
        }

       public async Task<List<EmployeeDetail>> GetEmployees(int departmentId, int designationId)
        {
            List<EmployeeDetail> employeeProfiles = null;
            employeeProfiles = await employeeInformationDomain.GetEmployees(departmentId, designationId);
            return employeeProfiles;
        }

       public async Task<List<EmployeeProfile>> GetEmployeesByBranch(List<int> selectedBranches)
       {
           List<EmployeeProfile> employeeProfiles = null;
           employeeProfiles = await employeeInformationDomain.GetEmployeesByBranch(selectedBranches);
           return employeeProfiles;
        }
    }
}
