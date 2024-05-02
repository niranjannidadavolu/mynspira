using Phoenix.Model.Business.Attendance;
using Phoenix.Model.Business.Employee;

using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Domain.Base;
using Phoenix.Model.Business.SearchCriteria.EmployeeInformation;
using Phoenix.Model.Business.SearchCriteria.TimeSheet;
using Phoenix.Infrastructure.BusinessModel;

namespace Phoenix.Domain.EmployeeInformation.Interfaces
{
    public interface IEmployeeInformationDomain : IBaseDomain
    {
        Task<EmployeeProfile> GetEmployeeInformation(int employeeSlno);
        Task<List<BioMetric>> GetEmployeeTimeSheet(long employeeId);
        Task<List<HolidayInformation>> GetEmployeeHolidays(long employeeId);
        Task<PagedResultSet<EmployeeProfile>> SearchEmployeeInformations(EmployeeInformationSearchCriteria searchCriteria);
        Task<EmployeeProfile> GetEmployeeMinimumProfile(int employeeSlno);
        Task<List<BloodRelation>> GetFamilyBloodRelationDetails();
        Task<List<Education>> GetEducationDetails();
        Task<List<Education>> GetEducationCourseDetails();        
        Task<List<BloodGroup>> GetBloodGroup();
        Task<bool> UpdateEmployeeFamilyDetails(FamilyDetail familyDetails);
        Task<bool> GetUpdateEmployeeEmailAddressOtp(UpdadteEmployeeEmail updadteEmployeeEmail);
        Task<bool> UpdateEmployeePanDetails(UpdadteEmployeePan updadteEmployeePan);
        Task<bool> VerifyUpdateEmployeeEmailAddressOtp(UpdadteEmployeeEmail updadteEmployeeEmail);
        Task<bool> UpdateEmployeeEducationDetails(EducationDetail educationDetail);
        Task<bool> UpdateEmployeeExperienceDetails(ExperienceDetail experienceDetail);
        Task<bool> UpdateEmployeePanStatus(UpdateEmployeePanStatus updadteEmployeePan);
        Task<bool> DeleteEmployeeFamilyDetails(int empFamSlno);
        Task<bool> DeleteEmployeeEducationDetails(int empEduSlno);
        Task<bool> DeleteEmployeeExperienceDetails(int empExSlno);
        Task<List<AdditionalQualification>> GetAdditionalQualification();
        Task<List<Courses>> CourseFilter(int slno);
        Task<PagedResultSet<EmployeeProfile>> GetMyTeamMembers(EmployeeInformationSearchCriteria searchCriteria);
        Task<EmployeeProfile> GetEmployeeProfile(string employeeId);
        Task<List<BioMetric>> GetReporteeTimeSheet(ReporteeTimeSheetSearchCriteria searchCriteria);
        Task<List<EmployeeProfile>> SearchEmployee(string searchValue);
        Task<List<EmployeeReportingStructure>> GetEmployeeReportingStructure(EmployeeReportingSearchCriteria searchCriteria);
        Task<List<EmployeeProfile>> GetEmployeesByDesignation();
        Task<List<EmployeeDetail>> GetEmployees(int departmentId, int designationId);
        Task<List<EmployeeProfile>> GetEmployeesByBranch(List<int> selectedBranches);
    }
}
