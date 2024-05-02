import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FilterService, GridAllModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DashboardLeavesComponent } from './dashboard-leaves.component';
import { NgbAccordionModule, NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { FlatpickrModule } from 'angularx-flatpickr';
import { TeamLeavesForApprovalModule } from '../team-leaves-for-approval/team-leaves-for-approval.module';


@NgModule({
  // declarations: [DashboardLeavesComponent],
  imports: [
    // CommonModule,
    // ReactiveFormsModule,
    // FormsModule,
    // GridAllModule,
    // NgbNavModule,
    // FlatpickrModule,
    // TeamLeavesForApprovalModule
  ],
  //exports: [DashboardLeavesComponent],
 // providers: [FilterService, PageService ,SortService]

})
export class DashboardLeavesModule { }
