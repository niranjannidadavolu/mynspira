import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ReviewerEvaluationRoutingModule } from './reviewer-evaluation-routing.module';
import { ReviewerEvaluationComponent } from './reviewer-evaluation.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { AggregateService, ColumnChooserService, CommandColumnService, EditService, ExcelExportService, GridAllModule, GroupService, PageService, PdfExportService, SortService } from '@syncfusion/ej2-angular-grids';
import { ToolbarService } from '@syncfusion/ej2-angular-pdfviewer';
import { DepartmentInformationService, EmployeePerformanceReviewService, FrequencyInformationService, KpiInformationService } from 'src/app/core/services';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DropDownListModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { NumericTextBoxModule } from '@syncfusion/ej2-angular-inputs';
import { TabAllModule } from '@syncfusion/ej2-angular-navigations';


@NgModule({
  declarations: [
    ReviewerEvaluationComponent
  ],
  imports: [
    CommonModule,
    ReviewerEvaluationRoutingModule,
    SharedModule,
    GridAllModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    DropDownListModule,
    NumericTextBoxModule,
    MultiSelectAllModule,
    TabAllModule,
    
  ],
  providers: [EmployeePerformanceReviewService],
})
export class ReviewerEvaluationModule { }
