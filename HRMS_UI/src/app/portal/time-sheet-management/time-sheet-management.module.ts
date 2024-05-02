import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TimeSheetManagementRoutingModule } from './time-sheet-management-routing.module';
import { ReviewTimeSheetComponent } from './review-time-sheet/review-time-sheet.component';
import { AddTimeSheetComponent } from './add-time-sheet/add-time-sheet.component';
import { TeamTimeSheetComponent } from './team-time-sheet/team-time-sheet.component';
import { MyTimeSheetComponent } from './my-time-sheet/my-time-sheet.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { DxDataGridModule } from 'devextreme-angular';


@NgModule({
  declarations: [
    ReviewTimeSheetComponent,
    AddTimeSheetComponent,
    TeamTimeSheetComponent,
    MyTimeSheetComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    DxDataGridModule,
    TimeSheetManagementRoutingModule
  ]
})
export class TimeSheetManagementModule { }
