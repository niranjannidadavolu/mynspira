import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ScoreManagementComponent } from './score-management.component';

const routes: Routes = [
  {
    path: '',
    component: ScoreManagementComponent
  },
  {
    path: 'manage-score',
    loadChildren: () => import('./manage-score/manage-score.module').then(m => m.ManageScoreModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ScoreManagementRoutingModule { }
