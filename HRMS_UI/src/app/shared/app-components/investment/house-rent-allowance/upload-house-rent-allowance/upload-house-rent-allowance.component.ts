import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import { saveAs as importedSaveAs } from 'file-saver';
import { finalize } from 'rxjs/operators';
import Swal from 'sweetalert2';
import { HouseRentAllowanceFile } from 'src/app/core/models/investment-proofs/house-rent-allowance-file.model';
import { StorageService } from 'src/app/core/services';

@Component({
  selector: 'app-upload-house-rent-allowance',
  templateUrl: './upload-house-rent-allowance.component.html',
  styleUrls: ['./upload-house-rent-allowance.component.scss']
})
export class UploadHouseRentAllowanceComponent implements OnInit, OnDestroy {
  @Input() public hraDetails: any;
  uploadForm: FormGroup;
  isSubmitted: boolean;
  processing: boolean;
  hraFiles: any[];
  rentPaymentId: number;
  fileUpload: FileUpload;
  profile: any;
  canUpload: any;

  constructor(
    private formBuilder: FormBuilder,
    public activeModal: NgbActiveModal,
    private readonly storageService: StorageService,
    private readonly investmentProofsService: InvestmentProofsService) {
      
    this.profile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    if (this.profile) {
      this.canUpload = this.profile.AllowProofUpload;
    }
    this.uploadForm = this.formBuilder.group({
      file: ['', [Validators.required]]

    });
    this.isSubmitted = false;
    this.hraFiles = [];
    this.processing = false;
    this.rentPaymentId = 0;
    this.fileUpload = new FileUpload();
    this.downloadFile = this.downloadFile.bind(this);
  }

  ngOnInit(): void {
    this.rentPaymentId = (this.hraDetails.RentPaymentId || 0);
    this.getHouseRentAllowancFiles(this.rentPaymentId);
  }

  get f() { return this.uploadForm.controls; }

  onFileChange(event: any) {
    const reader = new FileReader();
    if (event.value.length && event.value.length > 0) {
      reader.readAsDataURL(event.value[0]);
      reader.onload = () => {
        if (reader != null && reader.result != null) {
          this.fileUpload.fileName = event.value[0].name;;
          this.fileUpload.fileSize = event.value[0].size;
          this.fileUpload.fileType = event.value[0].type;
          this.fileUpload.lastModifiedTime = event.value[0].lastModified;
          this.fileUpload.lastModifiedDate = event.value[0].lastModifiedDate;
          this.fileUpload.fileAsBase64 = reader.result.toString();
        }
      }
    }
  }

  onSubmit() {
    this.isSubmitted = true;
    let houseRentAllowanceFile = new HouseRentAllowanceFile();
    houseRentAllowanceFile.FileToUpload = this.fileUpload;
    houseRentAllowanceFile.TdsHRASLNo = this.rentPaymentId;
    houseRentAllowanceFile.FileName_Original = (this.fileUpload.fileName || '');
    this.investmentProofsService.uploadHraFile(houseRentAllowanceFile)
      .pipe(finalize(() => this.isSubmitted = false))
      .subscribe((data: any) => {
        if (data) {
          this.fileUpload = new FileUpload();
          this.uploadForm.controls['file'].patchValue([]);
          Swal.fire({
            title: 'Well done !',
            text: 'Aww yeah,  House Rent Allowance (HRA) document is successfully saved.',
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          }).then((result) => {
            this.investmentProofsService.sendRefreshRquest(true);
            this.getHouseRentAllowancFiles(this.rentPaymentId);
          });
        }
        else {
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            text: 'House Rent Allowance (HRA) document is not Saved.',
            icon: 'warning',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          }).then(() => {
            this.isSubmitted = false;
          });
        }
      });
  }
  downloadFile(e: any) {
    let filePath = e.row.data.FilePath
    if (filePath) {
      this.investmentProofsService.downloadFile(filePath)
        .pipe()
        .subscribe((data: any) => {
          importedSaveAs(data, e.row.data.FileName_Original);
        });
    }
  }

  deleteHraFile(event: any) {
    let rowData = event.data;
    let fileId = rowData.TdsHRAFileSLNo;
    this.investmentProofsService.removeHouseRentAllowanceFile(fileId).subscribe((data: any) => {
      if (data) {
        Swal.fire({
          title: 'Well done !',
          text: `Aww yeah, ${rowData.FileName_Original} file is successfully deleted.`,
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then((result) => {
          this.investmentProofsService.sendRefreshRquest(true);
          this.getHouseRentAllowancFiles(this.rentPaymentId);
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: `${rowData.FileName_Original} file is not deleted.`,
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    });
  }

  getHouseRentAllowancFiles = (rentPaymentId: number) => {
    this.processing = false;
    this.investmentProofsService.getHouseRentAllowancFiles(rentPaymentId).subscribe((data: any[]) => {
      if (data) {
        this.hraFiles = data;
      }
      else {
        this.hraFiles = [];;
      }
      this.processing = true;
    });
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
