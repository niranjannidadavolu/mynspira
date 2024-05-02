using Phoenix.Model.Business.SendEmailNotification;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Hubs
{
    public interface ISendingEmail
    {
        Task DisplayMessage(string message);
        Task UpdateProgressBar(int percentage);
        Task DisplayProgressMessage(string message);
        Task ShowNotifications(List<EmailDetails> sendemails);
    }
}
