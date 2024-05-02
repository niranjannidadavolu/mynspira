using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Phoenix.CrossCutting.DependencyInjection;

namespace Phoenix.CrossCutting.AspNetCore.Extensions
{
    public static class ApplicationBuilderExtensions
    {
        private static readonly IWebHostEnvironment _environment = DependencyInjector.GetService<IWebHostEnvironment>();

        public static void UseCorsCustom(this IApplicationBuilder application)
        {
            application.UseCors("CorsPolicy");
            application.UseCors("signalr");
            application.UseCors("AllowCorsPolicy");
        }

        public static void UseCustomAuthentication(this IApplicationBuilder application)
        {
            application.UseCors(cors => cors.WithOrigins("http://localhost:5100").AllowAnyMethod().AllowAnyHeader().AllowCredentials().SetIsOriginAllowedToAllowWildcardSubdomains());
        }

        public static void UseExceptionCustom(this IApplicationBuilder application)
        {
            if (_environment.IsDevelopment())
            {
                application.UseDeveloperExceptionPage();
                //application.UseDatabaseErrorPage();
            }
        }

        public static void UseHstsCustom(this IApplicationBuilder application)
        {
            if (!_environment.IsDevelopment())
            {
                application.UseHsts();
            }
        }
    }
}
