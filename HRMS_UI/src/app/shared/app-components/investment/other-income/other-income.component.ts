import { Component, Input, OnInit } from '@angular/core';
import { ControlValueAccessor, FormArray, FormBuilder, FormControl, FormGroup, NG_VALUE_ACCESSOR } from '@angular/forms';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { commonMethods } from 'src/app/core/common/common.static';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import { SwiperSliderComponent } from '../../swiper-slider/swiper-slider.component';
import { UploadOtherIncomeProofComponent } from './upload-other-income-proof/upload-other-income-proof.component';
import { StorageService } from 'src/app/core/services';

@Component({
  selector: 'app-other-income',
  templateUrl: './other-income.component.html',
  styleUrls: ['./other-income.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      multi: true,
      useExisting: OtherIncomeComponent
    }
  ]
})
export class OtherIncomeComponent implements OnInit, ControlValueAccessor {

  isVerify: any;
  canUpload: any;
  value: any;
  otherIncomeForm: FormGroup;
  profile: any;

  constructor(private readonly formBuilder: FormBuilder,
    private readonly modalService: NgbModal,
    private readonly investmentProofsService: InvestmentProofsService,
    private readonly storageService: StorageService) {
    this.otherIncomeForm = new FormGroup({
      OtherIncomeDetails: new FormArray([])
    });
    this.profile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.getMyProfile();
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
  getMyProfile() {
    // 
    if (this.profile) {
      this.canUpload = false;//this.profile.AllowProofUpload;
      this.isVerify = this.profile.AllowVerfication;
    }
  }
  get otherIncomeDetails(): FormArray {
    return this.otherIncomeForm.controls['OtherIncomeDetails'] as FormArray;
  }
  setOtherIncomeFormArray(items: any) {
    items.forEach((item: any) => {
      this.otherIncomeDetails.push(this.buildOtherIncomeForm(item))
    });
  }
  buildOtherIncomeForm(item: any): FormGroup {
    let formGroup = this.formBuilder.group({

      Amount: new FormControl(item.Amount),
      OtherIncomeDetailId: item.OtherIncomeDetailId,
      OthIncomeHeadId: item.OthIncomeHeadId,
      Description: item.Description,
      VerifiedAmount: new FormControl({ value: item.VerifiedAmount, disabled: true }),
      VerifiedRemarks: new FormControl({ value: item.VerifiedRemarks, disabled: true }),
      TdsAmount: item.TdsAmount
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
          (reason: any) => {
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
