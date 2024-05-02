import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ReviewerPendingReviewRoutingModule } from './reviewer-pending-review-routing.module';
import { ReviewerPendingReviewComponent } from './reviewer-pending-review.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DropDownListModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { AggregateService, CommandColumnService, EditService, GridAllModule, GroupService, PageService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { NumericTextBoxModule } from '@syncfusion/ej2-angular-inputs';
import { SharedModule } from 'src/app/shared/shared.module';
import { DepartmentInformationService, FrequencyInformationService, KpiInformationService, EmployeePerformanceReviewService } from 'src/app/core/services';


@NgModule({
  declarations: [
    ReviewerPendingReviewComponent
  ],
  imports: [
    CommonModule,
    ReviewerPendingReviewRoutingModule,
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
  ],
})
export class ReviewerPendingReviewModule { }
