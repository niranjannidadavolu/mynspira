import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeePanVerificationReportComponent } from './employee-pan-verification-report.component';

const routes: Routes = [{
  path: '',
  component: EmployeePanVerificationReportComponent
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeePanVerificationReportRoutingModule { }
