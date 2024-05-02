import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LeaveReportComponent } from './leave-report.component';
import { LeaveReportRoutingModule } from './leave-report-routing.module';
//import { NgbModule, NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { SharedModule } from 'src/app/shared/shared.module';
//import { DxButtonModule, DxDataGridModule } from 'devextreme-angular';
//import { FlatpickrModule } from 'angularx-flatpickr';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
//import { NgSelectModule } from '@ng-select/ng-select';

import { CheckBoxModule, ButtonModule } from '@syncfusion/ej2-angular-buttons';
import { DatePickerAllModule, DateRangePickerModule } from '@syncfusion/ej2-angular-calendars';
import { DropDownListAllModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { ExcelExportService, FreezeService, GridAllModule, GroupService, PdfExportService, ResizeService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { NumericTextBoxAllModule, RatingAllModule, NumericTextBoxModule } from '@syncfusion/ej2-angular-inputs';
import { ToolbarModule } from '@syncfusion/ej2-angular-navigations';

@NgModule({
  declarations: [
    LeaveReportComponent
  ],
  imports: [
    CommonModule,
    //NgbModule,
    FormsModule,
    //NgbNavModule,
    SharedModule,
    //DxButtonModule,
    //DxDataGridModule,
    //FlatpickrModule,
    ReactiveFormsModule,
    //NgSelectModule,
    CheckBoxModule, ButtonModule,
    DatePickerAllModule,
    DateRangePickerModule,
    DropDownListAllModule, MultiSelectAllModule,
    GridAllModule,
    NumericTextBoxAllModule, RatingAllModule, NumericTextBoxModule,
    ToolbarModule,
    LeaveReportRoutingModule
  ],
  providers: [
    FreezeService, ResizeService, SortService,
    ToolbarService, ExcelExportService, PdfExportService
  ]
})
export class LeaveReportModule { }
