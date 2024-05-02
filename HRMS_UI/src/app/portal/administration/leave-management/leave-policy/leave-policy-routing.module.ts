import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LeavePolicyComponent } from './leave-policy.component';

const routes: Routes = [
  { path: '',
  component:LeavePolicyComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LeavePolicyRoutingModule { }
