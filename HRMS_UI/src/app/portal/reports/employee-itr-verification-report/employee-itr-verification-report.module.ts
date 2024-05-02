import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgSelectModule } from '@ng-select/ng-select';
import { NgbModule, NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { DxDataGridModule, DxButtonModule } from 'devextreme-angular';
import { FlatpickrModule } from 'angularx-flatpickr';
import { SharedModule } from "src/app/shared/shared.module";
import { PdfViewerModule } from 'ng2-pdf-viewer';
import { LightboxModule } from 'ngx-lightbox';
import { EmployeeVerificationService } from 'src/app/core/services';
import { EmployeeItrVerificationReportRoutingModule } from './employee-itr-verification-report-routing.module';
import { EmployeeItrVerificationReportComponent } from './employee-itr-verification-report.component';
import { ViewEmployeeItrVerificationReportComponent } from './view-employee-itr-verification-report/view-employee-itr-verification-report.component';
import { ExcelExportService, FreezeService, GridModule, PdfExportService, ResizeService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';

@NgModule({
    declarations: [
        EmployeeItrVerificationReportComponent,
        ViewEmployeeItrVerificationReportComponent,
    ],
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        NgSelectModule,
        NgbModule,
        NgbNavModule,
        DxDataGridModule,
        DxButtonModule,
        FlatpickrModule,
        SharedModule,
        PdfViewerModule,
        LightboxModule,
        EmployeeItrVerificationReportRoutingModule,
        GridModule,
        MultiSelectModule
      ],
      providers: [EmployeeVerificationService,FreezeService, ResizeService, SortService,
        ToolbarService, ExcelExportService, PdfExportService]

})
export class EmployeeItrVerificationReportModule { }