import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'my-time-sheets'
  },
  {
    path: 'my-time-sheets', loadChildren: () => import('./my-time-sheet/my-time-sheet.module').then(m => m.MyTimeSheetModule)
  },
  {
    path: 'team-time-sheets', loadChildren: () => import('./team-time-sheet/team-time-sheet.module').then(m => m.TeamTimeSheetModule)
  },
  {
    path: 'projects', loadChildren: () => import('./projects/projects.module').then(m => m.ProjectsModule)
  },
  // {
  //   path: 'tasks', loadChildren: () => import('./projects/projects.module').then(m => m.ProjectsModule)
  // }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TimeSheetManagementRoutingModule { }
