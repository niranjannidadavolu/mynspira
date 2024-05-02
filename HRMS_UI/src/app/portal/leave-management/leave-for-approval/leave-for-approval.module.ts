import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LeaveForApprovalRoutingModule } from './leave-for-approval-routing.module';
import { NgbModule, NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { SharedModule } from 'src/app/shared/shared.module';
import { DxButtonModule, DxDataGridModule } from 'devextreme-angular';
import { FlatpickrModule } from 'angularx-flatpickr';
import { LeaveForApprovalComponent } from './leave-for-approval.component';
import { ColumnChooserService, ExcelExportService, GridAllModule, PdfExportService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    LeaveForApprovalComponent
  ],
  imports: [
    CommonModule,
    NgbNavModule,
    SharedModule,
    NgbModule,
    LeaveForApprovalRoutingModule,
    FlatpickrModule,
    GridAllModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers:[
    ToolbarService, ColumnChooserService, ExcelExportService, PdfExportService, SortService
  ]
})
export class LeaveForApprovalModule { }
