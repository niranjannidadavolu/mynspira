import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FilterService, GridAllModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { MyLeavesDashboardComponent } from './my-leaves-dashboard.component';
import { WorkflowTrackerModule } from '../../workflow-tracker/workflow-tracker.module';
@NgModule({
  declarations: [MyLeavesDashboardComponent],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    FormsModule,
    GridAllModule,
    NgbNavModule,
    WorkflowTrackerModule
  ],
  exports: [MyLeavesDashboardComponent,],
  providers: [FilterService, PageService ,SortService]
})
export class MyLeavesDashboardModule { }
