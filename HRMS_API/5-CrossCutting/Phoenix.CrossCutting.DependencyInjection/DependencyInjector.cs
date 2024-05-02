using System;
using Microsoft.Extensions.DependencyInjection;
using Phoenix.Application.Administration.Implementations;
using Phoenix.Application.Administration.Interfaces;
using Phoenix.Application.Authentication.Implementations;
using Phoenix.Application.Authentication.Interfaces;
using Phoenix.Application.CarLease.Implementations;
using Phoenix.Application.CarLease.Interfaces;
using Phoenix.Application.Districts.Implementations;
using Phoenix.Application.Districts.Interfaces;
using Phoenix.Application.EmployeeInformation.Implementations;
using Phoenix.Application.EmployeeInformation.Interfaces;
using Phoenix.Application.EmployeeVerification.Implementations;
using Phoenix.Application.EmployeeVerification.Interfaces;
using Phoenix.Application.Form16.Implementations;
using Phoenix.Application.Form16.Interfaces;
using Phoenix.Application.HelpDocuments.Implementations;
using Phoenix.Application.HelpDocuments.Interfaces;
using Phoenix.Application.Investment.Implementations;
using Phoenix.Application.Investment.Interfaces;
using Phoenix.Application.InvestmentProofs.Implementations;
using Phoenix.Application.InvestmentProofs.Interfaces;
using Phoenix.Application.LeaveAutoApproval.Implementations;
using Phoenix.Application.LeaveAutoApproval.Interfaces;
using Phoenix.Application.LeaveManagement.Implementations;
using Phoenix.Application.LeaveManagement.Interfaces;
using Phoenix.Application.LeaveManagementReports.Implementations;
using Phoenix.Application.LeaveManagementReports.Interfaces;
using Phoenix.Application.Mandals.Implementations;
using Phoenix.Application.Mandals.Interfaces;
using Phoenix.Application.Masters.Implementations;
using Phoenix.Application.Masters.Interfaces;
using Phoenix.Application.Notification.Implementations;
using Phoenix.Application.Notification.Interfaces;
using Phoenix.Application.NSL.Implementations;
using Phoenix.Application.NSL.Interfaces;
using Phoenix.Application.Payslips.Implementations;
using Phoenix.Application.Payslips.Interfaces;
using Phoenix.Application.PMS.Implementations;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.Application.Reimbursement.Implementations;
using Phoenix.Application.Reimbursement.Interfaces;
using Phoenix.Application.SendEmailNotification.Implementations;
using Phoenix.Application.SendEmailNotification.Interfaces;
using Phoenix.Application.SiteNotification.Implementations;
using Phoenix.Application.SiteNotification.Interfaces;
using Phoenix.Application.States.Implementations;
using Phoenix.Application.States.Interfaces;
using Phoenix.Application.TimeSheet.Implementations;
using Phoenix.Application.TimeSheet.Interfaces;
using Phoenix.Application.TMS.Implementations;
using Phoenix.Application.TMS.Interfaces;
using Phoenix.Application.TravelManagement.Implementations;
using Phoenix.Application.TravelManagement.Interfaces;
using Phoenix.CrossCutting.Logging;
using Phoenix.CrossCutting.Security.Criptography;
using Phoenix.CrossCutting.Security.Hash;
using Phoenix.CrossCutting.Security.JsonWebToken;
using Phoenix.CrossCutting.Utils.Token;
using Phoenix.Domain.Administration.Implementations;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Domain.Authentication.Implementations;
using Phoenix.Domain.Authentication.Interfaces;
using Phoenix.Domain.AutoApproval.Implementations;
using Phoenix.Domain.AutoApproval.Interfaces;
using Phoenix.Domain.CarLease.Implementations;
using Phoenix.Domain.CarLease.Interfaces;
using Phoenix.Domain.Districts.Implementations;
using Phoenix.Domain.Districts.Interfaces;
using Phoenix.Domain.EmployeeInformation.Implementations;
using Phoenix.Domain.EmployeeInformation.Interfaces;
using Phoenix.Domain.EmployeeVerification.Implementations;
using Phoenix.Domain.EmployeeVerification.Interfaces;
using Phoenix.Domain.Form16.Implementations;
using Phoenix.Domain.Form16.Interfaces;
using Phoenix.Domain.HelpDocuments.Implementations;
using Phoenix.Domain.HelpDocuments.Interfaces;
using Phoenix.Domain.Investment.Implementations;
using Phoenix.Domain.Investment.Interfaces;
using Phoenix.Domain.InvestmentProofs.Implementations;
using Phoenix.Domain.InvestmentProofs.Interfaces;
using Phoenix.Domain.LeaveManagement.Implementations;
using Phoenix.Domain.LeaveManagement.Interfaces;
using Phoenix.Domain.LeaveManagementReports.Implementations;
using Phoenix.Domain.LeaveManagementReports.Interfaces;
using Phoenix.Domain.Mandals.Implementations;
using Phoenix.Domain.Mandals.Interfaces;
using Phoenix.Domain.Masters.Implementations;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Domain.Notification.Implementations;
using Phoenix.Domain.Notification.Interfaces;
using Phoenix.Domain.NSL.Implementations;
using Phoenix.Domain.NSL.Interfaces;
using Phoenix.Domain.Payslips.Implementations;
using Phoenix.Domain.Payslips.Interfaces;
using Phoenix.Domain.PMS.Implementations;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Domain.Reimbursement.Implementations;
using Phoenix.Domain.Reimbursement.Interfaces;
using Phoenix.Domain.SendEmailNotification.Implementations;
using Phoenix.Domain.SendEmailNotification.Interfaces;
using Phoenix.Domain.SiteNotification.Implementations;
using Phoenix.Domain.SiteNotification.Interfaces;
using Phoenix.Domain.States.Implementations;
using Phoenix.Domain.States.Interfaces;
using Phoenix.Domain.TimeSheet.Implementations;
using Phoenix.Domain.TimeSheet.Interfaces;
using Phoenix.Domain.TMS.Implementations;
using Phoenix.Domain.TMS.Interfaces;
using Phoenix.Domain.TravelManagement.Implementations;
using Phoenix.Domain.TravelManagement.Interfaces;

