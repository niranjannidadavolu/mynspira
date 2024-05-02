import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeeItrVerificationReportComponent } from './employee-itr-verification-report.component';

const routes: Routes = [{
    path: '',
    component: EmployeeItrVerificationReportComponent
  }];

  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  export class EmployeeItrVerificationReportRoutingModule { }