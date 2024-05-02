using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.PMS.Implementations;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.Domain.PMS.Implementations;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Controllers.PerformanceManagement
{
    [Route("api/[controller]")]
    [ApiController]
    public class AssignKRAController : ControllerBase
    {
        private readonly IAssignKRAApplication assignKRAApplication;

        public AssignKRAController(IAssignKRAApplication _assignKRAApplication)
        {
            assignKRAApplication = _assignKRAApplication;
        }

        [Authorize]
        [HttpPost]
        [Route("AssignKraInformation")]

        public async Task<bool> AssignKraInformation([FromBody]List<KraInformation> assignKRAInformation)
        {
            bool isSaved = false;
            isSaved = await assignKRAApplication.AssignKraInformation(assignKRAInformation);
            return isSaved;
        }

        [Authorize]
        [HttpPost]
        [Route("AssignKpiInformations")]

        public async Task<bool> AssignKpiInformations([FromBody]List<AssignKraInformation> kpiInformations, int createdBy, bool isDraft)
        {
            bool isSaved = false;
            isSaved = await assignKRAApplication.AssignKraKpiInformation(kpiInformations, createdBy, isDraft);
            return isSaved;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAssignedKpiInformations")]

        public async Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformations(int departmentId, int designationId)
        {
            Tuple<List<KraInformation>, List<AssignKraInformation>> kpiInformations = await assignKRAApplication.GetAssignedKpiInformations(departmentId, designationId);
            return kpiInformations;

        }

        [Authorize]
        [HttpGet]
        [Route("GetAssignedKpiInformationsOfDesignation")]

        public async Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformationsOfDesignation(int designationId)
        {
            Tuple<List<KraInformation>, List<AssignKraInformation>> assigedKraInformationsOfDesignation = null;
            assigedKraInformationsOfDesignation = await assignKRAApplication.GetAssignedKpiInformationsOfDesignation(designationId);
            return assigedKraInformationsOfDesignation;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAssignedKpiInformationsForEmployee")]

        public async Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformationsForEmployee(int employeeSlno)
        {
            Tuple<List<KraInformation>, List<AssignKraInformation>> assigedKraInformationsForEmployee = null;
            assigedKraInformationsForEmployee = await assignKRAApplication.GetAssignedKpiInformationsForEmployee(employeeSlno);
            return assigedKraInformationsForEmployee;
        }

        [Authorize]
        [HttpPost]
        [Route("AssignKraInformationToDesignation")]

        public async Task<bool> AssignKraInformationToDesignation([FromBody] List<KraInformation> assignKRAInformationToDesignation)
        {
            bool isSaved = false;
            isSaved = await assignKRAApplication.AssignKraInformationToDesignation(assignKRAInformationToDesignation);
            return isSaved;
        }

        [Authorize]
        [HttpPost]
        [Route("AssignKraInformationToEmployee")]

        public async Task<bool> AssignKraInformationToEmployee([FromBody] List<KraInformation> assignKRAInformationToEmployee, int createdBy)
        {
            bool isSaved = false;
            isSaved = await assignKRAApplication.AssignKraInformationToEmployee(assignKRAInformationToEmployee, createdBy);
            return isSaved;
        }

    }
}
