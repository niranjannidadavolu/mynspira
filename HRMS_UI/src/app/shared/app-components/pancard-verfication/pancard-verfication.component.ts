import { Component, Input, OnInit } from "@angular/core";
import {
  FormBuilder,
  FormControl,
  FormGroup,
  Validators,
} from "@angular/forms";
import { NgbActiveModal } from "@ng-bootstrap/ng-bootstrap";
import { finalize } from "rxjs/operators";
import { FileUpload } from "src/app/core/models/file-upload/file-upload.model";
import { EmployeeService, StorageService } from "src/app/core/services";
import Swal from "sweetalert2";

@Component({
  selector: "app-pancard-verfication",
  templateUrl: "./pancard-verfication.component.html",
  styleUrls: ["./pancard-verfication.component.scss"],
})
export class PancardVerficationComponent implements OnInit {
  @Input() selectedRowData: any;
  uploadForm!: FormGroup;

  submitted: boolean = false;
  employeeProfile: any;
  imageSrc: string;

  constructor(
    private fb: FormBuilder,
    private employeeService: EmployeeService,
    private readonly storageService: StorageService,
    public activeModal: NgbActiveModal
  ) {
    this.imageSrc = "";
  }

  ngOnInit(): void {
    this.employeeProfile = JSON.parse(
      this.storageService.get("EmployeeProfile", 1)
    );
    this.createForm();
  }
  createForm() {
    this.uploadForm = this.fb.group({
      EmployeeSlno: new FormControl(this.employeeProfile.EmployeeSlno),
      PanNumber: new FormControl("", [Validators.required]),
      FileToUpload: [""],
      FilePath: [""],
      FileName: [""],
      FileName_Original: [null, Validators.required],
    });
  }
  get f() {
    return this.uploadForm.controls;
  }

  onFileChange(event: any) {
    const reader: FileReader = new FileReader();
    let type = event.target.files[0].name.split("?")[0].split(".").pop();
    let isAcceptFilType: boolean = false;
    if (type == "jpg" || type == "png" || type == "jpeg") {
      isAcceptFilType = true;
    } else {
      isAcceptFilType = false;
      Swal.fire({
        title: "Oops...! Something went Wrong !",
        text: "Please upload image format files only",
        icon: "warning",
        confirmButtonColor: "rgb(54, 69, 116)",
        confirmButtonText: "Ok",
      }).then(() => {});
      return;
    }
    if (
      event.target.files &&
      event.target.files.length > 0 &&
      isAcceptFilType
    ) {
      let fileData = event.target.files;
      reader.readAsDataURL(fileData[0]);
      reader.onload = (args) => {
        if (reader != null && reader.result != null) {
          this.imageSrc = "" + reader.result;
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
      };
    }
  }

  onSubmit() {
    this.submitted = true;
    if (this.uploadForm.invalid) {
      this.submitted = false;
      return;
    }
    this.employeeService
      .updateEmployeePanDetails(this.uploadForm.value)
      .pipe(finalize(() => (this.submitted = false)))
      .subscribe(
        (data) => {
          this.activeModal.dismiss("Saved Successfully");
          if (data) {
            Swal.fire({
              title: "Well done !",
              text: "Aww yeah, Pancard file upload is successfully saved.",
              icon: "success",
              confirmButtonColor: "rgb(54, 69, 116)",
              confirmButtonText: "Ok",
            }).then(() => {
              this.activeModal.close("Saved Successfully");
              // this.getCarLeaseAgreementBills();
            });
          } else {
            Swal.fire({
              title: "Oops...! Something went Wrong !",
              text: "Pancard file upload is not Saved.",
              icon: "warning",
              confirmButtonColor: "rgb(54, 69, 116)",
              confirmButtonText: "Ok",
            }).then(() => {
              this.submitted = false;
            });
            // this.agreementBills = data;
          }
        },
        (err) => {
          Swal.fire({
            title: "Oops...! Something went Wrong !",
            text: "Pancard file upload is not Saved.",
            icon: "warning",
            confirmButtonColor: "rgb(54, 69, 116)",
            confirmButtonText: "Ok",
          }).then(() => {
            this.submitted = false;
          });
        }
      );
  }
}
