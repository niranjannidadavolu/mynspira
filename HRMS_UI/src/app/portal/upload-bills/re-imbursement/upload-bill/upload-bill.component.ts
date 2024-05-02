import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';

import { UserInformation } from 'src/app/core/models';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { UploadReimbursement } from 'src/app/core/models/re-imbursement/upload-re-imbursement.model';
import { ReimbursementService, StorageService } from 'src/app/core/services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-upload-bill',
  templateUrl: './upload-bill.component.html',
  styleUrls: ['./upload-bill.component.scss']
})
export class UploadBillComponent implements OnInit , OnDestroy{
  uploadForm: FormGroup;
  submitted = false;
  userInformation?: UserInformation;
  profile: any;
  imageSrc: any;
  cultureImage: any;
  fileAsBase64: string;
  minDate: any;
  maxDate: any;
  constructor(private readonly modalService: NgbModal,
    private formBuilder: FormBuilder,
    private readonly reImbursementService: ReimbursementService,
    private readonly storageService: StorageService,
    public activeModal: NgbActiveModal) {
    this.fileAsBase64 = '';
    this.uploadForm = this.formBuilder.group({
      billNumber:['', [Validators.required]],
      billDate:['', [Validators.required]],
      amount: ['', [Validators.required]],
      file: ['', [Validators.required]]
    });
    this.minDate = new Date(new Date().getFullYear()-1, 10, 1);
    this.maxDate = new Date(new Date().getFullYear(), 12, 31);
 
  }

  ngOnInit(): void {
    this.userInformation = JSON.parse(this.storageService.get('LoggedInUser', 1));
    this.profile = JSON.parse(this.storageService.get('EmployeeProfile', 1));
  }
  get f() { return this.uploadForm.controls; }

  // onFileChange(event: any) {
  //   if (event.target.files.length > 0) {
  //     const file = event.target.files[0];
  //     this.uploadForm.patchValue({
  //       fileSource: file
  //     });
  //     this.submitted = true;
  //   }
  // }

  onSubmit() {
    
    if (this.uploadForm.invalid) {
      return;
    } else {

      let uploadReimbursementDetails = new UploadReimbursement();
      uploadReimbursementDetails.BillDate=this.f['billDate'].value;
      uploadReimbursementDetails.BillNumber=this.f['billNumber'].value;
      uploadReimbursementDetails.Amount = parseInt(this.f['amount'].value);
      uploadReimbursementDetails.EmpSLNo = this.profile.EmpSLNo || 0;
      uploadReimbursementDetails.UniqueNo = this.profile.UniqueNo || 0;
      uploadReimbursementDetails.PBranchSLNo = this.profile.PBranchSLNo || 0;
      uploadReimbursementDetails.HeadSLNo = this.profile.HeadSLNo || 10;
      uploadReimbursementDetails.UserSLNo = 1;

      let file = new FileUpload();
      file.fileName = this.cultureImage.name;
      file.fileSize = this.cultureImage.size;
      file.fileType = this.cultureImage.type;
      file.lastModifiedTime = this.cultureImage.lastModified;
      file.lastModifiedDate = this.cultureImage.lastModifiedDate;
      file.fileAsBase64 = this.fileAsBase64;
      uploadReimbursementDetails.File = file;
      this.reImbursementService.uploadReimbursementDetails(uploadReimbursementDetails).subscribe((data: any) => {
        if(data){
          this.activeModal.dismiss('Saved Successfully');
          Swal.fire({
            title: 'Well done !',
            text: 'Aww yeah, Re-Imbursement bill was successfully saved.',
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          }).then((result) => {
            this.uploadForm.reset();
          });
        }
        else{
          
            Swal.fire({
              title: 'Oops...! Something went Wrong !',
              text: 'Re-Imbursement bill was not saved.',
              icon: 'warning',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          
        }
      })
  }
}
  onFileChange(event: any) {
    const reader = new FileReader();
    if (event.target.files && event.target.files.length > 0) {
      const file = event.target.files[0];
      reader.readAsDataURL(file);
      reader.onload = () => {
        if (reader != null && reader.result != null) {
          this.imageSrc = '' + reader.result;
          this.cultureImage = file;
          this.fileAsBase64 = reader.result.toString();
        }
      }
    }
  }
  openModal(content: any) {
    this.modalService.open(content);
  }

  // numberOnly(event: any): boolean {
  //   return commonMethods.isNumberKey(event);
  // }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}

