import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ManageScoreComponent } from './manage-score.component';

const routes: Routes = [
  {
    path: '',
    component: ManageScoreComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ManageScoreRoutingModule { }
