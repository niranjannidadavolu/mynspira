import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WorkflowTrackerComponent } from './workflow-tracker.component';
import { DxTooltipModule } from 'devextreme-angular/ui/tooltip';
@NgModule({
  declarations: [WorkflowTrackerComponent],
  imports: [
    CommonModule,
     DxTooltipModule ,
  ],
  exports:[WorkflowTrackerComponent],
})
export class WorkflowTrackerModule { }
