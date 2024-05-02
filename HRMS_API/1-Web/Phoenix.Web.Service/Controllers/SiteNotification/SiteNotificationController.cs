using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.LeaveManagement.Implementations;
using Phoenix.Application.Notification.Implementations;
using Phoenix.Application.Notification.Interfaces;
using Phoenix.Application.SendEmailNotification.Interfaces;
using Phoenix.Application.SiteNotification.Interfaces;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.Notification;
using Phoenix.Model.Business.SendEmailNotification;
using Phoenix.Model.Business.SiteNotification;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Controllers.SiteNotification
{
    [Route("api/[controller]")]
    [ApiController]
    public class SiteNotificationController : ControllerBase
    {
        private readonly ISiteNotificationApplication SiteNotificationApplication;
        private readonly IResignedEmployeeApplication resignedEmployeeApplication;

        public SiteNotificationController(ISiteNotificationApplication SiteNotificationApplication,
            IResignedEmployeeApplication resignedEmployeeApplication)
        {
            this.SiteNotificationApplication = SiteNotificationApplication;
            this.resignedEmployeeApplication = resignedEmployeeApplication;

        }

        [Authorize]
        [HttpGet]
        [Route("GetSiteNotifications")]
        public async Task<SiteNotificationDetails> GetNotifications(int officeTypeslno)
        {
            SiteNotificationDetails sitenotifications = await SiteNotificationApplication.GetSiteNotifications(officeTypeslno);
            return sitenotifications;
        }

        [HttpPost]
        [Route("SaveEmployeeFeedback")]
        public async Task<EmpLeaveResponse> SaveEmployeeFeedback([FromBody] EmployeeFeedbackDetails empFeedbackRequest)
        {
            EmpLeaveResponse saveLeaveRequest = await SiteNotificationApplication.SaveEmployeeFeedback(empFeedbackRequest);
            return saveLeaveRequest;
        }
        
        [HttpGet]
        [Route("GetResignedEmployees")]
        public async Task<List<ResignedEmployee>> GetResignedEmployees()
        {
            List < ResignedEmployee> sitenotifications = await resignedEmployeeApplication.GetResignedEmployees();
            return sitenotifications;
        }
    }
}
