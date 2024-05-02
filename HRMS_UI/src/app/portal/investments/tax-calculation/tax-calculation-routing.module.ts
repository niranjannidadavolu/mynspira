import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TaxCalculationComponent } from './tax-calculation/tax-calculation.component';

const routes: Routes = [
  {
      path: '',
      component: TaxCalculationComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TaxCalculationRoutingModule { }
