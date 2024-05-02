import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedModule } from 'src/app/shared/shared.module';
import { MyTeamLeavesRoutingModule } from './my-team-leaves-routing.module';
import { DropDownListAllModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import {  DateRangePickerAllModule } from '@syncfusion/ej2-angular-calendars';
import { MyTeamLeavesComponent } from './my-team-leaves.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ExcelExportService, FreezeService, GridAllModule, PdfExportService, ResizeService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { CheckBoxModule, ButtonModule } from '@syncfusion/ej2-angular-buttons';
import { NumericTextBoxAllModule, RatingAllModule, NumericTextBoxModule } from '@syncfusion/ej2-angular-inputs';
import { ToolbarModule } from '@syncfusion/ej2-angular-navigations';

@NgModule({
  declarations: [
    MyTeamLeavesComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    MyTeamLeavesRoutingModule,
    CheckBoxModule, ButtonModule,
    DateRangePickerAllModule,
    DropDownListAllModule, MultiSelectAllModule,
    GridAllModule,
    NumericTextBoxAllModule, RatingAllModule, NumericTextBoxModule,
    ToolbarModule,
  ],
  providers: [FreezeService, ResizeService, SortService,
    ToolbarService, ExcelExportService, PdfExportService],

  exports: []

})
export class MyTeamLeavesModule { }
