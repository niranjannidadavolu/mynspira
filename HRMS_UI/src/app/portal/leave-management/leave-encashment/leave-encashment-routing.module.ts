import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LeaveEncashmentComponent } from './leave-encashment.component';

const routes: Routes = [
  { path:'', component: LeaveEncashmentComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LeaveEncashmentRoutingModule { }
