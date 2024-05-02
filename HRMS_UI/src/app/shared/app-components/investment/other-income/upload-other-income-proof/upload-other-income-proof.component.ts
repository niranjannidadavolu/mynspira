import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import { saveAs as importedSaveAs } from 'file-saver';
import Swal from 'sweetalert2';
import { OtherIncomeFile } from 'src/app/core/models/investment-proofs/other-income-file.model';
import { finalize } from 'rxjs/operators';
import { StorageService } from 'src/app/core/services';

@Component({
  selector: 'app-upload-other-income-proof',
  templateUrl: './upload-other-income-proof.component.html',
  styleUrls: ['./upload-other-income-proof.component.scss']
})
export class UploadOtherIncomeProofComponent implements OnInit, OnDestroy {

  @Input() public otherIncomeDetails: any;
  uploadForm: FormGroup;
  isSubmitted: boolean;
  otherIncomeFiles: any[];
  processing: boolean;
  otherIncomeDetailId: number;
  fileUpload: FileUpload;
  profile: any;
  canUpload: any;
  constructor(
    private readonly storageService: StorageService,
    private readonly investmentProofsService: InvestmentProofsService,
    private formBuilder: FormBuilder,
    public activeModal: NgbActiveModal) {
    this.profile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    if (this.profile) {
      this.canUpload = this.profile.AllowProofUpload;
    }
    this.uploadForm = this.formBuilder.group({
      file: ['', [Validators.required]]

    });
    this.isSubmitted = false;
    this.otherIncomeFiles = [];
    this.processing = false;
    this.otherIncomeDetailId = 0;
    this.fileUpload = new FileUpload();
    this.downloadFile = this.downloadFile.bind(this);
  }

  ngOnInit(): void {
    this.otherIncomeDetailId = (this.otherIncomeDetails.OtherIncomeDetailId || 0)
    this.getOtherIncomeFiles(this.otherIncomeDetailId);
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
    let otherIncomeDetails = new OtherIncomeFile();
    otherIncomeDetails.FileToUpload = this.fileUpload;
    otherIncomeDetails.TdsEmpOISLNo = this.otherIncomeDetailId;
    otherIncomeDetails.FileName_Original = (this.fileUpload.fileName || '');
    this.investmentProofsService.uploadOtherIncomeFile(otherIncomeDetails)
      .pipe(finalize(() => this.isSubmitted = false))
      .subscribe((data: any) => {
        if (data) {
          this.fileUpload = new FileUpload();
          this.uploadForm.controls['file'].patchValue([]);
          Swal.fire({
            title: 'Well done !',
            text: `Aww yeah, ${this.otherIncomeDetails.Description} document is successfully saved.`,
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          }).then(() => {
            this.investmentProofsService.sendRefreshRquest(true);
            this.getOtherIncomeFiles(this.otherIncomeDetailId);
          });
        }
        else {
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            text: `${this.otherIncomeDetails.Description} document is not Saved.`,
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

  deleteFile(event: any) {
    let rowData = event.data;
    let fileId = rowData.TdsEmpOIFileSLNo;
    this.investmentProofsService.removeOtherIncomeFile(fileId).subscribe((data: any) => {
      if (data) {
        Swal.fire({
          title: 'Well done !',
          text: `Aww yeah, ${rowData.FileName_Original} file is successfully deleted.`,
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then((result) => {
          this.investmentProofsService.sendRefreshRquest(true);
          this.getOtherIncomeFiles(this.otherIncomeDetailId);
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: 'File is not deleted.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    });

  }

  getOtherIncomeFiles = (otherIncomeDetailId: number) => {
    this.processing = false;
    this.investmentProofsService.getOtherIncomeFiles(otherIncomeDetailId).subscribe((data: any[]) => {
      if (data) {
        this.otherIncomeFiles = data;
      }
      else {
        this.otherIncomeFiles = [];;
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
