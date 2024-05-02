using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.IdentityModel.Tokens;
using Phoenix.CrossCutting.AppException.Extensions;
using Phoenix.CrossCutting.AspNetCore.Extensions;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Logging;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.Validator.LeaveManagement;
using Phoenix.Web.Service.HostedService;
using Phoenix.Web.Service.Hubs;

namespace Phoenix.Web.Service
{
    public class Startup
    {
        private readonly IWebHostEnvironment environment;

        public Startup(IWebHostEnvironment environment)
        {

            var builder = new ConfigurationBuilder()
                .SetBasePath(environment.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile("Settings/ApplicationSettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile("Settings/AwsEmailSettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile("Settings/EMailConfiguration.json", optional: false, reloadOnChange: true)
                .AddJsonFile("Settings/EqualSettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile("Settings/JobSettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile("Settings/JwtTokenConfig.json", optional: false, reloadOnChange: true)
                .AddJsonFile("Settings/NConnectSettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile("Settings/OracleSettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile("Settings/ResignedMailConfiguration.json", optional: false, reloadOnChange: true)
                .AddJsonFile("Settings/S3BucketSettings.json", optional: false, reloadOnChange: true)
                .AddEnvironmentVariables();
            this.Configuration = builder.Build();
            this.environment = environment;
        }

        private IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            IFileProvider physicalProvider = new PhysicalFileProvider(Directory.GetCurrentDirectory());
            services.AddSingleton(physicalProvider);

            services.AddDependencyInjectionCustom();
            services.AddResponseCompression();
            services.AddSignalR();
            services.AddSignalRCore();
            services.AddDefaultAWSOptions(Configuration.GetAWSOptions());
            services.AddAuthentication(opt =>
            {
                opt.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                opt.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
                opt.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(options =>
            {
                options.RequireHttpsMetadata = false;
                options.SaveToken = true;
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidIssuer = this.Configuration["jwtTokenConfig:JwtIssuer"],
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(this.Configuration["jwtTokenConfig:JwtKey"])),
                    ValidAudience = this.Configuration["jwtTokenConfig:Jwtaudience"],
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero,
                };

                options.Events = new JwtBearerEvents
                {
                    OnAuthenticationFailed = context =>
                    {
                        context.Response.StatusCode = StatusCodes.Status401Unauthorized;
                        context.Response.ContentType = "application/json";

                        if (context.Exception.GetType() == typeof(SecurityTokenExpiredException))
                        {
                            context.Response.Headers.Add("x-token-expired", "true");
                        }
                        return Task.CompletedTask;
                    },
                    OnChallenge = context =>
                    {
                        context.HandleResponse();
                        context.Response.StatusCode = StatusCodes.Status401Unauthorized;
                        context.Response.ContentType = "application/json";

                        if (string.IsNullOrEmpty(context.Error))
                        {
                            context.Error = "invalid_token";
                        }

                        if (string.IsNullOrEmpty(context.ErrorDescription))
                        {
                            context.ErrorDescription = "This request requires a valid JWT access token to be provided";
                        }

                        if (context.AuthenticateFailure != null && context.AuthenticateFailure.GetType() == typeof(SecurityTokenExpiredException))
                        {
                            var authenticationException = context.AuthenticateFailure as SecurityTokenExpiredException;
                            context.ErrorDescription = $"The token expired on {authenticationException.Expires.ToString("o")}";
                        }

                        return context.Response.WriteAsync(JsonSerializer.Serialize(new
                        {
                            error = context.Error,
                            error_description = context.ErrorDescription,
                        }));
                    },

                };
            });
            services.AddAuthorization(o =>
            {
                o.AddPolicy("FirstStepCompleted", policy => policy.RequireClaim("FirstStepCompleted"));
                o.AddPolicy("Authorized", policy => policy.RequireClaim("Authorized"));
                o.AddPolicy("Bearer", policy => policy.RequireClaim("Bearer"));
            });
            string corsurl = Configuration.GetValue<string>("ApplicationSettings:CorsUrl");
            string[] allowedCors = corsurl.Split(',');
            services.AddCors(options =>
            {
                options.AddPolicy("AllowMyOrigins",
                    builder =>
                    {
                        builder
                            .WithOrigins(allowedCors)
                            .AllowAnyHeader()
                            .AllowCredentials()
                            .SetIsOriginAllowedToAllowWildcardSubdomains()
                            .AllowAnyMethod();
                    });
            });
            services.AddResponseCaching();
            services.AddMemoryCache();
            services.AddMvcJson();
            services.AddOptions();
            services.AddHealthChecks();
            RegisterLogging(services);
            services = LoadAppSettings(services);
            services.AddSwaggerGenNewtonsoftSupport();
            services.AddDistributedRedisCache(options =>
            {
                options.Configuration = Configuration.GetConnectionString("RedisConnectionString");
                options.InstanceName = "master";
            });
            services.AddSwaggerGen(options =>
            {
                options.CustomSchemaIds(type => type.ToString());
            });
            if (ApplicationSettings.Current.RunJobs)
            {
                InstantiateCronJobs(services);
            }
            //services.AddFluentValidationAutoValidation();
            //services.AddScoped<IValidator<EmployeeLeave>, LeaveInformationValidator>();

            services.AddHostedService<NotificationService>();
            services.AddHostedService<VisitorCountService>();
            services.AddHostedService<EmailNotificationService>();
            services.AddHostedService<GenerateEmailOTPService>();
            services.AddHostedService<AppointmentLettersService>();
        }
        public void InitializeDapper(string @namespace)
        {

        }
        private IServiceCollection LoadAppSettings(IServiceCollection services)
        {
            var appConfig = new ApplicationSettings();
            this.Configuration.Bind("ApplicationSettings", appConfig);
            services.AddSingleton(appConfig);

            var nConnectSettings = new NConnectSettings();
            this.Configuration.Bind("NConnectSettings", nConnectSettings);
            services.AddSingleton(nConnectSettings);

            List<OracleSettings> dbConfig = Configuration.GetSection("OracleSettings").Get<List<OracleSettings>>();
            OracleSettings oracleSettings = new OracleSettings();
            foreach (var item in dbConfig)
            {
                if(oracleSettings.Settings ==  null)
                {
                    oracleSettings.Settings=new List<OracleSettings>();
                }
                oracleSettings.Settings.Add(item);
            }

            this.Configuration.Bind("OracleSettings", oracleSettings);
            services.AddSingleton(dbConfig);

            var mailConfig = new MailSettings();
            this.Configuration.Bind("MailSettings", mailConfig);
            services.AddSingleton(mailConfig);

            var emailConfiguration = new EmailConfiguration();
            this.Configuration.Bind("EmailConfiguration", emailConfiguration);
            services.AddSingleton(emailConfiguration);

            var s3BucketSettings = new S3BucketSettings();
            this.Configuration.Bind("S3BucketSettings", s3BucketSettings);
            services.AddSingleton(s3BucketSettings);


            var resignedEmailConfiguration = new ResignedEmailConfiguration();
            this.Configuration.Bind("ResignedMailConfiguration", resignedEmailConfiguration);
            services.AddSingleton(resignedEmailConfiguration);

            var jwtTokenConfig = new JwtTokenConfiguration();
            this.Configuration.Bind("jwtTokenConfig", jwtTokenConfig);
            services.AddSingleton(jwtTokenConfig);

            var awsEmailSettings = new AwsEmailSettings();
            this.Configuration.Bind("awsEmailSettings", awsEmailSettings);
            services.AddSingleton(awsEmailSettings);

            var jobSettings = new JobSettings();
            this.Configuration.Bind("jobSettings", jobSettings);
            services.AddSingleton(jobSettings);

            var equalSettings = new EqualSettings();
            this.Configuration.Bind("equalSettings", equalSettings);
            services.AddSingleton(equalSettings);


            return services;

        }
        public void Configure(IApplicationBuilder application, IWebHostEnvironment environment, ILoggerManager logger)
        {
            application.UseRouting();
            application.UseExceptionCustom();
            application.ConfigureCustomExceptionMiddleware();
            application.UseResponseCompression();
            application.UseCors("AllowMyOrigins");
            application.UseAuthentication();
            application.UseAuthorization();
            application.UseHstsCustom();
            application.UseHttpsRedirection();
            application.UseStaticFiles();
            application.UseResponseCaching();
            application.UseHealthChecksUI();
            application.UseEndpoints(routes =>
            {
                routes.MapControllers();
                routes.MapHub<SignalrHub>("/signalrhub");
            });
            application.UseSwagger()
                        .UseSwaggerUI(c =>
                        {
                            c.SwaggerEndpoint("/swagger/v1/swagger.json", "My Web API");
                            c.ConfigObject.AdditionalItems.Add("syntaxHighlight", false);
                            c.ConfigObject.AdditionalItems.Add("theme", "agate");
                        });
        }
        private void RegisterLogging(IServiceCollection services)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
        }
        private void InstantiateCronJobs(IServiceCollection services)
        {
        }
    }
}
