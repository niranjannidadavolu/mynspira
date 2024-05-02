import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeePendingReviewComponent } from './employee-pending-review.component';

const routes: Routes = [
  {
    path: '',
    component: EmployeePendingReviewComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeePendingReviewRoutingModule { }
