import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'leave-information'
  },
  {
    path: 'leave-information', loadChildren: () => import('./leave-information/leave-information.module').then(m => m.LeaveInformationModule)
  },
  {
    path: 'leave-policy', loadChildren: () => import('./leave-policy/leave-policy.module').then(m => m.LeavePolicyModule)
  },
  {
    path: 'leave-entitlement', loadChildren: () => import('./leave-entitlement/leave-entitlement.module').then(m => m.LeaveEntitlementModule)
  },
  {
    path: 'employee-leave-entitlement', loadChildren: () => import('./employee-leave-entitlement/employee-leave-entitlement.module').then(m => m.EmployeeLeaveEntitlementModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LeaveManagementRoutingModule { }
