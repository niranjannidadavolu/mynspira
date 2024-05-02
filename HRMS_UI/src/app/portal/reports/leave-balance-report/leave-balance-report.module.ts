import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LeaveBalanceReportRoutingModule } from './leave-balance-report-routing.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { FlatpickrModule } from 'angularx-flatpickr';
import { NgSelectModule } from '@ng-select/ng-select';
import { LeaveBalanceReportComponent } from './leave-balance-report.component';
import { NgbModule, NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { SharedModule } from 'src/app/shared/shared.module';

import { MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { NumericTextBoxModule } from '@syncfusion/ej2-angular-inputs';
import { ButtonModule } from '@syncfusion/ej2-angular-buttons';
import { CheckBoxModule } from '@syncfusion/ej2-angular-buttons';
import { DropDownListAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { DatePickerAllModule } from '@syncfusion/ej2-angular-calendars';
import { ToolbarModule } from '@syncfusion/ej2-angular-navigations';
import { NumericTextBoxAllModule, RatingAllModule } from '@syncfusion/ej2-angular-inputs';
import { DialogModule } from '@syncfusion/ej2-angular-popups';
import { ExcelExportService, FreezeService, GridAllModule, PdfExportService, ResizeService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';

@NgModule({
  declarations: [
    LeaveBalanceReportComponent 
  ],
  imports: [
    CommonModule,
    FormsModule, ReactiveFormsModule,
    LeaveBalanceReportRoutingModule,
    CheckBoxModule,
    DropDownListAllModule,
    DatePickerAllModule,
    ToolbarModule,
    NumericTextBoxAllModule, RatingAllModule,
    DialogModule,
    GridAllModule,    
    FlatpickrModule,
    NgSelectModule,
    NgbModule,
    FormsModule,
    NgbNavModule,
    SharedModule ,
    FlatpickrModule,
    ReactiveFormsModule,
    NgSelectModule,
    ButtonModule,
    MultiSelectAllModule,
    NumericTextBoxModule
  ],
  providers:[FreezeService, ResizeService, SortService,
    ToolbarService, ExcelExportService, PdfExportService]
})
export class LeaveBalanceReportModule { }
