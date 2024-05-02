import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmployeeLeaveEntitlementRoutingModule } from './employee-leave-entitlement-routing.module';
import { ExcelExportService, FreezeService, GridAllModule, PdfExportService, ResizeService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { DropDownListAllModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { EmployeeLeaveEntitlementComponent } from './employee-leave-entitlement.component';
import { EmployeeService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedModule } from 'src/app/shared/shared.module';


@NgModule({
  declarations: [
    EmployeeLeaveEntitlementComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    ReactiveFormsModule,
    FormsModule,
    EmployeeLeaveEntitlementRoutingModule,
    GridAllModule,
    DropDownListAllModule ,
    MultiSelectAllModule
  ],
  providers: [
    EmployeeService,
    LeaveManagementService,
    FreezeService, ResizeService, SortService,
    ToolbarService, ExcelExportService, PdfExportService]
})
export class EmployeeLeaveEntitlementModule { }
