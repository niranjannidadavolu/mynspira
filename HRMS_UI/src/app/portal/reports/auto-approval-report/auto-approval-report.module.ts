import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AutoApprovalReportRoutingModule } from './auto-approval-report-routing.module';
import { AutoApprovalReportComponent } from './auto-approval-report.component';
import { NgbModule, NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { SharedModule } from 'src/app/shared/shared.module';
import { DxButtonModule, DxDataGridModule } from 'devextreme-angular';
import { FlatpickrModule } from 'angularx-flatpickr';
import { ReactiveFormsModule } from '@angular/forms';
import { NgSelectModule } from '@ng-select/ng-select';
import { MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';
import { ExcelExportService, FreezeService, GridModule, PageService, PdfExportService, ResizeService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';


@NgModule({
  declarations: [
    AutoApprovalReportComponent
  ],
  imports: [
    CommonModule,
    AutoApprovalReportRoutingModule,
    NgbModule,
    NgbNavModule,
    SharedModule ,
    DxButtonModule,
    DxDataGridModule,
    FlatpickrModule,
    ReactiveFormsModule,
    NgSelectModule,
    GridModule,
    MultiSelectModule
  ],
  providers: [FreezeService, ResizeService, SortService,
    ToolbarService, ExcelExportService, PdfExportService]
})
export class AutoApprovalReportModule { }
