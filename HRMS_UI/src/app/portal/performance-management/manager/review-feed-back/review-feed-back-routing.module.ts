import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ReviewFeedBackComponent } from './review-feed-back.component';

const routes: Routes = [
  {
    path: '',
    component: ReviewFeedBackComponent
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReviewFeedBackRoutingModule { }
