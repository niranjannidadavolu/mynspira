import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ViewReviewDetailComponent } from './view-review-detail.component';

const routes: Routes = [
  {
    path: '',
    component: ViewReviewDetailComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ViewReviewDetailRoutingModule { }
