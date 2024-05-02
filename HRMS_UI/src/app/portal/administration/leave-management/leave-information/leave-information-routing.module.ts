import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LeaveInformationComponent } from './leave-information.component';

const routes: Routes = [{
  path: '',
  component:LeaveInformationComponent
}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LeaveInformationRoutingModule { }