namespace Phoenix.CrossCutting.DependencyInjection
{
    public static class DependencyInjector
    {
        private static IServiceProvider ServiceProvider { get; set; }

        private static IServiceCollection Services { get; set; }

        public static T GetService<T>()
        {
            Services ??= RegisterServices();
            ServiceProvider ??= Services.BuildServiceProvider();
            return ServiceProvider.GetService<T>();
        }

        public static IServiceCollection RegisterServices()
        {
            return RegisterServices(new ServiceCollection());
        }
         
        public static IServiceCollection RegisterServices(IServiceCollection services)
        {
            Services = services;
            Services = RegisterApplications(Services);

            Services = RegisterCrossCuttings(Services);

            Services = RegisterDomains(Services);

            Services = RegisterDapperContext(Services);

            Services = RegitsterSingletonServices(services);

            return Services;
        }

        private static IServiceCollection RegisterDapperContext(IServiceCollection services)
        {
            Services = services;
            //Services.AddSingleton<DapperContext>();
            return Services;
        }

        private static IServiceCollection RegisterApplications(IServiceCollection services)
        {
            Services = services;
            Services.AddScoped<IAuthenticationApplication, AuthenticationApplication>();
            Services.AddScoped<IInvestmentApplication, InvestmentApplication>();
            Services.AddScoped<IStatesApplication, StatesApplication>();
            Services.AddScoped<IDistrictsApplication, DistrictsApplication>();
            Services.AddScoped<IMandalsApplication, MandalsApplication>();
            Services.AddScoped<IEmployeeInformationApplication, EmployeeInformationApplication>();
            Services.AddScoped<IReimbursementApplication, ReimbursementApplication>();
            Services.AddScoped<IUserInformationApplication, UserInformationApplication>();
            Services.AddScoped<IForm16Application, Form16Application>();
            Services.AddScoped<IPayslipsApplication, PayslipsApplication>();
            Services.AddScoped<IHelpDocumentsApplication, HelpDocumentsApplication>();
            Services.AddScoped<IRoleInformationApplication, RoleInformationApplication>();
            Services.AddScoped<ICarLeaseApplication, CarLeaseApplication>();
            Services.AddScoped<IModuleInformationApplication, ModuleInformationApplication>();
            Services.AddScoped<ISecurityModuleApplication, SecurityModuleApplication>();
            Services.AddScoped<IInvestmentProofsApplication, InvestmentProofsApplication>();
            Services.AddScoped<ILeaveManagementApplication, LeaveManagementApplication>();
            Services.AddScoped<ILeaveTypeApplication, LeaveTypeApplication>();
            Services.AddScoped<IAttendanceReportTypeApplication, AttendanceReportTypeApplication>();
            Services.AddScoped<ILeaveDayTypeApplication, LeaveDayTypeApplication>();
            Services.AddScoped<ILeaveStatusApplication, LeaveStatusApplication>();
            Services.AddScoped<ILeaveInformationApplication, LeaveInformationApplication>();
            Services.AddScoped<ILeavePolicyInformationApplication, LeavePolicyInformationApplication>();
            Services.AddScoped<ITimeSheetApplication, TimeSheetApplication>();
            Services.AddScoped<INslEmployeeProfileApplication, NslEmployeeProfileApplication>();
            Services.AddScoped<IBranchApplication, BranchApplication>();
            Services.AddScoped<IReportsApplication, ReportsApplication>();
            Services.AddScoped<ILeaveEntitlementApplication, LeaveEntitlementApplication>();
            Services.AddScoped<ILeaveEncashmentApplication, LeaveEncashmentApplication>();
            Services.AddScoped<IEmployeeVerificationApplication, EmployeeVerificationApplication>();
    
            Services.AddScoped<ILocationDetailApplication, LocationDetailApplication>();
            Services.AddScoped<IBranchMappingApplication, BranchMappingApplication>();
            Services.AddScoped<IAssignBranchApplication, AssignBranchApplication>();
            Services.AddScoped<IKraInformationApplication, KraInformationApplication>();
            Services.AddScoped<IKpiInformationApplication, KpiInformationApplication>();
            Services.AddScoped<IKpiInformationApplication, KpiInformationApplication>();
            Services.AddScoped<IVistorCountApplication, VistorCountApplication>();
            Services.AddScoped<IAssignKRAApplication, AssignKRAApplication>();
            Services.AddScoped<IDepartmentInformationApplication, DepartmentInformationApplication>();
            Services.AddScoped<IDesignationInformationApplication, DesignationInformationApplication>();
            Services.AddScoped<IFrequencyInformationApplication, FrequencyInformationApplication>();
            Services.AddScoped<IEmployeePerformanceReviewApplication, EmployeePerformanceReviewApplication>();

            Services.AddScoped<IManagerPerformanceEvaluationApplication, ManagerPerformanceEvaluationApplication>();
            

            return Services;
        }

