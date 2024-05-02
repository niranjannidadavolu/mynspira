import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MyReviewsComponent } from './my-reviews.component';
import { MyReviewComponent } from './my-review/my-review.component';

const routes: Routes = [
  {
    path:'',
    component: MyReviewsComponent
  },
  {
    path: "submit-review",
    loadChildren: () => import('./my-review/my-review.module').then(m => m.MyReviewModule)
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MyReviewsRoutingModule { }
