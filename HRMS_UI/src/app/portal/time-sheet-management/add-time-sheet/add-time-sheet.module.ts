import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AddTimeSheetRoutingModule } from './add-time-sheet-routing.module';
import { AddTimeSheetEntryComponent } from './add-time-sheet-entry/add-time-sheet-entry.component';


@NgModule({
  declarations: [
    AddTimeSheetEntryComponent
  ],
  imports: [
    CommonModule,
    AddTimeSheetRoutingModule
  ]
})
export class AddTimeSheetModule { }
