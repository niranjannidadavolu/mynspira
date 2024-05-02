import { Component, Input, OnInit, OnDestroy } from '@angular/core';
import { ControlValueAccessor, FormArray, FormBuilder, FormControl, FormGroup, NG_VALUE_ACCESSOR, Validators } from '@angular/forms';
import { commonMethods } from 'src/app/core/common/common.static';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { InvestmentService } from 'src/app/core/services';

import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { UploadChapter6ProofsComponent } from './upload-chapter6-proofs/upload-chapter6-proofs.component';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import { SwiperSliderComponent } from 'src/app/shared/app-components/swiper-slider/swiper-slider.component';

@Component({
  selector: 'app-chapte6-proof',
  templateUrl: './chapte6-proof.component.html',
  styleUrls: ['./chapte6-proof.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      multi: true,
      useExisting: Chapte6ProofComponent
    }
  ]
})
export class Chapte6ProofComponent implements OnInit, ControlValueAccessor, OnDestroy {

  value: any;
  chapter6Form: FormGroup;
  @Input() isVerify: boolean = false;

  constructor(
    private readonly formBuilder: FormBuilder,
    private readonly investmentProofsService: InvestmentProofsService,
    private readonly modalService: NgbModal
  ) {
    this.chapter6Form = new FormGroup({
      EmployeeChapter6Details: new FormArray([])
    });
  }

  ngOnInit(): void {

  }

  get f() { return this.chapter6Form.controls; }
  get Chapter6(): FormArray {
    return this.chapter6Form.controls['EmployeeChapter6Details'] as FormArray;
  }

  setChapter6FormArray(items: any) {
    let item = this.chapter6Form.controls['EmployeeChapter6Details'] as FormArray;
    item.controls.length = 0;
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
      Amount: [item.Amount, [Validators.required]],
      VerifiedAmount: item.VerifiedAmount,
      VerifiedRemarks: item.VerifiedRemarks,
      VerifiedUserSlNo: item.VerifiedUserSlNo,
      FileCount: item.FileCount,
    });
    return formGroup;
  }



  fileDetails(empIndex: number): FormArray {
    return this.Chapter6
      .at(empIndex)
      .get('FileDetails') as FormArray;
  }

  numberOnly(event: any): boolean {
    return commonMethods.isNumberKey(event);
  }


  onFileChange(event: any, index: number) {

    let chapter6Details = this.chapter6Form.controls['EmployeeChapter6Details'] as FormArray;
    const reader = new FileReader();
    if (event.target.files && event.target.files.length > 0) {

      let uploadedFiles = chapter6Details.controls[index].get("FileToUpload")?.value || [];
      event.target.files.forEach((file: any) => {
        let fileUpload = new FileUpload();
        reader.readAsDataURL(file);
        reader.onload = () => {
          if (reader != null && reader.result != null) {
            fileUpload.fileName = file.name;;
            fileUpload.fileSize = file.size;
            fileUpload.fileType = file.type;
            fileUpload.lastModifiedTime = file.lastModified;
            fileUpload.lastModifiedDate = file.lastModifiedDate;
            fileUpload.fileAsBase64 = reader.result.toString();
            uploadedFiles.push(fileUpload);
          }
        }
      });

      chapter6Details.controls[index].patchValue({
        "FileToUpload": uploadedFiles,
      });
    }
  }


  uploadChapter6Files(chapter6Details: any) {
    const modalRef = this.modalService.open(UploadChapter6ProofsComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.chapter6Details = chapter6Details.value;
    modalRef.result.then(() => {

    },
      (reason) => {
        let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
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
  ngOnDestroy(): void {
    this.modalService.dismissAll();
  }
}

