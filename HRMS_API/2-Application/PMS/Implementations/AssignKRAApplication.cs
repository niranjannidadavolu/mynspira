using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.Domain.PMS.Implementations;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Application.Base;

namespace Phoenix.Application.PMS.Implementations
{
    public class AssignKRAApplication : BaseApplication, IAssignKRAApplication
    {
        private readonly IConfiguration configuration;
        private readonly IAssignKRADomain assignKRADomain;

        public AssignKRAApplication(IConfiguration configuration, IDistributedCache redisCache, IAssignKRADomain _assignKRADomain) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            assignKRADomain = _assignKRADomain;
        }

        public async Task<bool> AssignKraInformation(List<KraInformation> assignKRAInformation)
        {
            bool isSaved = false;
            isSaved = await assignKRADomain.AssignKraInformation(assignKRAInformation);
            return isSaved;

        }
        public async Task<bool> AssignKraKpiInformation(List<AssignKraInformation> assignKRAKPIInformation, int createdBy, bool isDraft)
        {
            bool isSaved = false;
            isSaved = await assignKRADomain.AssignKraKpiInformation(assignKRAKPIInformation, createdBy, isDraft);
            return isSaved;
        }
        public async Task<bool> AssignKraInformationToDesignation(List<KraInformation> assignKRAInformationToDesignation)
        {
            bool isSaved = false;
            isSaved = await assignKRADomain.AssignKraInformationToDesignation(assignKRAInformationToDesignation);
            return isSaved;
        }

        public async Task<bool> AssignKraInformationToEmployee(List<KraInformation> assignKRAInformationToEmployee, int createdBy)
        {
            bool isSaved = false;
            isSaved = await assignKRADomain.AssignKraInformationToEmployee(assignKRAInformationToEmployee, createdBy);
            return isSaved;
        }


        public async Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformations(int departmentId, int designationId)
        {
            Tuple<List<KraInformation>, List<AssignKraInformation>> assigedKraInformations = null;
            assigedKraInformations = await assignKRADomain.GetAssignedKpiInformations(departmentId, designationId);
            return assigedKraInformations;
        }

        public async Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformationsOfDesignation(int designationId)
        {
            Tuple<List<KraInformation>, List<AssignKraInformation>> assigedKraInformationsOfDesignation = null;
            assigedKraInformationsOfDesignation = await assignKRADomain.GetAssignedKpiInformationsOfDesignation(designationId);
            return assigedKraInformationsOfDesignation;
        }
        public async Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformationsForEmployee(int employeeSlno)
        {
            Tuple<List<KraInformation>, List<AssignKraInformation>> assigedKraInformationsForEmployee = null;
            assigedKraInformationsForEmployee = await assignKRADomain.GetAssignedKpiInformationsForEmployee(employeeSlno);
            return assigedKraInformationsForEmployee;
        }
    }
}
