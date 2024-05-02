import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AutoApprovalReportComponent } from './auto-approval-report.component';

const routes: Routes = [
  {
    path: '',
    component: AutoApprovalReportComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AutoApprovalReportRoutingModule { }
