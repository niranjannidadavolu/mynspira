import { Component, OnDestroy, OnInit } from '@angular/core';
import {  FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { UserInformation } from 'src/app/core/models';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { StorageService } from 'src/app/core/services';
import { CarLeaseService } from 'src/app/core/services/carlease';
import Swal from 'sweetalert2';
import { finalize } from 'rxjs/operators';
import { UploadCarLease } from 'src/app/core/models/carlease/upload-carlease.model';

@Component({
  selector: 'app-upload-new-bill',
  templateUrl: './upload-new-bill.component.html',
  styleUrls: ['./upload-new-bill.component.scss']
})
export class UploadNewBillComponent implements OnInit , OnDestroy{
  uploadForm: FormGroup;
  submitted = false;
  userInformation?: UserInformation;
  carLeaseBillNames: any[];
  processing: boolean;
  selectedFiles: any = [];
  fileData: any;
  uploadedImage: string | ArrayBuffer | null | undefined;
  employeeProfile: any;
  isSubmitted:boolean;
  cultureImage: any;
  fileAsBase64: string;
  imageSrc: string;
  minDate: any;
  maxDate: any;

  constructor(private readonly modalService: NgbModal,
    private formBuilder: FormBuilder,
    private readonly carLeaseService: CarLeaseService,
    private readonly storageService: StorageService,
    public activeModal: NgbActiveModal)
    {
    this.carLeaseBillNames = [];
    this.processing = false;
    this.uploadForm = this.formBuilder.group({      
     
        billName: ['', [Validators.required]],
        amount: ['', [Validators.required]],
        billNumber: ['', [Validators.required]],
        billDate: ['', [Validators.required]],
        file: ['', [Validators.required]],
        carLeaseSLno:''
    }); 
    this.fileAsBase64='';
    this.imageSrc='';
    this.isSubmitted=false;
    this.minDate = new Date(new Date().getFullYear()-1, 10, 1);
    this.maxDate = new Date(new Date().getFullYear(), 12, 31);
  }

  ngOnInit(): void {
    this.userInformation = JSON.parse(this.storageService.get('LoggedInUser', 1));
    this.employeeProfile = JSON.parse(this.storageService.get('EmployeeProfile', 1));
    this.getCarLeaseBillNames();
  }

 
  get f() { return this.uploadForm.controls; }

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

  onOptionsSelected(event:any){
    this.uploadForm.patchValue({
      carLeaseSLno:event.CarLeaseSLno
     })
  }
  onSubmit() {
    ////
    this.isSubmitted = true;
    const formData = new FormData();
    let file = new FileUpload();
    file.fileName = this.cultureImage.name;
    file.fileSize = this.cultureImage.size;
    file.fileType = this.cultureImage.type;
    file.lastModifiedTime = this.cultureImage.lastModified;
    file.lastModifiedDate = this.cultureImage.lastModifiedDate;
    file.fileAsBase64 = this.fileAsBase64;
    let requestDetails = new UploadCarLease()
    requestDetails.Amount = this.f['amount'].value;
    requestDetails.BillNo = parseInt(this.f['billNumber'].value);
    requestDetails.BillDate = this.f['billDate'].value;
    requestDetails.File = file;
    requestDetails.CarLeaseSLno = this.f['carLeaseSLno'].value;
    if (this.userInformation != null && this.userInformation != undefined) {
      requestDetails.EmpSLNo = this.employeeProfile.EmpSLNo || 0;
      requestDetails.UniqueNo = this.employeeProfile?.UniqueNo || 0;
      requestDetails.PBranchSLNo = this.employeeProfile?.PBranchSLNo || 0;
      requestDetails.UserSLNo = this.employeeProfile?.UserSLNo || 0;
    }
    formData.append('CarLeaseBills', JSON.stringify(requestDetails));

    this.carLeaseService.UploadCarLeaseMaintenance(formData).subscribe(data => {
      if (data) {
        this.activeModal.dismiss('Saved Successfully');
        this.uploadForm.reset();
        this.uploadForm.controls['file'].patchValue([]);
        this.imageSrc = '';
        this.cultureImage = null;
        this.fileAsBase64 = '';
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Car Lease Maintenance Bill(s) are successfully saved.',
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then((result) => {
          this.isSubmitted = false;
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: 'Car Lease Maintenance Bill(s) are not Saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then((result) => {
          this.isSubmitted = false;
        });
      }
    });
  }

  openModal(content: any) {
    this.modalService.open(content);
  }

  numberOnly(event: any, index: number): boolean {
    return false;
  }

  getCarLeaseBillNames = () => {
    this.processing = false;
    this.carLeaseBillNames = [];
    this.carLeaseService.getCarLeaseBillNames()
      .pipe(finalize(() => this.processing = true))
      .subscribe((data: any) => {
        if (data) {
          this.carLeaseBillNames = data;
        }
      });
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
