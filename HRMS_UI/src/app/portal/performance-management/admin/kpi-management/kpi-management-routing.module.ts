import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { KpiManagementComponent } from './kpi-management.component';

const routes: Routes = [
  {
    path: '',
    component: KpiManagementComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class KpiManagementRoutingModule { }
