import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ApplyEmployeeLeaveByHrOpsRoutingModule } from './apply-employee-leave-by-hr-ops-routing.module';
import { ApplyEmployeeLeaveByHrOpsComponent } from './apply-employee-leave-by-hr-ops.component';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { NgSelectModule } from '@ng-select/ng-select';
import { FlatpickrModule } from 'angularx-flatpickr';
import { DxFileUploaderModule } from 'devextreme-angular';
import { SharedModule } from 'src/app/shared/shared.module';


@NgModule({
  declarations: [
    ApplyEmployeeLeaveByHrOpsComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    ApplyEmployeeLeaveByHrOpsRoutingModule, 
    ReactiveFormsModule,
    FormsModule, 
    FlatpickrModule,    
    DxFileUploaderModule,
    NgSelectModule 
  ]
})
export class ApplyEmployeeLeaveByHrOpsModule { }
