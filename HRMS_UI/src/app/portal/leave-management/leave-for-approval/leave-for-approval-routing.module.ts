import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LeaveForApprovalComponent } from './leave-for-approval.component';

const routes: Routes = [{
  path: '',
  component: LeaveForApprovalComponent
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LeaveForApprovalRoutingModule { }
