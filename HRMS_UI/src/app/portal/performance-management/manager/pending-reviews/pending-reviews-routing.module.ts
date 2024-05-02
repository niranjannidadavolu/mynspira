import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PendingReviewsComponent } from './pending-reviews.component';

const routes: Routes = [
  {
    path: '',
    component:PendingReviewsComponent
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PendingReviewsRoutingModule { }
