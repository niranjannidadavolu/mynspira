import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { UserInformation } from 'src/app/core/models';
import { StorageService } from 'src/app/core/services';
import { CarLeaseService } from 'src/app/core/services/carlease';
import Swal from 'sweetalert2';
import { finalize } from 'rxjs/operators';
import { saveAs as importedSaveAs } from 'file-saver';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';

@Component({
  selector: 'app-upload-agreement-bills',
  templateUrl: './upload-agreement-bills.component.html',
  styleUrls: ['./upload-agreement-bills.component.scss']
})
export class UploadAgreementBillsComponent implements OnInit , OnDestroy{
  @Input() selectedRowData: any;
  uploadForm: FormGroup;
  submitted = false;
  userInformation?: UserInformation;
  carLeaseBillNames: any[];
  processing: boolean;
  selectedFiles: any = [];
  fileData: any;
  uploadedImage: string | ArrayBuffer | null | undefined;
  employeeProfile: any;
  isSubmitted: boolean;
  cultureImage: any;
  fileAsBase64: string;
  imageSrc: string;
  minDate: any;
  maxDate: any;
  constructor(private readonly modalService: NgbModal,
    private formBuilder: FormBuilder,
    private readonly carLeaseService: CarLeaseService,
    private readonly storageService: StorageService,
    public activeModal: NgbActiveModal) {
    this.carLeaseBillNames = [];
    this.processing = false;
    this.uploadForm = this.formBuilder.group({

      MonthName: ['', [Validators.required]],
      Salary_Voucher: ['', [Validators.required]],
      ToBePaid: [''],
      Paid: [''],
      Balance: [''],
      BillNo: ['', [Validators.required]],
      BillDate: ['', [Validators.required]],
      BillCopy: [''],
      ApprovalStatus: [''],
      file: [''], //FileData
      carLeaseSLno: '',
      EmployeeSlno: [''],
      FileImage: [''],
      BillCopyName: [],
      EmpCarLeasedDTSLNo: [],
      FileData: [],
      FilePath: [],
      IsApproved: [],
      MonthSlNo: [],
      Remarks: [],
    });
    this.fileAsBase64 = '';
    this.imageSrc = '';
    this.isSubmitted = false;
    this.minDate = new Date(new Date().getFullYear()-1, 10, 1);
    this.maxDate = new Date(new Date().getFullYear(), 12, 31);

  }

  ngOnInit(): void {
    this.selectedRowData.BillNo = '';
    this.uploadForm.patchValue(this.selectedRowData);
    this.uploadForm.controls['BillDate'].patchValue(this.selectedRowData.BillDate);
    this.userInformation = JSON.parse(this.storageService.get('LoggedInUser', 1));
    this.employeeProfile = JSON.parse(this.storageService.get('EmployeeProfile', 1));
    this.uploadForm.controls['EmployeeSlno'].patchValue(this.employeeProfile.EmployeeSlno);
  }


  get f() { return this.uploadForm.controls; }

  onFileChange(event: any) {
    const reader: FileReader = new FileReader();
    if (event.target.files && event.target.files.length > 0) {
      const file = event.target.files[0];
      this.fileData = new FileUpload();
      this.fileData.fileName = file.name;
      this.fileData.fileSize = file.size;
      this.fileData.fileType = file.type;
      this.fileData.lastModifiedTime = file.lastModified;
      this.fileData.lastModifiedDate = file.lastModifiedDate;
      this.fileData.fileAsBase64 = '';
      reader.readAsDataURL(file);
      reader.onload = (args) => {
        if (reader != null && reader.result != null) {
          this.imageSrc = '' + reader.result;
          this.cultureImage = file;
          this.fileAsBase64 = reader.result.toString();
        }
        if (args.target !== undefined && args.target !== null) {
          this.uploadedImage = args.target.result;
          this.uploadForm.controls['FileImage'].patchValue(args.target.result);
        }
      }
    }

  }

  onOptionsSelected(event: any) {
    this.uploadForm.patchValue({
      carLeaseSLno: event.CarLeaseSLno
    })
  }
  onSubmit() {
    ////
    this.isSubmitted = true;
    let billData = this.uploadForm.getRawValue();
    billData.fileData = this.fileData;
    billData.FilePath = billData.file;
    billData.BillCopy = '';
    billData.BillCopyName = '';
    let agreementBills = [{ ...billData }];

    if (billData.FileData != null && billData.BillNo > 0) {
      Swal.fire({
        title: 'Oops...!',
        text: 'Please Upload Car Lease Agreement(s) Files.',
        icon: 'warning',
        confirmButtonColor: 'rgb(54, 69, 116)',
        confirmButtonText: 'Ok'
      }).then(() => {
        this.isSubmitted = false;
      });
      return;
    }
    this.carLeaseService.uploadAgreementBills(agreementBills)
      .pipe(finalize(() => this.isSubmitted = false))
      .subscribe((data: any) => {
        if (data) {
          Swal.fire({
            title: 'Well done !',
            text: 'Aww yeah, Car Lease Agreement(s) are successfully saved.',
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          }).then(() => {
            this.activeModal.close('Saved Successfully');
            // this.getCarLeaseAgreementBills();
          });
        }
        else {
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            text: 'Car Lease Agreement(s)  are not Saved.',
            icon: 'warning',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          }).then(() => {
            this.isSubmitted = false;
          });
          // this.agreementBills = data;
        }
      });
  }

  openModal(content: any) {
    this.modalService.open(content);
  }

  numberOnly(event: any, index: number): boolean {
    return false;
  }


  downloadFile() {
    this.carLeaseService.downloadFile(this.selectedRowData.BillCopy)
      .pipe(finalize(() => this.isSubmitted = false))
      .subscribe((data: any) => {
        importedSaveAs(data, this.selectedRowData.BillCopyName);
      });
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
