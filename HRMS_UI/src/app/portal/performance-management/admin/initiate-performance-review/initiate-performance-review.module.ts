import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { InitiatePerformanceReviewRoutingModule } from './initiate-performance-review-routing.module';
import { TabAllModule } from '@syncfusion/ej2-angular-navigations';
import { SharedModule } from 'src/app/shared/shared.module';
import { InitiatePerformanceReviewComponent } from './initiate-performance-review.component';
import { AggregateService, CommandColumnService, EditService, GridAllModule, GroupService, PageService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { KraInformationService } from 'src/app/core/services';

@NgModule({
  declarations: [
    InitiatePerformanceReviewComponent
  ],
  imports: [
    CommonModule,
    InitiatePerformanceReviewRoutingModule,
    SharedModule,
    TabAllModule,
    GridAllModule,


  ],
  providers: [
    KraInformationService,
    AggregateService,
    EditService,
    GroupService,
    PageService,
    CommandColumnService,
    ToolbarService
  ]
})
export class InitiatePerformanceReviewModule { }
