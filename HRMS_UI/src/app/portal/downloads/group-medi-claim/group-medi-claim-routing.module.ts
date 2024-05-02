import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { GroupMediClaimComponent } from './group-medi-claim.component';

const routes: Routes = [
  {
      path: '',
      component: GroupMediClaimComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class GroupMediClaimRoutingModule { }
