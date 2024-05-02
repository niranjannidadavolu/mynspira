using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.SendEmailNotification;
using Phoenix.Domain.SendEmailNotification.Interfaces;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.SendEmailNotification;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.SendEmailNotification.Implementations
{
    public class SendEmailDomain : ISendEmailDomain
    {
        private readonly IConfiguration configuration;
        public SendEmailDomain(IConfiguration configuration) {
            this.configuration = configuration;
        }

        public async Task<List<EmailDetails>> GetPendingEmails()
        {
            using (SendEmailRepository sendEmailRespository = new(configuration))
            {
                return await sendEmailRespository.GetPendingEmails();
            }
        }
        public async Task<List<EmailDetails>> GetPendingEmails2()
        {
            using (SendEmailRepository sendEmailRespository = new(configuration))
            {
                return await sendEmailRespository.GetPendingEmails2();
            }
        }

        public async Task<List<EmailOtpVerification>> GetPendingOTPEmails()
        {
            using (SendEmailRepository sendEmailRespository = new(configuration))
            {
                return await sendEmailRespository.GetPendingOTPEmails();
            }
        }

        public async Task UpdateMailSentStatus(List<int> seletedLeaveIds)
        {
            using (SendEmailRepository sendEmailRespository = new(configuration))
            {
                await sendEmailRespository.UpdateMailSentStatus(seletedLeaveIds);
            }
        }
        public async Task UpdateSentMailStatus2(List<int> seletedLeaveIds)
        {
            using (SendEmailRepository sendEmailRespository = new(configuration))
            {
                await sendEmailRespository.UpdateSentMailStatus2(seletedLeaveIds);
            }
        }

        public async Task UpdateOTPMailSentStatus(List<int> seletedMailId)
        {
            using (SendEmailRepository sendEmailRespository = new(configuration))
            {
                await sendEmailRespository.UpdateOTPMailSentStatus(seletedMailId);
            }
        }
    }
}
