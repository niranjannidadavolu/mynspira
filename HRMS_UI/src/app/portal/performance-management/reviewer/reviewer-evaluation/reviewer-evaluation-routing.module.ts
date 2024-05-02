import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ReviewerEvaluationComponent } from './reviewer-evaluation.component';

const routes: Routes = [
   {
    path: '',
    component: ReviewerEvaluationComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReviewerEvaluationRoutingModule { }
