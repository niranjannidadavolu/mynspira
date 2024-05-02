import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { InvestmentProofsRoutingModule } from './investment-proofs-routing.module';
import { InvestmentProofsComponent } from './investment-proofs/investment-proofs.component';
import { NgbAccordionModule,  NgbAlertModule,  NgbCollapseModule, NgbModalModule, NgbModule, NgbNavModule, NgbPanel } from '@ng-bootstrap/ng-bootstrap';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedModule } from 'src/app/shared/shared.module';
import { DxButtonModule, DxDataGridModule, DxFileUploaderModule } from 'devextreme-angular';
import { NgSelectModule } from '@ng-select/ng-select';
import { Chapte6ProofComponent } from './chapte6-proof/chapte6-proof.component';
import { HouseRentAllowanceProofComponent } from './house-rent-allowance-proof/house-rent-allowance-proof.component';
import { HousePropertyIncomeProofComponent } from './house-property-income-proof/house-property-income-proof.component';
import { OtherIncomeProofComponent } from './other-income-proof/other-income-proof.component';
import { UploadChapter6ProofsComponent } from './chapte6-proof/upload-chapter6-proofs/upload-chapter6-proofs.component';
import { UploadHousePropertyIncomeComponent } from './house-property-income-proof/upload-house-property-income/upload-house-property-income.component';
import { UploadOtherIncomeProofComponent } from './other-income-proof/upload-other-income-proof/upload-other-income-proof.component';
import { UploadHouseRentAllowanceComponent } from './house-rent-allowance-proof/upload-house-rent-allowance/upload-house-rent-allowance.component';
import { InvestmentsVerifyComponent } from './investments-verify/investments-verify.component';
import { Section80GComponent } from 'src/app/shared/app-components';
import { Section80GProofComponent } from './section80G-proof/section80G-proof.component';



@NgModule({
  declarations: [
    InvestmentProofsComponent,
    Chapte6ProofComponent,
    HouseRentAllowanceProofComponent,
    HousePropertyIncomeProofComponent,
    OtherIncomeProofComponent ,
    UploadChapter6ProofsComponent,
    UploadHouseRentAllowanceComponent,
    UploadHousePropertyIncomeComponent,
    UploadOtherIncomeProofComponent,
    Section80GProofComponent,
    InvestmentsVerifyComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    InvestmentProofsRoutingModule,
    NgbNavModule,
    NgbAccordionModule,
    NgbCollapseModule,
    SharedModule,
    NgbModalModule,
    DxDataGridModule,
    DxButtonModule,
    NgSelectModule,
    DxFileUploaderModule,
    NgbModule,
    NgbAlertModule
  ]
})
export class InvestmentProofsModule { }
