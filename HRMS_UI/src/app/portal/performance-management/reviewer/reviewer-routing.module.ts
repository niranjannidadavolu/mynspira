import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ReviewComponent } from 'src/app/shared/landing/review/review.component';

const routes: Routes = [
 {
    path: '',
    pathMatch: 'full',
    redirectTo: 'reviewer'
  },
  {
    path: 'reviewer-evaluation', loadChildren: () => import('./reviewer-evaluation/reviewer-evaluation.module').then(m => m.ReviewerEvaluationModule)
  },
  {
    path: 'reviewer-pending-review', loadChildren: () => import('./reviewer-evaluation/reviewer-pending-review/reviewer-pending-review.module').then(m => m.ReviewerPendingReviewModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReviewerRoutingModule { }
