using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Caching.Distributed;
using Phoenix.Model.Business.Employee;
using System.Threading.Tasks;
using Phoenix.Domain.EmployeeInformation.Interfaces;
using Phoenix.Database.Repository.Employee;
using System.Collections.Generic;
using System.Linq;
using Phoenix.Model.Business.Attendance;
using Phoenix.Database.Repository.Attendance;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Model.Business.SearchCriteria.EmployeeInformation;
using Phoenix.Model.Business.SearchCriteria.TimeSheet;
using Phoenix.Domain.Base;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Logging;
using Phoenix.CrossCutting.Security.Criptography;

namespace Phoenix.Domain.EmployeeInformation.Implementations
{
    public class EmployeeInformationDomain : BaseDomain, IEmployeeInformationDomain
    {
        private readonly IUserInformationDomain userDomain;
        private readonly IDistributedCache redisCache;
        private readonly IConfiguration configuration;

        private readonly ICryptography cryptography;
        private readonly ILoggerManager logger;

        public EmployeeInformationDomain(IDistributedCache redisCache, IConfiguration configuration, ILoggerManager logger)
            : base(configuration, redisCache)
        {
            this.redisCache = redisCache;
            this.configuration = configuration;
            this.logger = logger;

        }
        public async Task<EmployeeProfile> GetEmployeeInformation(int employeeSlno)
        {
            EmployeeProfile employeeProfile = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(configuration, redisCache))
            {
                employeeProfile = await repository.GetEmployeeProfile(employeeSlno);
            }
            return employeeProfile;
        }

        public async Task<List<BioMetric>> GetEmployeeTimeSheet(long employeeId)
        {
            List<BioMetric> attendance = null;
            using (BioMetricRepository repository = new BioMetricRepository(this.configuration, this.redisCache, this.logger))
            {
                attendance = await repository.GetEmployeeTimeSheet(employeeId);
            }
            return attendance;
        }

