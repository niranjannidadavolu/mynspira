using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.PMS;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Domain.Base;
//using Phoenix.Model.Database.PerfirmanceManagement;


namespace Phoenix.Domain.PMS.Implementations
{
    public class AssignKRADomain : BaseDomain, IAssignKRADomain
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public AssignKRADomain(IConfiguration configuration, IDistributedCache redisCache) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<bool> AssignKraInformation(List<KraInformation> assignKRAInformation)
        {

            bool isSaved = false;
            using (AssignKRARepositry assignKRARepositry = new AssignKRARepositry(this.configuration, this.redisCache))
            {
                isSaved = await assignKRARepositry.AssignKraInformation(assignKRAInformation);
            }

            return isSaved;
        }
        public async Task<bool> AssignKraKpiInformation(List<AssignKraInformation> assignKRAKPIInformation, int createdBy, bool isDraft)
        {
            bool isSaved = false;
            using (AssignKRARepositry assignKRARepositry = new AssignKRARepositry(this.configuration, this.redisCache))
            {
                isSaved = await assignKRARepositry.AssignKraKpiInformation(assignKRAKPIInformation,  createdBy, isDraft);
            }
            return isSaved;
        }

        public async Task<bool> AssignKraInformationToDesignation(List<KraInformation> assignKRAInformationToDesignation)
        {
            bool isSaved = false;
            using (AssignKRARepositry assignKRARepositry = new AssignKRARepositry(this.configuration, this.redisCache))
            {
                isSaved = await assignKRARepositry.AssignKraInformationToDesignation(assignKRAInformationToDesignation);
            }
            return isSaved;
        }

        public async Task<bool> AssignKraInformationToEmployee(List<KraInformation> assignKRAInformationToEmployee, int createdBy)
        {
            bool isSaved = false;
            using (AssignKRARepositry assignKRARepositry = new AssignKRARepositry(this.configuration, this.redisCache))
            {
                isSaved = await assignKRARepositry.AssignKraInformationToEmployee(assignKRAInformationToEmployee, createdBy);
            }
            return isSaved;
        }

        public async Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformations(int departmentId, int designationId)
        {
            Tuple<List<KraInformation>, List<AssignKraInformation>> assigedKraInformations = null;
            using (AssignKRARepositry assignKRARepositry = new AssignKRARepositry(this.configuration, this.redisCache))
            {
                assigedKraInformations = await assignKRARepositry.GetAssignedKpiInformations(departmentId, designationId);
            }
            return assigedKraInformations;
        }

        public async Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformationsOfDesignation(int designationId)
        {
            Tuple<List<KraInformation>, List<AssignKraInformation>> assigedKraInformationsofDesignation = null;
            using (AssignKRARepositry assignKRARepositry = new AssignKRARepositry(this.configuration, this.redisCache))
            {
                assigedKraInformationsofDesignation = await assignKRARepositry.GetAssignedKpiInformationsOfDesignation(designationId);
            }
            return assigedKraInformationsofDesignation;
        }
        public async Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformationsForEmployee(int employeeSlno)
        {
            Tuple<List<KraInformation>, List<AssignKraInformation>> assigedKraInformationsForEmployee = null;
            using (AssignKRARepositry assignKRARepositry = new AssignKRARepositry(this.configuration, this.redisCache))
            {
                assigedKraInformationsForEmployee = await assignKRARepositry.GetAssignedKpiInformationsForEmployee(employeeSlno);
            }
            return assigedKraInformationsForEmployee;
        }
    }
}