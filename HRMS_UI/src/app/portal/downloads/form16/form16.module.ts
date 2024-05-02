import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { Form16RoutingModule } from './form16-routing.module';
import { Form16Component } from './form16/form16.component';


@NgModule({
  declarations: [
    Form16Component
  ],
  imports: [
    CommonModule,
    Form16RoutingModule
  ]
})
export class Form16Module { }
