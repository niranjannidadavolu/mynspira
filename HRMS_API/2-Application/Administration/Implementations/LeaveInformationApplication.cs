
using Phoenix.Application.Administration.Interfaces;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Model.Business.Administration;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Administration.Implementations
{
    public class LeaveInformationApplication : ILeaveInformationApplication
    {
        private readonly ILeaveInformationDomain leaveInformationDomain;
        public LeaveInformationApplication(ILeaveInformationDomain leaveInformationDomain)
        {
            this.leaveInformationDomain = leaveInformationDomain;
        }

        public async Task<List<LeaveInformation>> GetLeaveInformation()
        {
            List<LeaveInformation> leaveinformationdetails = await leaveInformationDomain.GetLeaveInformation();
            return leaveinformationdetails;
        }

        public async Task<bool> UpdateLeaveInformation(LeaveInformationSaveReq leaveInformation)
        {
            bool isleaveinfoSaved = await leaveInformationDomain.UpdateLeaveInformation(leaveInformation);
            return isleaveinfoSaved;
        }
        public async Task<bool> SavedLeaveInformation(LeaveInformationSaveReq leaveInformation)
        {
            bool isleaveinfoSaved = await leaveInformationDomain.SavedLeaveInformation(leaveInformation);
            return isleaveinfoSaved;
        }
        public async Task<bool> DeleteLeaveInformation(int leaveInformationId)
        {
            bool isleaveinfoSaved = await leaveInformationDomain.DeleteLeaveInformation(leaveInformationId);
            return isleaveinfoSaved;
        }
        public async Task<List<LeaveTypeInformation>> GetLeaveInformationByOfc(int officeTypeSlno, int? branchSlno)
        {
            List<LeaveTypeInformation> leaveTypeInformation = await leaveInformationDomain.GetLeaveInformationByOfc(officeTypeSlno, branchSlno);
            return leaveTypeInformation;
        }

    }
}
