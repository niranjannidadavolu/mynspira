import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ScoreManagementRoutingModule } from './score-management-routing.module';
import { ScoreManagementComponent } from './score-management.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { GridAllModule } from '@syncfusion/ej2-angular-grids';
import { ManagerPerformanceEvaluationService } from 'src/app/core/services/perfomance-management/manager-performance-evaluation.service';
import { AssignKraService } from 'src/app/core/services';


@NgModule({
  declarations: [
    ScoreManagementComponent,
  ],
  imports: [
    CommonModule,
    ScoreManagementRoutingModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    GridAllModule,
  ],
  providers: [
    ManagerPerformanceEvaluationService,
    AssignKraService
    
  ]
})
export class ScoreManagementModule { }
