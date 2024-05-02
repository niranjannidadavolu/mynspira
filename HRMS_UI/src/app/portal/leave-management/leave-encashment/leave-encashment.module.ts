import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LeaveEncashmentRoutingModule } from './leave-encashment-routing.module';
import { LeaveEncashmentComponent } from './leave-encashment.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { DxDataGridModule } from 'devextreme-angular';
import { CreateEncashmentComponent } from './create-encashment/create-encashment.component';
import { ReactiveFormsModule } from '@angular/forms';
import { LeaveEncashmentService } from 'src/app/core/services/leave-encashment';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { WorkflowTrackerModule } from 'src/app/shared/app-components/workflow-tracker/workflow-tracker.module';
import { FilterService, GridAllModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';
import { ToolbarModule } from '@syncfusion/ej2-angular-navigations/src/toolbar/toolbar.module';
@NgModule({
  declarations: [
    LeaveEncashmentComponent,
    CreateEncashmentComponent
  ],
  imports: [
    CommonModule,
    LeaveEncashmentRoutingModule,
    SharedModule,
    DxDataGridModule,
    ReactiveFormsModule,
    NgbModule,
    GridAllModule,
    WorkflowTrackerModule,
    // ToolbarModule
  ],
  providers: [LeaveEncashmentService, FilterService, PageService, SortService]
})
export class LeaveEncashmentModule { }
