import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TaxCalculationRoutingModule } from './tax-calculation-routing.module';
import { TaxCalculationComponent } from './tax-calculation/tax-calculation.component';


@NgModule({
  declarations: [
    TaxCalculationComponent
  ],
  imports: [
    CommonModule,
    TaxCalculationRoutingModule
  ]
})
export class TaxCalculationModule { }