        private static IServiceCollection RegitsterSingletonServices(IServiceCollection services)
        {

            Services.AddSingleton<IVistorCountDomain, VistorCountDomain>();
            Services.AddSingleton<IVistorCountApplication, VistorCountApplication>();
            Services.AddSingleton<IAppointmentLetterDomain, AppointmentLetterDomain>();
            Services.AddSingleton<IAppointmentLetterApplication, AppointmentLetterApplication>();
            Services.AddSingleton<INotificationApplication, NotificationApplication>();
            Services.AddSingleton<ISiteNotificationApplication, SiteNotificationApplication>();
            Services.AddSingleton<ILeaveAutoApprovalApplication, AutoApprovalApplication>();
            Services.AddSingleton<ISendEmailApplication, SendEmailApplication>();
            Services.AddSingleton<IResignedEmployeeApplication, ResignedEmployeeApplication>();
            Services.AddSingleton<INotificationDomain, NotificationDomain>();
            Services.AddSingleton<ISiteNotificationDomain, SiteNotificationDomain>();
            Services.AddSingleton<IAutoApprovalDomain, AutoApprovalDomain>();
            Services.AddSingleton<ISendEmailDomain, SendEmailDomain>();
            Services.AddSingleton<IResignedEmployeeDomain, ResignedEmployeeDomain>();
            Services.AddSingleton<IEmployeePerformanceReviewDomain, EmployeePerformanceReviewDomain>();

            return Services;
        }
       

