import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmployeeVerificationReoprtRoutingModule } from './employee-verification-reoprt-routing.module';
import { EmployeeVerificationReoprtComponent } from './employee-verification-reoprt.component';
import { NgbModule, NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedModule } from 'src/app/shared/shared.module';
import { DxButtonModule, DxDataGridModule } from 'devextreme-angular';
import { FlatpickrModule } from 'angularx-flatpickr';
import { NgSelectModule } from '@ng-select/ng-select';
import { ViewEmployeeVerificationReportComponent } from './view-employee-verification-report/view-employee-verification-report.component';
import { EmployeeVerificationService } from 'src/app/core/services';
import { PdfViewerModule } from 'ng2-pdf-viewer';
import { LightboxModule } from 'ngx-lightbox';
import { ExcelExportService, FreezeService, GridModule, PdfExportService, ResizeService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';

@NgModule({
  declarations: [
    EmployeeVerificationReoprtComponent,
    ViewEmployeeVerificationReportComponent
  ],
  imports: [
    CommonModule,
    EmployeeVerificationReoprtRoutingModule,
    NgbModule,
    FormsModule,
    NgbNavModule,
    SharedModule ,
    DxButtonModule,
    DxDataGridModule,
    FlatpickrModule,
    ReactiveFormsModule,
    NgSelectModule,
    PdfViewerModule,
    LightboxModule,
     GridModule,
    MultiSelectModule
  ],
  providers: [EmployeeVerificationService,FreezeService, ResizeService, SortService,
    ToolbarService, ExcelExportService, PdfExportService]
})
export class EmployeeVerificationReoprtModule { }
