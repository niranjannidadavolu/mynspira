import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LeaveEntitlementReportRoutingModule } from './leave-entitlement-report-routing.module';
import { LeaveEntitlementReportComponent } from './leave-entitlement-report.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedModule } from 'src/app/shared/shared.module';
import { ButtonModule, CheckBoxModule } from '@syncfusion/ej2-angular-buttons';
import { DatePickerAllModule, DateRangePickerModule } from '@syncfusion/ej2-angular-calendars';
import { DropDownListAllModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { GridAllModule } from '@syncfusion/ej2-angular-grids';
import { NumericTextBoxAllModule, NumericTextBoxModule, RatingAllModule } from '@syncfusion/ej2-angular-inputs';
import { ToolbarModule } from '@syncfusion/ej2-angular-navigations';


@NgModule({
  declarations: [
    LeaveEntitlementReportComponent
  ],
  imports: [
    CommonModule,
    LeaveEntitlementReportRoutingModule,
    FormsModule,
    SharedModule,
    ReactiveFormsModule,
    CheckBoxModule, ButtonModule,
    DatePickerAllModule,
    DateRangePickerModule,
    DropDownListAllModule, MultiSelectAllModule,
    GridAllModule,
    NumericTextBoxAllModule, RatingAllModule, NumericTextBoxModule,
    ToolbarModule,
  ]
})
export class LeaveEntitlementReportModule { }
