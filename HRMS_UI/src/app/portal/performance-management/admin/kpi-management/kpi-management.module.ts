import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { KpiManagementRoutingModule } from './kpi-management-routing.module';
import { KpiInformationComponent } from './kpi-information/kpi-information.component';
import { KpiManagementComponent } from './kpi-management.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FilterService, GridAllModule, PageService } from '@syncfusion/ej2-angular-grids';
import { DropDownListAllModule, MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';
import { KpiUniqueValidator } from 'src/app/core/validators/kpi-async-validator-service';
import { KraInformationService, KpiInformationService } from 'src/app/core/services';


@NgModule({
  declarations: [
    KpiManagementComponent,
    KpiInformationComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    KpiManagementRoutingModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    GridAllModule,
    MultiSelectModule,
    DropDownListAllModule,
    
  ],
  providers: [KraInformationService, KpiInformationService, FilterService, PageService]
})
export class KpiManagementModule { }
