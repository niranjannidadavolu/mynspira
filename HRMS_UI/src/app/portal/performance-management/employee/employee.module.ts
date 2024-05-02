import { SharedModule } from "src/app/shared/shared.module";
import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";

import { EmployeeRoutingModule } from "./employee-routing.module";
import { ColumnChooserService, ExcelExportService, GridAllModule, PdfExportService, SortService, ToolbarService } from "@syncfusion/ej2-angular-grids";
import { EmployeePerformanceReviewService } from "src/app/core/services";

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    EmployeeRoutingModule],
  providers: [
    
  ],
})
export class EmployeeModule { }
