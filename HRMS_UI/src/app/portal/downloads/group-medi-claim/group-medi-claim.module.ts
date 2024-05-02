import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedModule } from 'src/app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DxDataGridModule } from 'devextreme-angular';
import { NgSelectModule } from '@ng-select/ng-select';
import { GroupMediClaimRoutingModule } from './group-medi-claim-routing.module';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    GroupMediClaimRoutingModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    DxDataGridModule,
    NgSelectModule
  ]
})
export class GroupMediClaimModule { }
