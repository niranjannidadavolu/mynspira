using Phoenix.Model.Business.SendEmailNotification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Console.Job.LeaveManagement
{
    public interface ILeaveAutoApprovalService
    {
        Task GetAutoApprovals();
    }
}
