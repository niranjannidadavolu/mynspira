import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MyReviewsRoutingModule } from './my-reviews-routing.module';
import { ColumnChooserService, ExcelExportService, GridAllModule, PdfExportService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { SharedModule } from 'src/app/shared/shared.module';
import { EmployeePerformanceReviewService } from 'src/app/core/services';
import { MyReviewsComponent } from './my-reviews.component';
import { MyReviewComponent } from './my-review/my-review.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    MyReviewsComponent,
  ],
  imports: [
    CommonModule,
    MyReviewsRoutingModule,
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
export class MyReviewsModule { }
