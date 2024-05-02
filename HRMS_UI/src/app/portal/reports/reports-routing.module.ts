import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'leave-report', loadChildren: () => import('./leave-report/leave-report.module').then(m => m.LeaveReportModule)
  },
  {
    path: 'auto-approval-report', loadChildren: () => import('./auto-approval-report/auto-approval-report.module').then(m => m.AutoApprovalReportModule)
  },
  {
    path: 'employee-verification-report', loadChildren: () => import('./employee-verification-reoprt/employee-verification-reoprt.module').then(m => m.EmployeeVerificationReoprtModule)
  },
  {
    path: 'employee-pan-verification-report', loadChildren: () => import('./employee-pan-verification-report/employee-pan-verification-report.module').then(m => m.EmployeePanVerificationReportModule)
  },
  {
    path: 'employee-itr-verification-report', loadChildren: () => import('./employee-itr-verification-report/employee-itr-verification-report.module').then(m => m.EmployeeItrVerificationReportModule)
  },
    {
        path: 'employee-itr-verification-report', loadChildren: () => import('./employee-itr-verification-report/employee-itr-verification-report.module').then(m => m.EmployeeItrVerificationReportModule)
    },
    {
        path: 'leave-balance-report', loadChildren: () => import('./leave-balance-report/leave-balance-report.module').then(m => m.LeaveBalanceReportModule)
    },
    {
        path: 'leave-encachment-report', loadChildren: () => import('./leave-encashment-report/leave-encashment-report.module').then(m => m.LeaveEncashmentReportModule)
    },
    {
        path: 'employee-reporting-structure', loadChildren: () => import('./employee-reporting-structure/employee-reporting-structure.module').then(m => m.EmployeeReportingStructureModule)
    },
    {
      path: 'leave-entitlement-report', loadChildren: () => import('./leave-entitlement-report/leave-entitlement-report.module').then(m => m.LeaveEntitlementReportModule)
    },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReportsRoutingModule { }
