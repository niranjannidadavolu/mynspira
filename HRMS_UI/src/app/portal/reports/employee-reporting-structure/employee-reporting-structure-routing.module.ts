import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeeReportingStructureComponent } from './employee-reporting-structure.component';

const routes: Routes = [
  {
    path: '',
    component: EmployeeReportingStructureComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeeReportingStructureRoutingModule { }
