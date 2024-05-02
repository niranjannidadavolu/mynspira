import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MyTimeSheetRoutingModule } from './my-time-sheet-routing.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DxDataGridModule } from 'devextreme-angular';
import { SharedModule } from 'src/app/shared/shared.module';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    DxDataGridModule,
    MyTimeSheetRoutingModule
  ]
})
export class MyTimeSheetModule { }
