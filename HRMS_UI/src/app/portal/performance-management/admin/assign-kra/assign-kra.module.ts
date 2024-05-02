import { NumericTextBoxModule } from '@syncfusion/ej2-angular-inputs';

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AssignKraRoutingModule } from './assign-kra-routing.module';
import { AssignKraComponent } from './assign-kra.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AggregateService, CommandColumnService, EditService, GridAllModule, GroupService, PageService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { DropDownListAllModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { SharedModule } from 'src/app/shared/shared.module';
import { AssignKraService, DepartmentInformationService, FrequencyInformationService, KpiInformationService } from 'src/app/core/services/perfomance-management';


@NgModule({
  declarations: [AssignKraComponent],
  imports: [
    CommonModule,
    AssignKraRoutingModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    GridAllModule,
    DropDownListAllModule,
    NumericTextBoxModule,
    MultiSelectAllModule
  ],
  providers: [
    EditService,
    ToolbarService,
    CommandColumnService,
    PageService,
    GroupService,
    AggregateService,
    DepartmentInformationService,
    FrequencyInformationService,
    KpiInformationService,
    AssignKraService ]

})
export class AssignKraModule { }
