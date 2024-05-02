import { pathToFileURL } from 'url';
import { NgModule, Component } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FinalReviewComponent } from './final-review.component';

const routes: Routes = [
  {
    path: '',
    component: FinalReviewComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class FinalReviewRoutingModule { }
