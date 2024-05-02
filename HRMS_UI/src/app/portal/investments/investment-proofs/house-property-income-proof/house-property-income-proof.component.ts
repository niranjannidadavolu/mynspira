import { Component, Input, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup, NG_VALUE_ACCESSOR, Validators } from '@angular/forms';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { commonMethods } from 'src/app/core/common/common.static';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import { SwiperSliderComponent } from 'src/app/shared/app-components/swiper-slider/swiper-slider.component';
import { UploadHousePropertyIncomeComponent } from './upload-house-property-income/upload-house-property-income.component';

@Component({
  selector: 'app-house-property-income-proof',
  templateUrl: './house-property-income-proof.component.html',
  styleUrls: ['./house-property-income-proof.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      multi: true,
      useExisting: HousePropertyIncomeProofComponent
    }
  ]
})
export class HousePropertyIncomeProofComponent implements OnInit {
  @Input() isVerify: boolean = false;
  value: any;
  housePropertyForm: FormGroup;
  verifyPan: boolean;
  constructor(private readonly formBuilder: FormBuilder,
    private readonly modalService: NgbModal,
    private readonly investmentProofsService: InvestmentProofsService,
  ) {
    this.verifyPan = false;
    this.housePropertyForm = new FormGroup({
      HousePropertyIncomeDetails: new FormArray([])
    });
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
  }

  get f() { return this.housePropertyForm.controls; }
  get HousePropertyIncomeDetails(): FormArray {
    return this.housePropertyForm.controls['HousePropertyIncomeDetails'] as FormArray;
  }
  setChapter6FormArray(items: any) {
    let item = this.housePropertyForm.controls['HousePropertyIncomeDetails'] as FormArray;
    item.controls.length = 0;
    items.forEach((item: any) => {
      this.HousePropertyIncomeDetails.push(this.buildChapter6Form(item))
    });
  }
  buildChapter6Form(item: any): FormGroup {
    let formGroup = this.formBuilder.group({
      HouseIncomeDetailId: new FormControl(item.HouseIncomeDetailId),
      Amount: new FormControl(item.Amount),
      Description: new FormControl(item.Description),
      HouseIncomeHeadId: new FormControl(item.HouseIncomeHeadId),
      PanNumber: new FormControl(item.PanNumber),
      VerifiedAmount: new FormControl(item.VerifiedAmount),
      IsPanVerified: new FormControl(item.IsPanVerified),
      VerifiedPan: new FormControl(item.VerifiedPan),
      VerifiedName: new FormControl(item.VerifiedName),
      VerifiedRemarks: new FormControl(item.VerifiedRemarks),
      VerifiedUserSlNo: new FormControl(item.VerifiedUserSlNo),
      FileCount: new FormControl(item.FileCount),
    });
    return formGroup;
  }
  numberOnly(event: any): boolean {
    return commonMethods.isNumberKey(event);
  }
  verifyPanCard(index: any, itemrow: any) {
    this.verifyPan = true;
    
    let k = itemrow.controls['PanNumber'].value;
    let panNumber = itemrow.controls['PanNumber'].value;
    if (panNumber === 'NO PAN') {
      let x = (<FormArray>this.HousePropertyIncomeDetails).at(index);
      //console.log(x);

      x.patchValue({
        IsPanVerified: "NOT VERIFIED.",
        VerifiedPan: "VERIFICATION NOT REQUIRED.",
        VerifiedName: "VERIFICATION NOT REQUIRED.",
      });
      this.verifyPan = false;
    }
    else {
      this.investmentProofsService.verifyPanNumber(1, panNumber).subscribe((data: any) => {
        

        let x = (<FormArray>this.HousePropertyIncomeDetails).at(index);
        //console.log(x);

        x.patchValue({
          IsPanVerified: "VERIFIED",
          VerifiedPan: data.Pan,
          VerifiedName: data.FullName,
        });
        this.verifyPan = false;
      });
    }
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
