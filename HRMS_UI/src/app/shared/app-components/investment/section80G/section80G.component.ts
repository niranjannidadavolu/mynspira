import { ChangeDetectorRef, Component, Input, OnInit } from '@angular/core';
import { ControlValueAccessor, FormArray, FormBuilder, FormControl, FormGroup, NG_VALUE_ACCESSOR } from '@angular/forms';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { commonMethods } from 'src/app/core/common/common.static';
import { StorageService } from 'src/app/core/services';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import { UploadOtherIncomeProofComponent } from '../other-income/upload-other-income-proof/upload-other-income-proof.component';
import { SwiperSliderComponent } from '../../swiper-slider/swiper-slider.component';
import { UploadSection80GProofComponent } from './upload-section80G-proof/upload-section80G-proof.component';

@Component({
  selector: 'app-section80G',
  templateUrl: './section80G.component.html',
  styleUrls: ['./section80G.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      multi: true,
      useExisting: Section80GComponent
    }
  ]
})
export class Section80GComponent implements OnInit, ControlValueAccessor {

  isVerify: any;
  canUpload: any;
  value: any;
  section8GForm: FormGroup;
  profile: any;
  constructor(
    private readonly formBuilder: FormBuilder,
    private changeDetector: ChangeDetectorRef,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal,
    private readonly investmentProofsService: InvestmentProofsService) {
    
    this.profile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.getMyProfile();
    this.section8GForm = this.formBuilder.group({
      SectionName: [''],
      Chapter6DetailId: [''],
      SubHeadId: [''],
      Amount: [''],
      VerifiedAmount: [''],
      VerifiedRemarks: [''],
      VerifiedUserSlNo: this.profile.EmployeeSlno,
      FileCount: [''],
      EmployeeSlNo: [''],
      EmpSlno: [''],
      FinSlno: [''],
      Particulars: [''],
      UniqueNo: [''],
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
      Amount: item.Amount,
      FileCount: item.FileCount,
      EMPLOYEESLNO: item.EMPLOYEESLNO,
      FINSLNO: item.FINSLNO,
      EMPSLNO: item.EMPSLNO,
      ORGSLNO: item.ORGSLNO,
      ORG_NAME: item.ORG_NAME,
      ORG_PAN: item.ORG_PAN,
      TDS80GSLNO: item.TDS80GSLNO,
      TDSEMPSLNO: item.TDSEMPSLNO,
      UNIQUENO: item.UNIQUENO,
      VerifiedAmount: new FormControl({ value: item.VerifiedAmount, disabled: true }),
      VerifiedRemarks: new FormControl({ value: item.VerifiedRemarks, disabled: true }),
      VerifiedUserSlNo: this.profile.EmployeeSlno,
    })

    return formGroup;
  }

  onChange = (value: any) => { };
  onTouched = () => { };
  onValidationChange: any = () => { };

  writeValue(value: any): void {
    
    if (value) {
      this.section8GForm.patchValue({
        SectionName: value.SectionName,
        Chapter6DetailId: value.Chapter6DetailId,
        SubHeadId: value.SubHeadId,
        Amount: value.Amount,
        VerifiedAmount: value.VerifiedAmount,
        VerifiedRemarks: value.VerifiedRemarks,
        VerifiedUserSlNo: value.VerifiedUserSlNo,
        FileCount: value.FileCount,
        EmployeeSlNo: value.EmployeeSlNo,
        EmpSlno: value.EmpSlno,
        FinSlno: value.FinSlno,
        Particulars: value.Particulars,
        UniqueNo: value.UniqueNo,
      });
      this.changeDetector.detectChanges();
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
      this.canUpload = false;//this.profile.AllowProofUpload;
      this.isVerify = this.profile.AllowVerfication;
    }
  }
  numberOnly(event: any): boolean {
    return commonMethods.isNumberKey(event);
  }
  uploadOtherIncomeFiles(section80GDetails: any) {
    const modalRef = this.modalService.open(UploadSection80GProofComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.section80GDetails = section80GDetails.value;
    modalRef.result.then(() => {

    },
      (reason) => {
        let closeResult = `Dismissed ${this.getDismissReason(reason)}`;

      });
  }
  viewAttachments(caserow: any) {
    this.investmentProofsService.getHouseIncomeFiles(caserow.value.TDS80GSLNO).subscribe((data: any[]) => {
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
