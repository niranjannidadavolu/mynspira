import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LeaveBalanceReportComponent } from './leave-balance-report.component';

const routes: Routes = [
  {
    path: '',
    component: LeaveBalanceReportComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LeaveBalanceReportRoutingModule { }
