import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ApplyLeaveRoutingModule } from './apply-leave-routing.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FlatpickrModule } from 'angularx-flatpickr';
import { DxFileUploaderModule } from 'devextreme-angular';
import { NgSelectModule } from '@ng-select/ng-select';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    FormsModule, 
    FlatpickrModule,
    ApplyLeaveRoutingModule,
    DxFileUploaderModule,
    NgSelectModule
  ]
})
export class ApplyLeaveModule { }
