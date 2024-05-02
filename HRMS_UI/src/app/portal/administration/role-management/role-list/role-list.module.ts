import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RoleListRoutingModule } from './role-list-routing.module';
import { RoleListComponent } from './role-list.component';
import { NgbDropdownModule, NgbNavModule, NgbPaginationModule, NgbTypeaheadModule } from '@ng-bootstrap/ng-bootstrap';
import { DataTablesModule } from 'angular-datatables';
import { FlatpickrModule } from 'angularx-flatpickr';
import { SharedModule } from 'src/app/shared/shared.module';
import { AddRoleInformationComponent } from '../add-role-information/add-role-information.component';
import { EditRoleInformationComponent } from '../edit-role-information/edit-role-information.component';
import { ViewRoleInformationComponent } from '../view-role-information/view-role-information.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DxDataGridModule } from 'devextreme-angular';
import { FilterService, GridAllModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';
import { CheckBoxModule } from '@syncfusion/ej2-angular-buttons';


@NgModule({
  declarations: [
    RoleListComponent,
    AddRoleInformationComponent,
    EditRoleInformationComponent,
    ViewRoleInformationComponent
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
    RoleListRoutingModule,
    DxDataGridModule,
    GridAllModule,
    CheckBoxModule 
  ],
providers:[ FilterService, PageService ,SortService]

})
export class RoleListModule { }
