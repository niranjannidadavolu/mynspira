import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PendingReviewsRoutingModule } from './pending-reviews-routing.module';
import { GridAllModule } from '@syncfusion/ej2-angular-grids';
import { PendingReviewsComponent } from './pending-reviews.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DropDownListModule, MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';
import { NumericTextBoxModule } from '@syncfusion/ej2-angular-inputs';
import { TabAllModule } from '@syncfusion/ej2-angular-navigations';
import { EmployeePerformanceReviewService } from 'src/app/core/services';
import { EmployeePendingReviewComponent } from './employee-pending-review/employee-pending-review.component';


@NgModule({
  declarations: [PendingReviewsComponent, EmployeePendingReviewComponent],
  imports: [
    CommonModule,
    PendingReviewsRoutingModule,
    SharedModule,
    GridAllModule,
    FormsModule,
    ReactiveFormsModule,
    DropDownListModule,
    NumericTextBoxModule,
    MultiSelectAllModule,
    TabAllModule,
  ],
  providers: [EmployeePerformanceReviewService],
})
export class PendingReviewsModule {}
