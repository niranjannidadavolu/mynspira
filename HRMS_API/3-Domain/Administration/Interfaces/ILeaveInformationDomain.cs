
﻿using Phoenix.Model.Business.Administration;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Administration.Interfaces
{
    public interface ILeaveInformationDomain
    {
        Task<List<LeaveInformation>> GetLeaveInformation();
        Task<bool> UpdateLeaveInformation(LeaveInformationSaveReq leaveInformation);
         Task<bool> SavedLeaveInformation(LeaveInformationSaveReq leaveInformation);
        Task<bool> DeleteLeaveInformation(int leaveInformationId);
        Task<List<LeaveTypeInformation>> GetLeaveInformationByOfc(int officeTypeSlno, int? branchSlno);

    }
}
