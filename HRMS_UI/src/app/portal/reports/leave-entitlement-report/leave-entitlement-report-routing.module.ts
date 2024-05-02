import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LeaveEntitlementComponent } from '../../administration/leave-management/leave-entitlement/leave-entitlement.component';
import { LeaveEntitlementReportComponent } from './leave-entitlement-report.component';

const routes: Routes = [
  {
    path: '',
    component: LeaveEntitlementReportComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LeaveEntitlementReportRoutingModule { }
