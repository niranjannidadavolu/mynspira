import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgSelectModule } from '@ng-select/ng-select';
import { EmployeePanVerificationReportRoutingModule } from './employee-pan-verification-report-routing.module';
import { NgbModule, NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { DxDataGridModule, DxButtonModule } from 'devextreme-angular';
import { FlatpickrModule } from 'angularx-flatpickr';
import { EmployeePanVerificationReportComponent } from './employee-pan-verification-report.component';
import { SharedModule } from "src/app/shared/shared.module";
import { PdfViewerModule } from 'ng2-pdf-viewer';
import { LightboxModule } from 'ngx-lightbox';
import { EmployeeVerificationService } from 'src/app/core/services';
import { ViewEmployeePanVerificationReportComponent } from './view-employee-pan-verification-report/view-employee-pan-verification-report.component';
import { ExcelExportService, FreezeService, GridModule, PdfExportService, ResizeService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';


@NgModule({
    declarations: [
        EmployeePanVerificationReportComponent,
        ViewEmployeePanVerificationReportComponent,
    ],
    imports: [
        CommonModule,
        EmployeePanVerificationReportRoutingModule,
        NgbModule,
        NgbNavModule,
        DxDataGridModule,
        DxButtonModule,
        NgSelectModule,
        FormsModule,
        ReactiveFormsModule,
        SharedModule,
        FlatpickrModule,
        PdfViewerModule,
        LightboxModule,    
        GridModule,
        MultiSelectModule
      ],
      providers: [EmployeeVerificationService,FreezeService, ResizeService, SortService,
        ToolbarService, ExcelExportService, PdfExportService]
})
export class EmployeePanVerificationReportModule { }
