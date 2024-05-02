import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InvestmentDeclarationsComponent } from './investment-declarations/investment-declarations.component';

const routes: Routes = [
  {
      path: '',
      component: InvestmentDeclarationsComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class InvestmentDeclarationsRoutingModule { }
