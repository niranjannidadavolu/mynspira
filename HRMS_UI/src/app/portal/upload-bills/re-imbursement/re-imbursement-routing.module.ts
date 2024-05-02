import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ReImbursementComponent } from './re-imbursement/re-imbursement.component';

const routes: Routes = [
  {
      path: '',
      component: ReImbursementComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReImbursementRoutingModule { }
