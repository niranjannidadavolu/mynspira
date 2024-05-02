import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ApproveLeaveRoutingModule } from './approve-leave-routing.module';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { FlatpickrModule } from 'angularx-flatpickr';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    ApproveLeaveRoutingModule,
    ReactiveFormsModule,
    FormsModule, 
    FlatpickrModule
  ]
})
export class ApproveLeaveModule { }
