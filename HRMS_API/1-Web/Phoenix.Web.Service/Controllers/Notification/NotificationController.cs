using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;

using Phoenix.Application.Notification.Interfaces;
using Phoenix.Model.Business.Notification;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Notification
{
    [Route("api/[controller]")]
    [ApiController]
    public class NotificationController : BaseController
    {
        private readonly INotificationApplication NotificationApplication;
        public NotificationController(INotificationApplication NotificationApplication)
        {
            this.NotificationApplication = NotificationApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetNotifications")]
        public async Task<List<NotificationDetail>> GetNotifications(int employeeSlno)
        {
            List<NotificationDetail> notifications = await NotificationApplication.GetNotifications(employeeSlno);
            return notifications;
        }
    }
}
