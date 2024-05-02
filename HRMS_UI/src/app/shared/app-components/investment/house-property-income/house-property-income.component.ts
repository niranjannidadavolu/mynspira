import { Component, Input, OnInit } from '@angular/core';
import { ControlValueAccessor, FormArray, FormBuilder, FormControl, FormGroup, NG_VALUE_ACCESSOR } from '@angular/forms';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { commonMethods } from 'src/app/core/common/common.static';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import { SwiperSliderComponent } from '../../swiper-slider/swiper-slider.component';
import { UploadHousePropertyIncomeComponent } from './upload-house-property-income/upload-house-property-income.component';
import { StorageService } from 'src/app/core/services';

@Component({
  selector: 'app-house-property-income',
  templateUrl: './house-property-income.component.html',
  styleUrls: ['./house-property-income.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      multi: true,
      useExisting: HousePropertyIncomeComponent
    }
  ]
})
export class HousePropertyIncomeComponent implements OnInit, ControlValueAccessor {

  value: any;
  housePropertyForm: FormGroup;
  isVerify: any;
  canUpload: any;
  profile: any;
  constructor(private readonly formBuilder: FormBuilder,
    private readonly investmentProofsService: InvestmentProofsService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal) {
    this.profile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.getMyProfile();
    this.housePropertyForm = new FormGroup({
      HousePropertyIncomeDetails: new FormArray([])
    });
    this.canUpload = false;
  }
  getMyProfile() {
    //
    if (this.profile) {
      this.canUpload = false;//this.profile.AllowProofUpload;
      this.isVerify = this.profile.AllowVerfication;
    }
  }
  onChange = (value: any) => { };
  onTouched = () => { };
  writeValue(value: any): void {

    this.value = value;
    if (value) {
      this.setChapter6FormArray(value);
      this.HousePropertyIncomeDetails.valueChanges.subscribe((data: any) => { this.onChange(this.HousePropertyIncomeDetails.value) });
    }
  }
  registerOnChange(onChange: any): void {
    this.onChange = onChange;
  }

  registerOnTouched(onTouched: any): void {
    this.onTouched = onTouched;
  }

  ngOnInit(): void {
    this.isVerify = true;
  }

  get HousePropertyIncomeDetails(): FormArray {
    return this.housePropertyForm.controls['HousePropertyIncomeDetails'] as FormArray;
  }
  setChapter6FormArray(items: any) {
    items.forEach((item: any) => {
      this.HousePropertyIncomeDetails.push(this.buildChapter6Form(item))
    });
  }
  buildChapter6Form(item: any): FormGroup {
    let formGroup = this.formBuilder.group({
      HouseIncomeDetailId: item.HouseIncomeDetailId,
      Amount: item.Amount,
      Description: item.Description,
      HouseIncomeHeadId: item.HouseIncomeHeadId,
      PanNumber: item.PanNumber,
      VerifiedAmount: new FormControl({ value: item.VerifiedAmount, disabled: true }),
      VerifiedRemarks: new FormControl({ value: item.VerifiedRemarks, disabled: true }),
    });
    return formGroup;
  }
  numberOnly(event: any): boolean {
    return commonMethods.isNumberKey(event);
  }
  uploadHousePropertyFiles(houseProperyIncomeDetails: any) {
    const modalRef = this.modalService.open(UploadHousePropertyIncomeComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.houseProperyIncomeDetails = houseProperyIncomeDetails.value;
    modalRef.result.then(() => {

    },
      (reason) => {
        let closeResult = `Dismissed ${this.getDismissReason(reason)}`;

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
  viewAttachments(caserow: any) {
    this.investmentProofsService.getHouseIncomeFiles(caserow.value.HouseIncomeDetailId).subscribe((data: any[]) => {
      if (data) {
        const modalRef = this.modalService.open(SwiperSliderComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
        let obj = {
          title: 'House Property Income',
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
}
