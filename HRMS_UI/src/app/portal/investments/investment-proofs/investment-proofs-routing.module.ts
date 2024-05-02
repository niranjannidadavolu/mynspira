import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InvestmentProofsComponent } from './investment-proofs/investment-proofs.component';
import { InvestmentsVerifyComponent } from './investments-verify/investments-verify.component';

const routes: Routes = [
  {
      path: '',
      component: InvestmentProofsComponent
  },
  {
    path: 'verify',
    component: InvestmentsVerifyComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class InvestmentProofsRoutingModule { }
