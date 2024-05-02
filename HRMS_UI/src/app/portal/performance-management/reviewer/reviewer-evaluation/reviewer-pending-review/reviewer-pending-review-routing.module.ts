import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ReviewerPendingReviewComponent } from './reviewer-pending-review.component';

const routes: Routes = [
  {
    path: '',
    component: ReviewerPendingReviewComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReviewerPendingReviewRoutingModule { }
