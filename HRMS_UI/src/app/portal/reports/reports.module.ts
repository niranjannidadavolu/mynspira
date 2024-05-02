import { ReportsService } from './../../core/services/reports/reports.service';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ReportsRoutingModule } from './reports-routing.module';
import { BranchesService } from 'src/app/core/services/masters';
import { SharedModule } from "src/app/shared/shared.module";
@NgModule({
    declarations: [
  ],
    providers: [BranchesService, ReportsService],
    imports: [
        CommonModule,
        ReportsRoutingModule,
        SharedModule
    ]
})
export class ReportsModule { }
