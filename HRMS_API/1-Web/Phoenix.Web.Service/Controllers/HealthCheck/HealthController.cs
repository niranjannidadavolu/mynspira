using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Phoenix.Web.Service.Base;
using System.Net;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Controllers.HealthCheck
{
    [Route("HealthCheck")]
    public class HealthController : BaseApiController
    {
        private readonly HealthCheckService _healthCheckService;
        public HealthController(HealthCheckService healthCheckService) => _healthCheckService = healthCheckService;


        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var report = await _healthCheckService.CheckHealthAsync();
            return report.Status == HealthStatus.Healthy ? Ok(report) : StatusCode((int)HttpStatusCode.ServiceUnavailable, report);
        }
    }
}
