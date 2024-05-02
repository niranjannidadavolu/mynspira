using Microsoft.Extensions.DependencyInjection;
using Phoenix.CrossCutting.DependencyInjection;

namespace Phoenix.Web.Service
{
    /// <summary>
    /// Class Extensions.
    /// </summary>
    public static class Extensions
    {
        /// <summary>
        /// Adds the dependency injection custom.
        /// </summary>
        /// <param name="services">The services.</param>
        /// <param name="configuration">The configuration.</param>
        public static void AddDependencyInjectionCustom(this IServiceCollection services)
        {
            DependencyInjector.RegisterServices(services);
        }
    }
}
