import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { commonMethods } from 'src/app/core/common/common.static';
import { UserInformation } from 'src/app/core/models/administration/user-information.model';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { UploadReimbursement } from 'src/app/core/models/re-imbursement/upload-re-imbursement.model';
import { StorageService } from 'src/app/core/services/helper/storage-service';
import { ReimbursementService } from 'src/app/core/services/re-imbursement/re-imbursement.service';

@Component({
  selector: 'app-pending-bills-upload',
  templateUrl: './pending-bills-upload.component.html',
  styleUrls: ['./pending-bills-upload.component.scss']
})
export class PendingBillsUploadComponent implements OnInit , OnDestroy{
  uploadForm: FormGroup;
  submitted = false;
  userInformation?: UserInformation;
  profile: any;
  constructor(private readonly modalService: NgbModal,
    private formBuilder: FormBuilder,
    private readonly reImbursementService: ReimbursementService,
    private readonly storageService: StorageService,
    public activeModal: NgbActiveModal) {

    this.uploadForm = this.formBuilder.group({
      amount: ['', [Validators.required]],
      file: ['', [Validators.required]],
      fileSource: ['', [Validators.required]]
    });
  }

  ngOnInit(): void {
    this.userInformation = JSON.parse(this.storageService.get('LoggedInUser', 1));
    this.profile = JSON.parse(this.storageService.get('EmployeeProfile', 1));
  }
  get f() { return this.uploadForm.controls; }

  onFileChange(event: any) {
    if (event.target.files.length > 0) {
      const file = event.target.files[0];
      this.uploadForm.patchValue({
        fileSource: file
      });
      this.submitted = true;
    }
  }

  onSubmit() {
    if (this.uploadForm.invalid) {
      return;
    } else {

      
      let fileSource = this.uploadForm.get('fileSource')?.value;
      let uploadReimbursementDetails = new UploadReimbursement();
      uploadReimbursementDetails.Amount = parseInt(this.f['amount'].value);
      uploadReimbursementDetails.EmpSLNo = this.profile.EmpSLNo || 0;
      uploadReimbursementDetails.UniqueNo = this.profile.UniqueNo || 0;
      uploadReimbursementDetails.PBranchSLNo = this.profile.PBranchSLNo || 0;
      uploadReimbursementDetails.HeadSLNo = this.profile.HeadSLNo || 10;
      uploadReimbursementDetails.UserSLNo = 1;

      let file = new FileUpload();
      file.fileName = fileSource.name;
      file.fileSize = fileSource?.size;
      file.fileType = fileSource?.type;
      file.lastModifiedTime = fileSource?.lastModified;
      file.lastModifiedDate = fileSource?.lastModifiedDate;

      const reader = new FileReader();
      reader.readAsDataURL(fileSource);
      reader.onload = () => {
        file.fileAsBase64 = reader?.result?.toString();;
        uploadReimbursementDetails.File = file;
        this.reImbursementService.uploadReimbursementDetails(uploadReimbursementDetails).subscribe(data => {
          this.activeModal.dismiss('Saved Successfully');
          this.uploadForm.reset();
        })
      };
    }
  }

  openModal(content: any) {
    this.modalService.open(content);
  }

  numberOnly(event: any): boolean {
    return commonMethods.isNumberKey(event);
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
