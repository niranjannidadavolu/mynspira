import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LogsRoutingModule } from './logs.routing.module';
import { LogsComponent } from './logs.component';
import { SharedModule } from "src/app/shared/shared.module";
import { NgbAccordionModule, NgbDropdownModule, NgbModule, NgbTooltipModule } from '@ng-bootstrap/ng-bootstrap';
import { ErrorLogService } from 'src/app/core/services';
import { DxDataGridModule } from 'devextreme-angular';
import { FilterService, GridAllModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';


@NgModule({
    declarations: [
        LogsComponent
    ],
    imports: [
      LogsRoutingModule,
      CommonModule,    
      SharedModule,
      NgbModule,  
      NgbDropdownModule,
      NgbAccordionModule,
      NgbTooltipModule,
      DxDataGridModule,
      GridAllModule,
    ],
  providers:[ ErrorLogService, PageService ,SortService,FilterService]
  
})
export class LogsModule { }
