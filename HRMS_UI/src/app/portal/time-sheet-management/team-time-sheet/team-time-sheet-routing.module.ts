import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TeamTimeSheetComponent } from './team-time-sheet.component';

const routes: Routes = [
  {
    path: '',
    component:TeamTimeSheetComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TeamTimeSheetRoutingModule { }
