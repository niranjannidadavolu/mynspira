using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Base;
using Phoenix.Model.Business.Administration;

namespace Phoenix.Application.Administration.Interfaces
{
    public interface IModuleInformationApplication : IBaseApplication
    {
        Task<List<SecurityModule>> LoadActiveModuleInformations();
    }
}
