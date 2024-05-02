import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MyTeamLeavesComponent } from './my-team-leaves.component';

const routes: Routes = [
  {
    path: '',
    component: MyTeamLeavesComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MyTeamLeavesRoutingModule { }
