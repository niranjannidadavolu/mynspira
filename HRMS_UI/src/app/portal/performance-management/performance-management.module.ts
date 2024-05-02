import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PerformanceManagementRoutingModule } from './performance-management-routing.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DropDownListModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { GridAllModule } from '@syncfusion/ej2-angular-grids';
import { NumericTextBoxModule } from '@syncfusion/ej2-angular-inputs';
import { TabAllModule } from '@syncfusion/ej2-angular-navigations';
import { SharedModule } from 'src/app/shared/shared.module';

@NgModule({
  declarations: [
    
  ],
  imports: [
    CommonModule,
    PerformanceManagementRoutingModule,
    SharedModule,
    GridAllModule,
    FormsModule,
    ReactiveFormsModule,
    DropDownListModule,
    NumericTextBoxModule,
    MultiSelectAllModule,
    TabAllModule,
  ]
})
export class PerformanceManagementModule { }
