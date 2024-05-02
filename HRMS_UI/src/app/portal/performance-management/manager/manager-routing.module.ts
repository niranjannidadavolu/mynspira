import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'manager'
  },
  {
    path: 'appraiser-evaluation', loadChildren: () => import('./pending-reviews/pending-reviews.module').then(m => m.PendingReviewsModule)
  },
  {
    path: 'employee-pending-review', loadChildren: () => import('./pending-reviews/employee-pending-review/employee-pending-review.module').then(m => m.EmployeePendingReviewModule)
  },
  {
    path: 'review-feedback', loadChildren: () => import('./review-feed-back/review-feed-back.module').then(m => m.ReviewFeedBackModule)
  },
  {
    path: 'score-management', loadChildren: () => import('./score-management/score-management.module').then(m => m.ScoreManagementModule)
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ManagerRoutingModule { }
