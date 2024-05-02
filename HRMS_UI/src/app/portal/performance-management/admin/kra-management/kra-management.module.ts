import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { KraManagementRoutingModule } from './kra-management-routing.module';
import { KraInformationService } from 'src/app/core/services/perfomance-management';
import { SharedModule } from 'src/app/shared/shared.module';
import { FilterService, GridAllModule, PageService } from '@syncfusion/ej2-angular-grids';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { KraInformationComponent } from './kra-information/kra-information.component';
import { KraManagementComponent } from './kra-management.component';
import { MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';


@NgModule({
  declarations: [
    KraManagementComponent,
    KraInformationComponent
  ],
  imports: [
    CommonModule,
    KraManagementRoutingModule,
    SharedModule, 
    FormsModule,
    ReactiveFormsModule,
    GridAllModule,
    MultiSelectModule,
  ],
  providers:[KraInformationService, FilterService, PageService]
})
export class KraManagementModule { }
