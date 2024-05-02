using Phoenix.Model.Business.Administration;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Domain.Base;

namespace Phoenix.Domain.Administration.Interfaces
{
    public interface IModuleInformationDomain : IBaseDomain
    {
        Task<List<SecurityModule>> LoadActiveModuleInformations();
    }
}
