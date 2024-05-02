import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { saveAs as importedSaveAs } from 'file-saver';
import { HousePropertyIncomeFile } from 'src/app/core/models/investment-proofs/house-property-income-file.model';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import Swal from 'sweetalert2';
import { finalize } from 'rxjs/operators';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';

@Component({
  selector: 'app-upload-house-property-income',
  templateUrl: './upload-house-property-income.component.html',
  styleUrls: ['./upload-house-property-income.component.scss']
})
export class UploadHousePropertyIncomeComponent implements OnInit, OnDestroy {

  @Input() public houseProperyIncomeDetails: any;
  uploadForm: FormGroup;
  isSubmitted: boolean;
  processing: boolean;
  housePropertyIncomeFiles: any[];
  houseIncomeDetailId: number;
  fileUpload: FileUpload;

  constructor(
    private readonly investmentProofsService: InvestmentProofsService,
    private formBuilder: FormBuilder,
    public activeModal: NgbActiveModal) {
    this.uploadForm = this.formBuilder.group({
      file: ['', [Validators.required]]

    });
    this.isSubmitted = false;
    this.housePropertyIncomeFiles = [];
    this.processing = false;
    this.houseIncomeDetailId = 0;
    this.fileUpload = new FileUpload();
    this.downloadFile = this.downloadFile.bind(this);
  }

  ngOnInit(): void {
    this.houseIncomeDetailId = (this.houseProperyIncomeDetails.HouseIncomeDetailId || 0);
    this.getHouseIncomeFiles(this.houseIncomeDetailId);
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
    let housePropertyDetails = new HousePropertyIncomeFile();
    housePropertyDetails.FileToUpload = this.fileUpload;
    housePropertyDetails.TdsEmpHISLNo = this.houseIncomeDetailId;
    housePropertyDetails.FileName_Original = (this.fileUpload.fileName || '');
    this.investmentProofsService.uploadHouseIncomeFile(housePropertyDetails)
      .pipe(finalize(() => this.isSubmitted = false))
      .subscribe((data: any) => {
        if (data) {
          this.fileUpload = new FileUpload();
          this.uploadForm.controls['file'].patchValue([]);
          Swal.fire({
            title: 'Well done !',
            text: `Aww yeah, ${this.houseProperyIncomeDetails.Description} Document is successfully saved.`,
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          }).then(() => {
            this.investmentProofsService.sendRefreshRquest(true);
            this.getHouseIncomeFiles(this.houseIncomeDetailId);
          });
        }
        else {
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            text: `${this.houseProperyIncomeDetails.Description} Document is not Saved.`,
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
    let fileId = rowData.TdsEmpHIFileSLNo;
    this.investmentProofsService.removeHouseIncomeFile(fileId).subscribe((data: any) => {
      if (data) {
        Swal.fire({
          title: 'Well done !',
          text: `Aww yeah, ${rowData.FileName_Original} file is successfully deleted.`,
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then((result) => {
          this.investmentProofsService.sendRefreshRquest(true);
          this.getHouseIncomeFiles(this.houseIncomeDetailId);
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
  getHouseIncomeFiles = (houseIncomeDetailId: number) => {
    this.processing = false;
    this.investmentProofsService.getHouseIncomeFiles(houseIncomeDetailId).subscribe((data: any[]) => {
      if (data) {
        this.housePropertyIncomeFiles = data;
      }
      else {
        this.housePropertyIncomeFiles = [];;
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
