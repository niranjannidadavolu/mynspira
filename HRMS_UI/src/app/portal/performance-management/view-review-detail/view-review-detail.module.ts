import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ViewReviewDetailRoutingModule } from './view-review-detail-routing.module';
import { DropDownListModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { AggregateService, CommandColumnService, EditService, GridAllModule, GroupService, PageService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { NumericTextBoxModule } from '@syncfusion/ej2-angular-inputs';
import { DepartmentInformationService, FrequencyInformationService, KpiInformationService, EmployeePerformanceReviewService } from 'src/app/core/services';
import { ViewReviewDetailComponent } from './view-review-detail.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    ViewReviewDetailComponent
  ],
  imports: [
    CommonModule,
    ViewReviewDetailRoutingModule, 
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    GridAllModule,
    DropDownListModule,
    NumericTextBoxModule,
    MultiSelectAllModule,
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
  ]
})
export class ViewReviewDetailModule { }
