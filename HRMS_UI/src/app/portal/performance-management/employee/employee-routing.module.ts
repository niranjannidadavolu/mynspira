import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: "",
    redirectTo: "my-reviews",
  },
  {
    path: "my-reviews",
    loadChildren: () => import('./my-reviews/my-reviews.module').then(m => m.MyReviewsModule)
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeeRoutingModule { }
