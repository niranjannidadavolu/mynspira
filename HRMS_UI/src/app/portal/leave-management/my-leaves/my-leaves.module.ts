import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MyLeavesRoutingModule } from './my-leaves-routing.module';
import { MyLeavesComponent } from './my-leaves.component';
import { NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { SharedModule } from 'src/app/shared/shared.module';
import { FilterService, GridAllModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';
import { MyLeavesDashboardModule } from 'src/app/shared/app-components/leave-management/my-leaves-dashboard/my-leaves-dashboard.module';


@NgModule({
  declarations: [
    MyLeavesComponent
  ],
  imports: [
    CommonModule,
    NgbNavModule,
    MyLeavesRoutingModule,
    SharedModule,
    GridAllModule,
    MyLeavesDashboardModule
  ],
  providers: [FilterService, PageService ,SortService]
})
export class MyLeavesModule { }
