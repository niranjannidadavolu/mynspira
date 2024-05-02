import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NgbDropdownModule, NgbNavModule, NgbPaginationModule, NgbTypeaheadModule } from '@ng-bootstrap/ng-bootstrap';
import { DataTablesModule } from 'angular-datatables';
import { FlatpickrModule } from 'angularx-flatpickr';
import { SharedModule } from 'src/app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import {  DxButtonModule, DxContextMenuModule, DxDataGridModule, DxSelectBoxModule, DxTemplateModule } from 'devextreme-angular';
import { LeaveEntitlementComponent } from './leave-entitlement.component';
import { LeaveEntitlementRoutingModule } from './leave-entitlement-routing.module';
import { UpdateEntitlementComponent } from './update-entitlement/update-entitlement.component';
import { NgSelectModule } from '@ng-select/ng-select';
import { CasualLeaveComponent } from './leave-entitlement-components/casual-leave/casual-leave.component';
import { SickLeaveComponent } from './leave-entitlement-components/sick-leave/sick-leave.component';
import { OnDutyComponent } from './leave-entitlement-components/on-duty/on-duty.component';
import { PaternityLeaveComponent } from './leave-entitlement-components/paternity-leave/paternity-leave.component';
import { MaternityLeaveComponent } from './leave-entitlement-components/maternity-leave/maternity-leave.component';
import { MarriageLeaveComponent } from './leave-entitlement-components/marriage-leave/marriage-leave.component';
import { BereavementLeaveComponent } from './leave-entitlement-components/bereavement-leave/bereavement-leave.component';
import { SummerVacationComponent } from './leave-entitlement-components/summer-vacation/summer-vacation.component';
import { WinterVacationComponent } from './leave-entitlement-components/winter-vacation/winter-vacation.component';
import { SpecialCasualLeaveComponent } from './leave-entitlement-components/special-casual-leave/special-casual-leave.component';
import { PrivilegeLeaveComponent } from './leave-entitlement-components/privilege-leave/privilege-leave.component';
import { SpecialSickLeaveComponent } from './leave-entitlement-components/special-sick-leave/special-sick-leave.component';
import { CompOffComponent } from './leave-entitlement-components/comp-off/comp-off.component';
import { EarlyLogoutComponent } from './leave-entitlement-components/early-logout/early-logout.component';
import { FilterService, GridAllModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';


@NgModule({
  declarations: [
    LeaveEntitlementComponent,
    UpdateEntitlementComponent,
    CasualLeaveComponent,
    SickLeaveComponent,
    OnDutyComponent,
    PaternityLeaveComponent,
    MaternityLeaveComponent,
    MarriageLeaveComponent,
    BereavementLeaveComponent,
    SummerVacationComponent,
    WinterVacationComponent,
    SpecialCasualLeaveComponent,
    PrivilegeLeaveComponent,
    SpecialSickLeaveComponent,
    CompOffComponent,
    EarlyLogoutComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    DataTablesModule,
    NgbDropdownModule,
    NgbNavModule,
    NgbDropdownModule,
    NgbPaginationModule,
    NgbTypeaheadModule,
    FlatpickrModule,
    ReactiveFormsModule,
    FormsModule,
    LeaveEntitlementRoutingModule,
    DxButtonModule,
    DxDataGridModule,
    NgSelectModule,
    DxSelectBoxModule,
    DxContextMenuModule,
    DxTemplateModule,
    GridAllModule,
    ],
  providers:[  PageService ,SortService,FilterService]
  
  // exports: []
})
export class LeaveEntitlementModule { }
