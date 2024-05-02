import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LeaveTransactionsComponent } from './leave-transactions.component';

const routes: Routes = [{
  path: '',
  component: LeaveTransactionsComponent
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LeaveTransactionsRoutingModule { }
