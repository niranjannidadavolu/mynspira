import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FinalReviewRoutingModule } from './final-review-routing.module';
import { FinalReviewComponent } from './final-review.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedModule } from 'src/app/shared/shared.module';
import { ColumnChooserService, ExcelExportService, GridAllModule, PdfExportService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { EmployeePerformanceReviewService } from 'src/app/core/services';


@NgModule({
  declarations: [
    FinalReviewComponent
  ],
  imports: [
    CommonModule,
    FinalReviewRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    SharedModule,
    GridAllModule
  ],
  providers:[
    EmployeePerformanceReviewService,
    ToolbarService,
    ColumnChooserService,
    ExcelExportService,
    PdfExportService,
    SortService
  ]
})
export class FinalReviewModule { }
