import { NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';

import { DashBoardRoutingModule } from './dash-board-routing.module';
import { LeafletModule } from '@asymmetrik/ngx-leaflet';
import { NgbToastModule, NgbDropdownModule, NgbNavModule, NgbPaginationModule, NgbTypeaheadModule, NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { CountToModule } from 'angular-count-to';
import { FeatherModule } from 'angular-feather';
import { allIcons } from 'angular-feather/icons';
import { FlatpickrModule } from 'angularx-flatpickr';
import { NgApexchartsModule } from 'ng-apexcharts';
import { SwiperModule } from 'ngx-swiper-wrapper';
import { SimplebarAngularModule } from 'simplebar-angular';
import { SharedModule } from 'src/app/shared/shared.module';
import { WidgetModule } from 'src/app/shared/widget/widget.module';
import { DashBoardComponent } from './dash-board/dash-board.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DataTablesModule } from 'angular-datatables';
import { DxButtonModule, DxCalendarModule, DxDataGridModule, DxDateBoxModule, DxFormModule, DxSelectBoxModule, DxTextAreaModule } from 'devextreme-angular';
import { YearCalenderComponent } from './year-calender/year-calender.component';
import { LeaveDayTypeService, LeaveTypeService } from 'src/app/core/services/masters';
import { EmployeeService, EmployeeVerificationService } from 'src/app/core/services';
import { NgSelectModule } from '@ng-select/ng-select';
import { TeamLeavesForApprovalModule } from 'src/app/shared/app-components/leave-management/team-leaves-for-approval/team-leaves-for-approval.module';
import { MyLeavesDashboardModule } from 'src/app/shared/app-components/leave-management/my-leaves-dashboard/my-leaves-dashboard.module';


@NgModule({
  declarations: [
    DashBoardComponent,
    YearCalenderComponent
  ],
  imports: [
    CommonModule,
    NgbToastModule,
    FeatherModule.pick(allIcons),
    CountToModule,
    LeafletModule,
    NgbDropdownModule,
    NgbNavModule,
    SimplebarAngularModule,
    NgApexchartsModule,
    SwiperModule,
    FlatpickrModule.forRoot(),
    SharedModule,
    WidgetModule,
    FormsModule,
    ReactiveFormsModule,
    NgbDropdownModule,
    NgbPaginationModule,
    NgbTypeaheadModule,
    DataTablesModule,
    DxDataGridModule,
    DashBoardRoutingModule,
    DxSelectBoxModule,
    DxTextAreaModule,
    DxDateBoxModule,
    DxButtonModule,
    DxFormModule,
    DxCalendarModule,
    NgSelectModule,
    TeamLeavesForApprovalModule,
    MyLeavesDashboardModule
  ],
  providers:[
    EmployeeService,
    LeaveDayTypeService, 
    LeaveTypeService,
    DatePipe,
    EmployeeVerificationService
  ]
})
export class DashBoardModule { }
