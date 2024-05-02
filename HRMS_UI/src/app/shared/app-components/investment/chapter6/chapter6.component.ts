import { Component, Input, OnInit } from '@angular/core';
import { ControlValueAccessor, FormArray, FormBuilder, FormControl, FormGroup, NG_VALUE_ACCESSOR } from '@angular/forms';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { commonMethods } from 'src/app/core/common/common.static';
import { UploadChapter6ProofsComponent } from './upload-chapter6-proofs/upload-chapter6-proofs.component';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import { SwiperSliderComponent } from '../../swiper-slider/swiper-slider.component';
import { StorageService } from 'src/app/core/services';

@Component({
  selector: 'app-chapter6',
  templateUrl: './chapter6.component.html',
  styleUrls: ['./chapter6.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      multi: true,
      useExisting: Chapter6Component
    }
  ]
})
export class Chapter6Component implements OnInit, ControlValueAccessor {

  isVerify: any;
  canUpload: any;
  value: any;
  chapter6Form: FormGroup;
  profile: any;
  constructor(
    private readonly formBuilder: FormBuilder,
    private readonly investmentProofsService: InvestmentProofsService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal) {
    this.chapter6Form = new FormGroup({
      EmployeeChapter6Details: new FormArray([])
    });
    this.profile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.getMyProfile();
  }
  getMyProfile() {
    // 
    if (this.profile) {
      this.canUpload = false;// this.profile.AllowProofUpload;
      this.isVerify = this.profile.AllowVerfication;
    }
  }
  ngOnInit(): void {

  }

  get Chapter6(): FormArray {
    return this.chapter6Form.controls['EmployeeChapter6Details'] as FormArray;
  }
  setChapter6FormArray(items: any) {
    
    items.forEach((item: any) => {
      this.Chapter6.push(this.buildChapter6Form(item))
    });
  }

  onChange = (value: any) => { };
  onTouched = () => { };
  writeValue(value: any): void {

    if (value) {
      this.setChapter6FormArray(value);
      this.Chapter6.valueChanges.subscribe((data: any) => { this.onChange(this.Chapter6.value) });
    }
  }
  registerOnChange(onChange: any): void {
    this.onChange = onChange;
  }

  registerOnTouched(onTouched: any): void {
    this.onTouched = onTouched;
  }

  buildChapter6Form(item: any): FormGroup {

    let formGroup = this.formBuilder.group({
      SectionName: item.SectionName,
      Chapter6DetailId: item.Chapter6DetailId,
      SubHeadId: item.SubHeadId,
      Particulars: item.Particulars,
      Amount: item.Amount,
      VerifiedAmount: new FormControl({ value: item.VerifiedAmount, disabled: true }),
      VerifiedRemarks: new FormControl({ value: item.VerifiedRemarks, disabled: true }),
    });
    return formGroup;
  }

  numberOnly(event: any): boolean {
    return commonMethods.isNumberKey(event);
  }
  uploadChapter6Files(chapter6Details: any) {
    const modalRef = this.modalService.open(UploadChapter6ProofsComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.chapter6Details = chapter6Details.value;
    modalRef.result.then(() => {

    },
      (reason) => {
        //let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
      });
  }
  viewAttachments(caserow: any) {
    this.investmentProofsService.getChapt6Files(caserow.value.Chapter6DetailId).subscribe((data: any[]) => {
      if (data) {
        const modalRef = this.modalService.open(SwiperSliderComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
        let obj = {
          title: 'Chapter VI',
          attachments: data
        };
        modalRef.componentInstance.attchmentmentDetails = obj;
        modalRef.result.then(() => {
        },
          (reason) => {
            //let closeResult = `Dismissed ${this.getDismissReason(reason)}`;

          });
      }
    });
  }
}
