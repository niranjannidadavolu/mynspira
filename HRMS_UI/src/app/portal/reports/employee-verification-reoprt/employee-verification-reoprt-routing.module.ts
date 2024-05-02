import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeeVerificationReoprtComponent } from './employee-verification-reoprt.component';

const routes: Routes = [
  {
    path: '',
    component: EmployeeVerificationReoprtComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeeVerificationReoprtRoutingModule { }
