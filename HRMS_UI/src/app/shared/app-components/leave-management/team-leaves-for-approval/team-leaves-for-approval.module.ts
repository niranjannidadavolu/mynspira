import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FilterService, GridAllModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';
import { TeamLeavesForApprovalComponent } from './team-leaves-for-approval.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
@NgModule({
  declarations: [
    TeamLeavesForApprovalComponent
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    FormsModule,
    GridAllModule,
    NgbNavModule
  ],
  exports: [TeamLeavesForApprovalComponent],
  providers: [FilterService, PageService, SortService]
})
export class TeamLeavesForApprovalModule { }
