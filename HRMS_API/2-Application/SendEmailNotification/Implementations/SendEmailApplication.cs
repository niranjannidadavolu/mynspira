using Phoenix.Application.SendEmailNotification.Interfaces;
using Phoenix.Domain.SendEmailNotification.Interfaces;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.SendEmailNotification;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.SendEmailNotification.Implementations
{
    public class SendEmailApplication: ISendEmailApplication
    {
        private readonly ISendEmailDomain sendemailDomain;
        public SendEmailApplication(ISendEmailDomain sendemailDomain)
        {
            this.sendemailDomain = sendemailDomain;
        }

        public async Task<List<EmailDetails>> GetPendingEmails()
        {
            List<EmailDetails> sendemailDetails = await sendemailDomain.GetPendingEmails();
            return sendemailDetails;
        }
        public async Task<List<EmailDetails>> GetPendingEmails2()
        {
            List<EmailDetails> sendemailDetails = await sendemailDomain.GetPendingEmails2();
            return sendemailDetails;
        }

        public async Task<List<EmailOtpVerification>> GetPendingOTPEmails()
        {
            List<EmailOtpVerification> sendemailDetails = await sendemailDomain.GetPendingOTPEmails();
            return sendemailDetails;
        }

        public async Task UpdateMailSentStatus(List<int> seletedLeaveIds)
        {
            await sendemailDomain.UpdateMailSentStatus(seletedLeaveIds);
        }
        public async Task UpdateSentMailStatus2(List<int> seletedLeaveIds)
        {
            await sendemailDomain.UpdateSentMailStatus2(seletedLeaveIds);
        }
        public async Task UpdateOTPMailSentStatus(List<int> seletedMailId)
        {
            await sendemailDomain.UpdateOTPMailSentStatus(seletedMailId);
        }

        
    }
}
