using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.SendEmailNotification;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.SendEmailNotification.Interfaces
{
    public interface ISendEmailDomain
    {
        Task<List<EmailDetails>> GetPendingEmails();
        Task<List<EmailDetails>> GetPendingEmails2();

        Task<List<EmailOtpVerification>> GetPendingOTPEmails();
        Task UpdateMailSentStatus(List<int> seletedLeaveIds);
        Task UpdateSentMailStatus2(List<int> seletedLeaveIds);
       Task UpdateOTPMailSentStatus(List<int> seletedMailId);
    }
}
