import { Component, Input, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { FormArray, FormBuilder, FormControl, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { FlatpickrDirective } from 'angularx-flatpickr';
import { finalize } from 'rxjs/operators';
import { LeaveType } from 'src/app/core/enum/application-enums';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { LeavePolicyInformation } from 'src/app/core/models/leave-management/leave-policy-information';
import { EmployeeService, StorageService } from 'src/app/core/services';
import { LeavePolicyService } from 'src/app/core/services/administration/leave-policy.service';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { LeaveDayTypeService, LeaveTypeService } from 'src/app/core/services/masters';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-leave-popup',
  templateUrl: './leave-popup.component.html',
  styleUrls: ['./leave-popup.component.scss']
})
export class LeavePopupComponent implements OnInit, OnDestroy {
  @ViewChild(FlatpickrDirective, { static: false }) fromDate: FlatpickrDirective | undefined;
  @Input() selectedRowData: any;
  leaveForm: any;
  isSubmitted: any;
  
  get f() { return this.leaveForm.controls; }
  //fileUploads: FileUpload[];

  constructor(
    public activeModal: NgbActiveModal,
    private readonly leavePolicyService: LeavePolicyService,
    private formBuilder: FormBuilder,
  ) {
    //this.showDayType = false;

    this.leaveForm = this.formBuilder.group({
      PolicyID: [],
      PolicyName: ['', [Validators.required]],
      LowerBound: [0],
      UpperBound: [0],
      ApplyBeForeDays: [0],
      MaxConcecutiveDays: [0],
      AllowAfter_MaxConcecutive: [0],
      AccrualRate: [0],
      NeedCertificate: [0],
      ConsiderWeekendsHolidays: [false],
      CanBeMergedWithOther: [false],
      MaximumUsage: [0],
      ApplicableTo :[0],
      CanApplyHalfDay: [false],
      StatusID: [1],
    });
    this.isSubmitted = false;
    // this.fileUploads = [];
   // sessionStorage.removeItem("LeaveTypeId");
  }
  ngOnInit(): void {
    if (this.selectedRowData)
      this.leaveForm.patchValue(this.selectedRowData)
  }
  applyPolicyRequest() {
    if (this.selectedRowData) {
      this.leavePolicyService.updateLeavePolicyInformation(this.leaveForm.value).subscribe((result: any) => {
        if (result) {
          Swal.fire({
            title: 'Well done !',
            text: 'Aww yeah,  Leave Policy Information is successfully saved.',
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          }).then(() => {
            this.activeModal.close();
        
          });
        }
        else {
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            text: ' Leave Policy Information is not . saved.',
            icon: 'warning',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          }).then(() => { });

          this.activeModal.close();
        }
      });
    }
    else {
      this.leavePolicyService.saveLeavePolicyInformation(this.leaveForm.value).subscribe((result: any) => {
        if (result) {
          Swal.fire({
            title: 'Well done !',
            text: 'Aww yeah,  Leave Policy Information is successfully saved.',
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          }).then(() => {
            this.activeModal.close();
          
          });
        }
        else {
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            text: ' Leave Policy Information is not . saved.',
            icon: 'warning',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          }).then(() => { });
          this.activeModal.close();
        }
      });
    }
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}



