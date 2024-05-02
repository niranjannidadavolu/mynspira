import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmployeePendingReviewRoutingModule } from './employee-pending-review-routing.module';
import { SharedModule } from 'src/app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AggregateService, CommandColumnService, EditService, GridAllModule, GroupService, PageService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { DropDownListModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { NumericTextBoxModule, TextBoxAllModule } from '@syncfusion/ej2-angular-inputs';
import { DepartmentInformationService, FrequencyInformationService, KpiInformationService, EmployeePerformanceReviewService } from 'src/app/core/services';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    EmployeePendingReviewRoutingModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    GridAllModule,
    DropDownListModule,
    NumericTextBoxModule,
    MultiSelectAllModule,
    TextBoxAllModule
  ],
  providers: [
    EditService,
    ToolbarService,
    CommandColumnService,
    PageService,
    GroupService,
    AggregateService,
    DepartmentInformationService,
    FrequencyInformationService,
    KpiInformationService,
    EmployeePerformanceReviewService,
  ],
})
export class EmployeePendingReviewModule {}
