import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { LeaveInformationRoutingModule } from './leave-information-routing.module';
import { LeaveInformationComponent } from './leave-information.component';
import { NgbDropdownModule, NgbNavModule, NgbPaginationModule, NgbTypeaheadModule } from '@ng-bootstrap/ng-bootstrap';
import { DataTablesModule } from 'angular-datatables';
import { FlatpickrModule } from 'angularx-flatpickr';
import { SharedModule } from 'src/app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import {  DxButtonModule, DxDataGridModule, DxSelectBoxModule } from 'devextreme-angular';
import { LeaveInformationPopupComponent } from './leave-information-popup/leave-information-popup.component';
import { NgSelectModule } from '@ng-select/ng-select';


@NgModule({
  declarations: [LeaveInformationComponent, LeaveInformationPopupComponent],
  imports: [
    CommonModule,
    SharedModule,
    DataTablesModule,
    NgbDropdownModule,
    NgbNavModule,  
    NgbDropdownModule,
    NgbPaginationModule,
    NgbTypeaheadModule,
    FlatpickrModule,
    ReactiveFormsModule,
    FormsModule,
    LeaveInformationRoutingModule, 
    DxButtonModule,
    DxDataGridModule,
    ReactiveFormsModule, 
    NgSelectModule,
    DxSelectBoxModule
    
  ],
  exports:[LeaveInformationComponent]
})
export class LeaveInformationModule { }
