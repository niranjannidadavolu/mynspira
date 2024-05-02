import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmployeeReportingStructureRoutingModule } from './employee-reporting-structure-routing.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
//import { NgbModule, NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
//import { NgSelectModule } from '@ng-select/ng-select';
import { CheckBoxModule, ButtonModule } from '@syncfusion/ej2-angular-buttons';
import { DatePickerAllModule } from '@syncfusion/ej2-angular-calendars';
import { DropDownListAllModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { ExcelExportService, FreezeService, GridAllModule, PdfExportService, ResizeService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { NumericTextBoxAllModule, RatingAllModule, NumericTextBoxModule } from '@syncfusion/ej2-angular-inputs';
import { ToolbarModule } from '@syncfusion/ej2-angular-navigations';
import { DialogModule } from '@syncfusion/ej2-angular-popups';
//import { FlatpickrModule } from 'angularx-flatpickr';
import { SharedModule } from 'src/app/shared/shared.module';
import { EmployeeReportingStructureComponent } from './employee-reporting-structure.component';


@NgModule({
  declarations: [
    EmployeeReportingStructureComponent
  ],
  imports: [
    CommonModule,
    FormsModule, ReactiveFormsModule,
    CheckBoxModule,
    DropDownListAllModule,
    DatePickerAllModule,
    ToolbarModule,
    NumericTextBoxAllModule, RatingAllModule,
    DialogModule,
    GridAllModule,
    //FlatpickrModule,
    //NgSelectModule,
    //NgbModule,
    FormsModule,
    //NgbNavModule,
    SharedModule,
    //FlatpickrModule,
    ReactiveFormsModule,
    //NgSelectModule,
    ButtonModule,
    MultiSelectAllModule,
    NumericTextBoxModule,
    EmployeeReportingStructureRoutingModule
  ],
  providers:[FreezeService, ResizeService, SortService,
    ToolbarService, ExcelExportService, PdfExportService]
})
export class EmployeeReportingStructureModule { }
