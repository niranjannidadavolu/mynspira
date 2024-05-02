import { Component, Input, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, NG_VALUE_ACCESSOR, Validators } from '@angular/forms';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { commonMethods } from 'src/app/core/common/common.static';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import { SwiperSliderComponent } from 'src/app/shared/app-components/swiper-slider/swiper-slider.component';
import { UploadOtherIncomeProofComponent } from './upload-other-income-proof/upload-other-income-proof.component';

@Component({
  selector: 'app-other-income-proof',
  templateUrl: './other-income-proof.component.html',
  styleUrls: ['./other-income-proof.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      multi: true,
      useExisting: OtherIncomeProofComponent
    }
  ]
})
export class OtherIncomeProofComponent implements OnInit {

  value: any;
  otherIncomeForm: FormGroup;
  @Input() isVerify: boolean = false;

  constructor(private readonly formBuilder: FormBuilder,
    private readonly modalService: NgbModal,
    private readonly investmentProofsService: InvestmentProofsService,
    ) {
    this.otherIncomeForm = new FormGroup({
      OtherIncomeDetails: new FormArray([])
    });
  }
  onChange = (value: any) => { };
  onTouched = () => { };
  writeValue(value: any): void {
    if (value) {
      this.setOtherIncomeFormArray(value);
      this.otherIncomeDetails.valueChanges.subscribe((data: any) => { this.onChange(this.otherIncomeDetails.value) });
    }
  }
  registerOnChange(onChange: any): void {
    this.onChange = onChange;
  }

  registerOnTouched(onTouched: any): void {
    this.onTouched = onTouched;
  }

  ngOnInit(): void {
  }

  get f() { return this.otherIncomeForm.controls; }
  get otherIncomeDetails(): FormArray {
    return this.otherIncomeForm.controls['OtherIncomeDetails'] as FormArray;
  }
  setOtherIncomeFormArray(items: any) {

    let item = this.otherIncomeForm.controls['OtherIncomeDetails'] as FormArray;
    item.controls.length = 0;
    items.forEach((item: any) => {
      this.otherIncomeDetails.push(this.buildOtherIncomeForm(item))
    });
  }
  buildOtherIncomeForm(item: any): FormGroup {
    let formGroup = this.formBuilder.group({

      Amount: [item.Amount, [Validators.required]],
      OtherIncomeDetailId: item.OtherIncomeDetailId,
      OthIncomeHeadId: item.OthIncomeHeadId,
      Description: item.Description,
      VerifiedAmount: item.VerifiedAmount,
      TdsAmount: [item.TdsAmount, [Validators.required]],
      VerifiedRemarks: item.VerifiedRemarks,
      VerifiedUserSlNo: item.VerifiedUserSlNo,
      FileCount: item.FileCount
    });
    return formGroup;
  }
  numberOnly(event: any): boolean {
    return commonMethods.isNumberKey(event);
  }

  uploadOtherIncomeFiles(otherIncomeDetails: any) {
    const modalRef = this.modalService.open(UploadOtherIncomeProofComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.otherIncomeDetails = otherIncomeDetails.value;
    modalRef.result.then(() => {

    },
    (reason) => {
      let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
      
    });
  }
  viewAttachments(caserow: any) {
    this.investmentProofsService.getHouseIncomeFiles(caserow.value.OtherIncomeDetailId).subscribe((data: any[]) => {
      if (data) {
        const modalRef = this.modalService.open(SwiperSliderComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
        let obj = {
          title: 'Other Income',
          attachments: data
        };
        modalRef.componentInstance.attchmentmentDetails = obj;
        modalRef.result.then(() => {
        },
        (reason) => {
          let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
          
        });
      }
    });
  }
  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
}
}
