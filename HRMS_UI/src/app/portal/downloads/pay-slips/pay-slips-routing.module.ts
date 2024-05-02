import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PaySlipsComponent } from './pay-slips/pay-slips.component';

const routes: Routes = [
  {
      path: '',
      component: PaySlipsComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PaySlipsRoutingModule { }
