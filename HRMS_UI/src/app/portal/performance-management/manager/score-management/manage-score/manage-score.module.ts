import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ManageScoreRoutingModule } from './manage-score-routing.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DropDownListModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { GridAllModule } from '@syncfusion/ej2-angular-grids';
import { NumericTextBoxModule } from '@syncfusion/ej2-angular-inputs';
import { SharedModule } from 'src/app/shared/shared.module';
import { ManageScoreComponent } from './manage-score.component';
import { KpiInformationService } from 'src/app/core/services';


@NgModule({
  declarations: [
    ManageScoreComponent
  ],
  imports: [
    CommonModule,
    ManageScoreRoutingModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    GridAllModule,
    DropDownListModule,
    NumericTextBoxModule,
    MultiSelectAllModule,
  ],
  providers: [KpiInformationService]
})
export class ManageScoreModule { }
