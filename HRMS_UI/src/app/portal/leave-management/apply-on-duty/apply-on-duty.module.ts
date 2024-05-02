import { NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';

import { ApplyOnDutyRoutingModule } from './apply-on-duty-routing.module';
import { FlatpickrModule } from 'angularx-flatpickr';
import { BrowserModule } from '@angular/platform-browser';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    ApplyOnDutyRoutingModule,
    FlatpickrModule,
    BrowserModule
  ],
  providers: [DatePipe]
})
export class ApplyOnDutyModule { }
