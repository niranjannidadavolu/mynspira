import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LeaveReportRoutingModule } from './leave-report-routing.module';
import { LeaveReportComponent } from './leave-report.component';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { NgSelectModule } from '@ng-select/ng-select';
import { FlatpickrModule } from 'angularx-flatpickr';
import { DxDataGridModule, DxSelectBoxModule, DxButtonModule } from 'devextreme-angular';
import { SharedModule } from 'src/app/shared/shared.module';


@NgModule({
  declarations: [
    LeaveReportComponent
  ],
  imports: [
    CommonModule,
    LeaveReportRoutingModule,
    DxDataGridModule,
    NgSelectModule,
    ReactiveFormsModule,
    FormsModule,
    SharedModule,
    FlatpickrModule,
    DxSelectBoxModule,
    DxButtonModule
  ]
})
export class LeaveReportModule { }
