
using System.IO;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using NLog;
using Phoenix.Application.SendEmailNotification.Implementations;
using Phoenix.Application.LeaveAutoApproval.Implementations;
using Phoenix.Application.LeaveAutoApproval.Interfaces;
using Phoenix.Application.SendEmailNotification.Interfaces;
using Phoenix.Console.Job.Email;
using Phoenix.Domain.SendEmailNotification.Implementations;
using Phoenix.Domain.AutoApproval.Implementations;
using Phoenix.Domain.AutoApproval.Interfaces;
using Phoenix.Domain.SendEmailNotification.Interfaces;
using NLog;
using Phoenix.Console.Job.LeaveManagement;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Console.Job
{
    class Program
    {
        private static IConfiguration Configuration;
        private static void Main(string[] args)
        {
            IServiceCollection services = new ServiceCollection();
            services = ConfigureServices(services);
            var serviceProvider = services.BuildServiceProvider();
            //serviceProvider.GetService<SendEmailJob>().Run();
            serviceProvider.GetService<AutoApprovalJob>().Run();
        }

        private static IServiceCollection ConfigureServices(IServiceCollection serviceCollection)
        {
            LoadConfiguration();

            serviceCollection.AddSingleton<ILeaveAutoApprovalApplication, AutoApprovalApplication>();
            serviceCollection.AddScoped<IAutoApprovalDomain, AutoApprovalDomain>();
            serviceCollection.AddSingleton<ISendEmailApplication, SendEmailApplication>();
            serviceCollection.AddScoped<ISendEmailDomain, SendEmailDomain>();
            serviceCollection.AddSingleton<IEmailNotificationService, EmailNotificationService>();
            serviceCollection.AddSingleton<ILeaveAutoApprovalService, LeaveAutoApprovalService>();
            serviceCollection.AddSingleton(Configuration);
            RegisterLogging(serviceCollection);
            serviceCollection.AddSingleton<ILoggerManager, LoggerManager>();
            serviceCollection = LoadAppSettings(serviceCollection);
            serviceCollection.AddSingleton<ILoggerManager, LoggerManager>();
            serviceCollection.AddTransient<SendEmailJob>();
            serviceCollection.AddTransient<AutoApprovalJob>();
            return serviceCollection;
        }
        private static IServiceCollection LoadAppSettings(IServiceCollection services)
        {
            var appConfig = new ApplicationSettings();
            Configuration.Bind("ApplicationSettings", appConfig);
            services.AddSingleton(appConfig);

            var nConnectSettings = new NConnectSettings();
            Configuration.Bind("NConnectSettings", nConnectSettings);
            services.AddSingleton(nConnectSettings);

            var dbConfig = new OracleSettings();
            Configuration.Bind("OracleSettings", dbConfig);
            services.AddSingleton(dbConfig);

            var mailConfig = new MailSettings();
            Configuration.Bind("MailSettings", mailConfig);
            services.AddSingleton(mailConfig);


            return services;
        }
        private static void RegisterLogging(IServiceCollection services)
        {
            services.AddSingleton<Logger>();
        }

        public static void LoadConfiguration()
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);
            Configuration = builder.Build();
            LogManager.LoadConfiguration(string.Concat(Directory.GetCurrentDirectory(), "/nlog.config"));
        }
    }
}
