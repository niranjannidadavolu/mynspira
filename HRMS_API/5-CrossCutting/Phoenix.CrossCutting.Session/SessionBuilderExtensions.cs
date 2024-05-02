using Microsoft.AspNetCore.Builder;

namespace Phoenix.CrossCutting.Session
{
    public static class SessionBuilderExtensions
    {
        //private static readonly IHostEnvironment _environment = DependencyInjector.GetService<IHostEnvironment>();

        public static void UseCorsCustom(this IApplicationBuilder application)
        {
            application.UseCors("CorsPolicy");
        }

        public static void UseCustomAuthentication(this IApplicationBuilder application)
        {
            application.UseCors(cors => cors.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader().AllowCredentials());
        }

        public static void UseExceptionCustom(this IApplicationBuilder application)
        {
            //if (_environment.EnvironmentName.IsDevelopment())
            //{
            //    application.UseDeveloperExceptionPage();
            //    application.UseDatabaseErrorPage();
            //}
        }

        public static void UseHstsCustom(this IApplicationBuilder application)
        {
            //if (!_environment.IsDevelopment())
            //{
            //    application.UseHsts();
            //}
        }
    }
}
