import { SharedModule } from 'src/app/shared/shared.module';
import { NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';

import { LeaveManagementRoutingModule } from './leave-management-routing.module';
import { NgbModule, NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { DxButtonModule, DxDataGridModule, DxDateBoxModule, DxFileUploaderModule, DxFormModule, DxSelectBoxModule, DxTextAreaModule, DxToastModule, DxToolbarModule, DxValidationGroupModule, DxValidatorModule } from 'devextreme-angular';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgSelectModule } from '@ng-select/ng-select';
import { ApplyLeaveComponent } from './apply-leave/apply-leave.component';
import { FlatpickrModule } from 'angularx-flatpickr';
import { ApplyOnDutyComponent } from './apply-on-duty/apply-on-duty.component';
import { ApproveLeaveComponent } from './approve-leave/approve-leave.component';
import { EmployeeLeaveHistoryComponent } from './employee-leave-history/employee-leave-history.component';
import { CompOffLeaveComponent } from './comp-off-leave/comp-off-leave.component';
import { EarlyLogoutTimeComponent } from './early-logout-time/early-logout-time.component';
import { ApplyEmployeeLeaveComponent } from './apply-employee-leave/apply-employee-leave.component';
import { ApplyEmployeeLeaveByHrOpsComponent } from './apply-employee-leave-by-hr-ops/apply-employee-leave-by-hr-ops.component';
import { LeaveComponentsModule } from './leave-components/leave-components.module';


@NgModule({
  declarations: [
    ApplyLeaveComponent,
    ApplyEmployeeLeaveByHrOpsComponent,
    ApplyOnDutyComponent,
    ApproveLeaveComponent,
    EmployeeLeaveHistoryComponent,
    CompOffLeaveComponent,
    EarlyLogoutTimeComponent,
    ApplyEmployeeLeaveComponent,
    
  ],
  imports: [
    CommonModule,
    NgbModule,
    SharedModule,
    NgbNavModule,
    LeaveManagementRoutingModule,
    DxDataGridModule,
    DxSelectBoxModule,
    DxTextAreaModule,
    DxDateBoxModule,
    DxButtonModule,
    DxToolbarModule,
    DxFormModule,
    DxValidatorModule,
    DxValidationGroupModule,
    DxToastModule,
    FormsModule,
    ReactiveFormsModule,
    FlatpickrModule,
    NgSelectModule,
    DxFileUploaderModule,
    LeaveComponentsModule
  ],
  exports: [],
  providers: [DatePipe]

})
export class LeaveManagementModule {

}