        private static IServiceCollection RegisterDomains(IServiceCollection services)
        {
            Services = services;
            Services.AddScoped<IAuthenticationDomain, AuthenticationDomain>();
            Services.AddScoped<IInvestmentDomain, InvestmentDomain>();
            Services.AddScoped<IStatesDomain, StatesDomain>();
            Services.AddScoped<IDistrictsDomain, DistrictsDomain>();
            Services.AddScoped<IMandalsDomain, MandalsDomain>();
            Services.AddScoped<IEmployeeInformationDomain, EmployeeInformationDomain>();
            Services.AddScoped<IReimbursementDomain, ReimbursementDomain>();
            Services.AddScoped<IUserInformationDomain, UserInformationDomain>();
            Services.AddScoped<IPayslipsDomain, PayslipsDomain>();
            Services.AddScoped<IForm16Domain, Form16Domain>();
            Services.AddScoped<IHelpDocumentsDomain, HelpDocumentsDomain>();
            Services.AddScoped<IRoleInformationDomain, RoleInformationDomain>();
            Services.AddScoped<ICarLeaseDomain, CarLeaseDomain>();
            Services.AddScoped<IModuleInformationDomain, ModuleInformationDomain>();
            Services.AddScoped<ISecurityModuleDomain, SecurityModuleDomain>();
            Services.AddScoped<IInvestmentProofsDomain, InvestmentProofsDomain>();
            Services.AddScoped<ILeaveManagementDomain, LeaveManagementDomain>();
            Services.AddScoped<ILeaveTypeDomain, LeaveTypeDomain>();
            Services.AddScoped<IAttendanceReportTypeDomain, AttendanceReportTypeDomain>();
            Services.AddScoped<ILeaveDayTypeDomain, LeaveDayTypeDomain>();
            Services.AddScoped<ILeaveStatusDomain, LeaveStatusDomain>();
            Services.AddScoped<ILeaveInformationDomain, LeaveInformationDomain>();
            Services.AddScoped<ILeavePolicyInformationDomain, LeavePolicyInformationDomain>();
            Services.AddScoped<ITimeSheetDomain, TimeSheetDomain>();
            Services.AddScoped<INslEmployeeProfileDomain, NslEmployeeProfileDomain>();
            Services.AddScoped<IBranchDomain, BranchDomain>();
            Services.AddScoped<IReportsDomain, ReportsDomain>();
            Services.AddScoped<ILeaveEntitlementDomain, LeaveEntitlementDomain>();
            Services.AddScoped<ILeaveEncashmentDomain, LeaveEncashmentDomain>();
            Services.AddScoped<IEmployeeVerificationDomain, EmployeeVerificationDomain>();
         
            Services.AddScoped<ILocationDetailDomain, LocationDetailDomain>();
            Services.AddScoped<IBranchMappingDomain, BranchMappingDomain>();
            Services.AddScoped<IAssignBranchDomain, AssignBranchDomain>();
            Services.AddScoped<IKraInformationDomain, KraInformationDomain>();
            Services.AddScoped<IKpiInformationDomain, KpiInformationDomain>();
            Services.AddScoped<IDepartmentInformationDomain, DepartmentInformationDomain>();
            Services.AddScoped<IDesignationInformationDomain, DesignationInformationDomain>();
            Services.AddScoped<IFrequencyInformationDomain, FrequencyInformationDomain>();
            Services.AddScoped<IAssignKRADomain, AssignKRADomain>();
            Services.AddScoped<IManagerPerformanceEvaluationDomain, ManagerPerformanceEvaluationDomain>();
            Services.AddScoped<IEmployeePerformanceReviewDomain, EmployeePerformanceReviewDomain>();
           

            return Services;
        }
        private static IServiceCollection RegisterCrossCuttings(IServiceCollection services)
        {
            Services = services;
            Services.AddScoped<ICryptography, Cryptography>();
            Services.AddScoped<IHash, Hash>();
            Services.AddScoped<IJsonWebToken, JsonWebToken>();
            Services.AddSingleton<ILoggerManager, LoggerManager>();
            Services.AddSingleton<IJwtAuthManager, JwtAuthManager>();
            //Services.AddSingleton<HealthCheckService>();
            return Services;
        }
    }
}
