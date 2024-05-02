import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InitiatePerformanceReviewComponent } from './initiate-performance-review.component';

const routes: Routes = [
  {
    path: '',
    component: InitiatePerformanceReviewComponent,
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class InitiatePerformanceReviewRoutingModule { }
