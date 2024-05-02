import { Component, Input, OnInit, ChangeDetectorRef } from '@angular/core';
import { ControlValueAccessor, FormArray, FormBuilder, FormControl, FormGroup, NG_VALUE_ACCESSOR } from '@angular/forms';
import { commonMethods } from 'src/app/core/common/common.static';
import { StorageService } from 'src/app/core/services';

import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import { SwiperSliderComponent } from 'src/app/shared/app-components/swiper-slider/swiper-slider.component';

@Component({
  selector: 'app-section80G-proof',
  templateUrl: './section80G-proof.component.html',
  styleUrls: ['./section80G-proof.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      multi: true,
      useExisting: Section80GProofComponent
    }
  ]
})
export class Section80GProofComponent implements OnInit, ControlValueAccessor {

  @Input() isVerify: any;
  canUpload: any;
  value: any;
  section8GForm: FormGroup;
  profile: any;
  verifyPan: boolean;
  constructor(
    private readonly formBuilder: FormBuilder,
    private changeDetector: ChangeDetectorRef,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal,
    private readonly investmentProofsService: InvestmentProofsService) {

    this.verifyPan = false;
    this.profile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.getMyProfile();
    this.section8GForm = this.formBuilder.group({
      // SectionName: new FormControl(''),
      // Chapter6DetailId: new FormControl(''),
      // SubHeadId: new FormControl(''),
      // Amount: new FormControl(''),
      // VerifiedAmount: new FormControl(''),
      // VerifiedRemarks: new FormControl(''),
      // VerifiedUserSlNo: this.profile.EmployeeSlno,
      // FileCount: new FormControl(''),
      // EmployeeSlNo: new FormControl(''),
      // EmpSlno: new FormControl(''),
      // FinSlno: new FormControl(''),
      // Particulars: new FormControl(''),
      // UniqueNo: new FormControl(''),
      Section80GDetails: new FormArray([]),
    });
  }

  ngOnInit(): void {

  }

  get Section80GDetails(): FormArray {
    return this.section8GForm.controls['Section80GDetails'] as FormArray;
  }
  setOrderItemArray(items: any) {

    items?.forEach((item: any) => {
      this.Section80GDetails.push(this.buildOrderItemsForm(item))
    });
  }
  buildOrderItemsForm(item: any): FormGroup {
    let formGroup = this.formBuilder.group({
      Amount: new FormControl(item.Amount),
      FileCount: new FormControl(item.FileCount),
      EMPLOYEESLNO: new FormControl(item.EMPLOYEESLNO),
      FINSLNO: new FormControl(item.FINSLNO),
      EMPSLNO: new FormControl(item.EMPSLNO),
      ORGSLNO: new FormControl(item.ORGSLNO),
      ORG_NAME: new FormControl(item.ORG_NAME),
      ORG_PAN: new FormControl(item.ORG_PAN),
      IsPanVerified: new FormControl(item.IsPanVerified),
      VerifiedPan: new FormControl(item.VerifiedPan),
      VerifiedName: new FormControl(item.VerifiedName),
      TDS80GSLNO: new FormControl(item.TDS80GSLNO),
      TDSEMPSLNO: new FormControl(item.TDSEMPSLNO),
      TDSEMPSHSLNO: new FormControl(item.TDSEMPSHSLNO),
      UNIQUENO: new FormControl(item.UNIQUENO),
      VerifiedAmount: new FormControl(item.VerifiedAmount),
      VerifiedRemarks: new FormControl(item.VerifiedRemarks),
      VerifiedUserSlNo: new FormControl(this.profile.EmployeeSlno)
    })

    return formGroup;
  }

  onChange = (value: any) => { };
  onTouched = () => { };
  onValidationChange: any = () => { };

  writeValue(value: any): void {

    if (value) {
      // this.section8GForm.patchValue({
      //   SectionName: new FormControl(value.SectionName),
      //   Chapter6DetailId: new FormControl(value.Chapter6DetailId),
      //   SubHeadId: new FormControl(value.SubHeadId),
      //   Amount: new FormControl(value.Amount),
      //   VerifiedAmount: new FormControl(value.VerifiedAmount),
      //   VerifiedRemarks: new FormControl(value.VerifiedRemarks),
      //   VerifiedUserSlNo: new FormControl(value.VerifiedUserSlNo),
      //   FileCount: new FormControl(value.FileCount),
      //   EmployeeSlNo: new FormControl(value.EmployeeSlNo),
      //   EmpSlno: new FormControl(value.EmpSlno),
      //   FinSlno: new FormControl(value.FinSlno),
      //   Particulars: new FormControl(value.Particulars),
      //   UniqueNo: new FormControl(value.UniqueNo),
      // });
      // this.changeDetector.detectChanges();
      this.setOrderItemArray(value.Section80GDetails);
      this.section8GForm.valueChanges.subscribe((data: any) => {
        this.onChange(this.section8GForm.value);
        this.onValidationChange();
      });

    }
  }
  registerOnChange(onChange: any): void {
    this.onChange = onChange;
  }

  registerOnTouched(onTouched: any): void {
    this.onTouched = onTouched;
  }
  getMyProfile() {
    // 
    if (this.profile) {
      this.canUpload = this.profile.AllowProofUpload;
      this.isVerify = this.profile.AllowVerfication;
    }
  }
  numberOnly(event: any): boolean {
    return commonMethods.isNumberKey(event);
  }
  verifyPanCard(index: any, itemrow: any) {
    this.verifyPan = true;

    let k = itemrow.controls['ORG_PAN'].value;
    let panNumber = itemrow.controls['ORG_PAN'].value;
    this.investmentProofsService.verifyPanNumber(1, panNumber).subscribe((data: any) => {


      let x = (<FormArray>this.Section80GDetails).at(index);
      //console.log(x);

      x.patchValue({
        IsPanVerified: "VERIFIED",
        VerifiedPan: data.Pan,
        VerifiedName: data.FullName,
      });
      this.verifyPan = false;
    });
  }
  viewAttachments(caserow: any) {
    this.investmentProofsService.getSection80GFiles(caserow.value.TDS80GSLNO).subscribe((data: any[]) => {
      if (data) {

        const modalRef = this.modalService.open(SwiperSliderComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
        let obj = {
          title: 'Section 80G Files',
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

