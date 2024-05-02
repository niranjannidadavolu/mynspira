import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LeaveTransactionsRoutingModule } from './leave-transactions-routing.module';
import { LeaveTransactionsComponent } from './leave-transactions.component';
import { NgSelectModule } from '@ng-select/ng-select';
import { DxButtonModule, DxDataGridModule, DxSelectBoxModule } from 'devextreme-angular';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedModule } from 'src/app/shared/shared.module';
import { FlatpickrModule } from 'angularx-flatpickr';
import { DropDownListAllModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { ExcelExportService, FreezeService, GridAllModule, PdfExportService, ResizeService, SelectionService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';


@NgModule({
  declarations: [
    LeaveTransactionsComponent
  ],
  imports: [
    CommonModule,
    LeaveTransactionsRoutingModule,
    DxDataGridModule,
    NgSelectModule,
    ReactiveFormsModule,
    FormsModule,
    SharedModule,
    FlatpickrModule,
    DxSelectBoxModule,
    DxButtonModule,
    DropDownListAllModule,
    MultiSelectAllModule,
    GridAllModule
  ],
  providers:[
    FreezeService, ResizeService, SortService,
    ToolbarService, ExcelExportService, PdfExportService, SelectionService 
  ]
})
export class LeaveTransactionsModule { }
