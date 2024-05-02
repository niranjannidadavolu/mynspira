import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UserListRoutingModule } from './user-list-routing.module';
import { UserListComponent } from './user-list.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { DataTablesModule } from 'angular-datatables';
import { UserRoleMappingComponent } from '../user-role-mapping/user-role-mapping.component';
import { NgbDropdownModule, NgbNavModule, NgbPaginationModule, NgbTypeaheadModule } from '@ng-bootstrap/ng-bootstrap';
import { FlatpickrModule } from 'angularx-flatpickr';
import { DxDataGridModule } from 'devextreme-angular';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FilterService, GridAllModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';
import { MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';



@NgModule({
  declarations: [
    UserListComponent,
    UserRoleMappingComponent,
  ],
  imports: [
    CommonModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    DataTablesModule,
    NgbDropdownModule,
    NgbNavModule,  
    NgbDropdownModule,
    NgbPaginationModule,
    NgbTypeaheadModule,
    FlatpickrModule,
    DxDataGridModule,
    UserListRoutingModule,
    GridAllModule,
    MultiSelectModule
  ],
  
providers:[ FilterService, PageService ,SortService]
})
export class UserListModule { }
