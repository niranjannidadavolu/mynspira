import { Component, OnInit } from "@angular/core";
import {
  FormArray,
  FormBuilder,
  FormControl,
  FormGroup,
  Validators,
} from "@angular/forms";
import { NgbActiveModal } from "@ng-bootstrap/ng-bootstrap";
import { AsyncSubject } from "rxjs";
import { finalize } from "rxjs/operators";
import { FileUpload } from "src/app/core/models/file-upload/file-upload.model";
import { Form16Service, StorageService } from "src/app/core/services";
import Swal from "sweetalert2";

@Component({
  selector: "app-upload-itr-file",
  templateUrl: "./upload-itr-file.component.html",
  styleUrls: ["./upload-itr-file.component.scss"],
})
export class UploadItrFileComponent implements OnInit {
  uploadForm: FormGroup;
  isSubmitted: boolean = false;
  imageSrc: any;
  fileData!: FileUpload;
  cultureImage: any;
  fileAsBase64!: string;
  uploadedImage!: string | ArrayBuffer | null;
  yearList: any = [];
  employeeProfile: any;
  fileUploads: any = [];

  constructor(
    private readonly storageService: StorageService,
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    private readonly form16Service: Form16Service
  ) {
    this.employeeProfile = JSON.parse(
      this.storageService.get("EmployeeProfile", 1)
    );
    this.uploadForm = this.formBuilder.group({
      Year: [new Date().getFullYear(), [Validators.required]],
      ItrNumber: ["", [Validators.required]],
      EmployeeSlno: [this.employeeProfile.EmployeeSlno],
      Remarks: ["", Validators.required],
      FileToUpload: [],
      FilePath: [],
      FileName: [""],
      FileName_Original: [null,Validators.required],
    });
    this.yearList = [new Date().getFullYear() - 1, new Date().getFullYear()];
  }
  get f() {
    return this.uploadForm.controls;
  }

  ngOnInit(): void {}

  onFileChange(event: any) {
    const reader = new FileReader();
    let fileData = event.target.files;
    let type = event.target.files[0].name.split("?")[0].split(".").pop();
    let isAcceptFilType: boolean = false;
    if (type == "pdf" ) {
      isAcceptFilType = true;
    } else {
      isAcceptFilType = false;
      Swal.fire({
        title: "Oops...! Something went Wrong !",
        text: "Please upload pdf format files only",
        icon: "warning",
        confirmButtonColor: "rgb(54, 69, 116)",
        confirmButtonText: "Ok",
      }).then(() => {});
      return;
    }
    if (fileData.length && fileData.length > 0 && isAcceptFilType) {
      reader.readAsDataURL(fileData[0]);
      reader.onload = () => {
        if (reader != null && reader.result != null) {
          let fileUpload: any = {
            fileName: fileData[0].name,
            fileSize: fileData[0].size,
            fileType: fileData[0].type,
            lastModifiedTime: fileData[0].lastModified,
            lastModifiedDate: fileData[0].lastModifiedDate,
            fileAsBase64: reader.result.toString(),
            fileConvertSize: fileData[0].size,
          };
          this.uploadForm.controls["FileToUpload"].patchValue(fileUpload);
          this.uploadForm.controls["FileName"].patchValue(fileData[0].name);
          this.uploadForm.controls["FileName_Original"].patchValue(
            fileData[0].name
          );
        }

        // this.fileUpload = fileUpload;
      };
    }
  }
  removeFile() {
    this.uploadForm.controls["FileToUpload"].patchValue(null);
    this.uploadForm.controls["FileName"].patchValue(null);
    this.uploadForm.controls["FileName_Original"].patchValue(null);
  }
  onSubmit() {
    ////
    this.isSubmitted = true;
    if(this.uploadForm.invalid){
    this.isSubmitted = false;
      return
    }
    let formData = this.uploadForm.getRawValue();

    this.form16Service
      .updateItrUploads(formData)
      .pipe(finalize(() => (this.isSubmitted = false)))
      .subscribe((data: any) => {
        if (data) {
          Swal.fire({
            title: "Well done !",
            text: "Aww yeah, ITR file upload is successfully saved.",
            icon: "success",
            confirmButtonColor: "rgb(54, 69, 116)",
            confirmButtonText: "Ok",
          }).then(() => {
            this.activeModal.dismiss("Saved Successfully");
            // this.getCarLeaseAgreementBills();
          });
        } else {
          Swal.fire({
            title: "Oops...! Something went Wrong !",
            text: "ITR file upload is not Saved.",
            icon: "warning",
            confirmButtonColor: "rgb(54, 69, 116)",
            confirmButtonText: "Ok",
          }).then(() => {
            this.isSubmitted = false;
          });
          // this.agreementBills = data;
        }
      }
      ,
    err => {
      Swal.fire({
        title: "Oops...! Something went Wrong !",
        text: "ITR file upload is not Saved.",
        icon: "warning",
        confirmButtonColor: "rgb(54, 69, 116)",
        confirmButtonText: "Ok",
      }).then(() => {
        this.isSubmitted = false;
      });
    });
  }
}
