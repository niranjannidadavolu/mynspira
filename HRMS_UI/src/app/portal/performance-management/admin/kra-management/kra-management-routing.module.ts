import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { KraManagementComponent } from './kra-management.component';

const routes: Routes = [
  {
    path: '',
    component: KraManagementComponent 
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class KraManagementRoutingModule { }
