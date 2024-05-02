import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NgbModule, NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { LeavePolicyRoutingModule } from './leave-policy-routing.module';
import { LeavePolicyComponent } from './leave-policy.component';
import {  DxButtonModule, DxDataGridModule } from 'devextreme-angular';
import { LeavePopupComponent } from './leave-popup/leave-popup.component';
import { ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [LeavePolicyComponent, LeavePopupComponent],
  imports: [
    CommonModule,
    LeavePolicyRoutingModule,
    DxButtonModule,
    DxDataGridModule,
    NgbNavModule,
    NgbModule,
    ReactiveFormsModule,
  ]
})
export class LeavePolicyModule { }
