import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
      path: '',
      pathMatch:'full',
      redirectTo:'declarations'
  },
  {
    path: 'declarations', loadChildren: () => import('./investment-declarations/investment-declarations.module').then(m => m.InvestmentDeclarationsModule)
  },
  {
    path: 'proofs', loadChildren: () => import('./investment-proofs/investment-proofs.module').then(m => m.InvestmentProofsModule)
  },
  {
    path: 'tax', loadChildren: () => import('./tax-calculation/tax-calculation.module').then(m => m.TaxCalculationModule)
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class InvestmentsRoutingModule { }
