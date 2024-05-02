using Microsoft.Extensions.Configuration;
using Phoenix.Console.Job.Email;
using Phoenix.Console.Job.LeaveManagement;
using System.Threading;
using System.Timers;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Console.Job
{
    public class AutoApprovalJob
    {
        private readonly ILoggerManager logManager;
        private readonly IConfiguration configuration;
        private readonly ILeaveAutoApprovalService leaveautoApproval;
        System.Timers.Timer timer;

        public AutoApprovalJob(ILeaveAutoApprovalService leaveautoApproval, ILoggerManager logManager, IConfiguration configuration)
        {
            timer = new System.Timers.Timer();
            this.logManager = logManager;
            this.configuration = configuration;
            this.leaveautoApproval = leaveautoApproval;
            timer.Enabled = false;
            timer.Interval = 120000;
            timer.Elapsed += OnTimer_Tick;
        }

        private void OnTimer_Tick(object? sender, System.Timers.ElapsedEventArgs e)
        {
            if (DateTime.Now.Date.Day == 25 && DateTime.Now.Hour == 23 && DateTime.Now.Minute > 50)
            {
                leaveautoApproval.GetAutoApprovals();
            }
        }

        public async Task Run()
        {

            timer.Enabled = true;
            timer.Start();
            //timer = new PeriodicTimer(TimeSpan.FromMinutes(1));
            //await RunJob();
        }

        private async Task RunJob()
        {
            //while (timer)
            //{
                
            //}
        }
    }
}
