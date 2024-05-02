import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { MyReviewRoutingModule } from "./my-review-routing.module";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import {
  GridAllModule,
  ColumnChooserService,
  ExcelExportService,
  PdfExportService,
  SortService,
} from "@syncfusion/ej2-angular-grids";
import { ToolbarService } from "@syncfusion/ej2-angular-pdfviewer";
import { EmployeePerformanceReviewService } from "src/app/core/services";
import { SharedModule } from "src/app/shared/shared.module";
import { MyReviewComponent } from "./my-review.component";
import { TextBoxAllModule } from "@syncfusion/ej2-angular-inputs";

@NgModule({
  declarations: [
    MyReviewComponent
  ],
  imports: [
    CommonModule,
    MyReviewRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    SharedModule,
    GridAllModule,
    TextBoxAllModule
  ],
  providers: [
    EmployeePerformanceReviewService,
    ToolbarService,
    ColumnChooserService,
    ExcelExportService,
    PdfExportService,
    SortService,
  ],
})
export class MyReviewModule {}