        public async Task<List<HolidayInformation>> GetEmployeeHolidays(long employeeId)
        {
            List<HolidayInformation> holidays = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                holidays = await repository.GetEmployeeHolidays(employeeId);
            }
            return holidays;
        }

        public async Task<PagedResultSet<EmployeeProfile>> SearchEmployeeInformations(EmployeeInformationSearchCriteria searchCriteria)
        {
            PagedResultSet<EmployeeProfile> holidays = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                holidays = await repository.SearchEmployeeInformations(searchCriteria);
            }
            return holidays;
        }

        public async Task<EmployeeProfile> GetEmployeeMinimumProfile(int employeeSlno)
        {
            EmployeeProfile holidays = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                holidays = await repository.GetEmployeeMinimumProfile(employeeSlno);
            }
            return holidays;
        }

        public async Task<EmployeeProfile> GetEmployeeProfile(string employeeId)
        {
            EmployeeProfile holidays = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                holidays = await repository.GetEmployeeProfile(employeeId);
            }
            return holidays;
        }


        public async Task<List<BloodRelation>> GetFamilyBloodRelationDetails()
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.GetFamilyBloodRelationDetails();
            }
        }

        public async Task<List<Education>> GetEducationDetails()
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.GetEducationDetails();
            }
        }

        public async Task<List<Education>> GetEducationCourseDetails()
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.GetEducationCourseDetails();
            }
        }

        public async Task<List<BloodGroup>> GetBloodGroup()
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.GetBloodGroup();
            }
        }

        public async Task<List<AdditionalQualification>> GetAdditionalQualification()
        {
            List<AdditionalQualification> additionalQualification = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                additionalQualification = await repository.GetAdditionalQualification();
            }
            return additionalQualification;
        }
        public async Task<List<Courses>> CourseFilter(int slno)
        {
            List<Courses> courses = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                courses = await repository.CourseFilter(slno);
            }
            return courses;
        }
        public async Task<bool> GetUpdateEmployeeEmailAddressOtp(UpdadteEmployeeEmail updadteEmployeeEmail)
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.GetUpdateEmployeeEmailAddressOtp(updadteEmployeeEmail);
            }
        }
        public async Task<bool> UpdateEmployeePanDetails(UpdadteEmployeePan updadteEmployeePan)
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.UpdateEmployeePanDetails(updadteEmployeePan);
            }
        }
        public async Task<bool> VerifyUpdateEmployeeEmailAddressOtp(UpdadteEmployeeEmail updadteEmployeeEmail)
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.VerifyUpdateEmployeeEmailAddressOtp(updadteEmployeeEmail);
            }
        }
        public async Task<bool> UpdateEmployeeFamilyDetails(FamilyDetail familyDetails)
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.UpdateEmployeeFamilyDetails(familyDetails);
            }
        }


        public async Task<bool> UpdateEmployeeEducationDetails(EducationDetail educationDetail)
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.UpdateEmployeeEducationDetails(educationDetail);
            }
        }

        public async Task<bool> UpdateEmployeeExperienceDetails(ExperienceDetail experienceDetail)
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.UpdateEmployeeExperienceDetails(experienceDetail);
            }
        }
        public async Task<bool> UpdateEmployeePanStatus(UpdateEmployeePanStatus updadteEmployeePan)
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.UpdateEmployeePanStatus(updadteEmployeePan);
            }
        }
        public async Task<bool> DeleteEmployeeFamilyDetails(int empFamSlno)
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.DeleteEmployeeFamilyDetails(empFamSlno);
            }
        }

        public async Task<bool> DeleteEmployeeEducationDetails(int empEduSlno)
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.DeleteEmployeeEducationDetails(empEduSlno);
            }
        }

        public async Task<bool> DeleteEmployeeExperienceDetails(int empExSlno)
        {
            using (EmployeeInformationRepository repository = new(this.configuration, this.redisCache))
            {
                return await repository.DeleteEmployeeExperienceDetails(empExSlno);
            }
        }

        public async Task<PagedResultSet<EmployeeProfile>> GetMyTeamMembers(EmployeeInformationSearchCriteria searchCriteria)
        {
            PagedResultSet<EmployeeProfile> holidays = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                holidays = await repository.GetMyTeamMembers(searchCriteria);
            }
            return holidays;
        }

        public async Task<List<BioMetric>> GetReporteeTimeSheet(ReporteeTimeSheetSearchCriteria searchCriteria)
        {
            List<BioMetric> attendance = null;
            using (BioMetricRepository repository = new BioMetricRepository(this.configuration, this.redisCache, this.logger))
            {
                attendance = await repository.GetReporteeTimeSheet(searchCriteria);
            }
            return attendance;
        }

        public async Task<List<EmployeeProfile>> SearchEmployee(string searchValue)
        {
            List<EmployeeProfile> employeeProfiles = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                employeeProfiles = await repository.SearchEmployee(searchValue);
            }
            return employeeProfiles;
        }

        public async Task<List<EmployeeReportingStructure>> GetEmployeeReportingStructure(EmployeeReportingSearchCriteria searchCriteria)
        {
            List<EmployeeReportingStructure> reportingStructures = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                reportingStructures = await repository.GetEmployeeReportingStructure(searchCriteria);
            }
            return reportingStructures;
        }

        public async Task<List<EmployeeProfile>> GetEmployeesByDesignation()
        {
            List<EmployeeProfile> employeeProfiles = null;
            List<int> designations = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                designations = ApplicationSettings.Current.LocalTravelDesignations.ToList();
                employeeProfiles = await repository.GetEmployeesByDesignation(designations);
            }
            return employeeProfiles;
        }

        public async Task<List<EmployeeDetail>> GetEmployees(int departmentId, int designationId)
        {
            List<EmployeeDetail> employeeProfiles = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                employeeProfiles = await repository.GetEmployees(departmentId, designationId);
            }
            return employeeProfiles;
        }

        public async Task<List<EmployeeProfile>> GetEmployeesByBranch(List<int> selectedBranches)
        {
            List<EmployeeProfile> employeeProfiles = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                employeeProfiles = await repository.GetEmployeesByBranch(selectedBranches);
            }
            return employeeProfiles;
        }

        public async Task<EmployeeProfile> GetEmployeeDetails(string employeeId)
        {
            throw new System.NotImplementedException();
        }
    }
}
