import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UserManagementRoutingModule } from './user-management-routing.module';
import { SharedModule } from 'src/app/shared/shared.module';
import { DataTablesModule } from 'angular-datatables';
import { NgbDropdownModule, NgbNavModule, NgbPaginationModule, NgbTypeaheadModule } from '@ng-bootstrap/ng-bootstrap';
import { UserRoleMappingComponent } from './user-role-mapping/user-role-mapping.component';
import { FlatpickrModule } from 'angularx-flatpickr';
import { DxDataGridModule } from 'devextreme-angular';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { EditUserInformationComponent } from './edit-user-information/edit-user-information.component';
import { FilterService, GridAllModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';
import { MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';
import { CheckBoxModule } from '@syncfusion/ej2-angular-buttons';
@NgModule({
  declarations: [
    EditUserInformationComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    NgbDropdownModule,
    NgbNavModule,
    DataTablesModule,    
    NgbDropdownModule,
    NgbPaginationModule,
    NgbTypeaheadModule,
    FlatpickrModule,
    DxDataGridModule,
    FormsModule,
    ReactiveFormsModule,
    UserManagementRoutingModule,
    GridAllModule,
    MultiSelectModule,
    CheckBoxModule 
  ],
providers:[ FilterService, PageService ,SortService]
})
export class UserManagementModule { }
