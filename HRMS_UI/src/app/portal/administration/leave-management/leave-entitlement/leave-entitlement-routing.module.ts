import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LeaveEntitlementComponent } from './leave-entitlement.component';

const routes: Routes = [{
  path: '',
  component: LeaveEntitlementComponent
}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LeaveEntitlementRoutingModule { }
