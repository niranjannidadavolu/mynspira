import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AssignKraComponent } from './assign-kra.component';

const routes: Routes = [
  {
    path: '',
    component: AssignKraComponent,
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AssignKraRoutingModule { }
