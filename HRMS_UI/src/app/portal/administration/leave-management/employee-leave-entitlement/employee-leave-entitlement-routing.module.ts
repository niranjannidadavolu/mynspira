import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeeLeaveEntitlementComponent } from './employee-leave-entitlement.component';

const routes: Routes = [
  {
    path: '',
    component: EmployeeLeaveEntitlementComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeeLeaveEntitlementRoutingModule { }
