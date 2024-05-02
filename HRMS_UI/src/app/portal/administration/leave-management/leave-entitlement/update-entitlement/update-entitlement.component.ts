import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { StorageService } from 'src/app/core/services';
import { LeaveEntitlementService } from 'src/app/core/services/administration/leave-entitlement.service';
import { LeaveInformationService } from 'src/app/core/services/administration/leave-information.service';
import { BranchesService } from 'src/app/core/services/masters';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-update-entitlement',
  templateUrl: './update-entitlement.component.html',
  styleUrls: ['./update-entitlement.component.scss']
})
export class UpdateEntitlementComponent implements OnInit, OnDestroy {
  @Input() public entitlementData: any;
  entitlementForm: FormGroup;
  leaveInformationList: any = [];
  toMinDate: any;
  minDate: any;
  maxDate: any;
  isSubmitted: boolean = false;
  branchLIst: any = [];
  leaveTypeList: any = [];
  officeTypeList: any = [];
  employeeProfile: any;
  constructor(
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    private readonly branchesService: BranchesService,
    private readonly leaveInformationService: LeaveInformationService,
    private readonly leaveEntitlementService: LeaveEntitlementService,
    private readonly storageService: StorageService

  ) {
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.entitlementForm = this.formBuilder.group({
      EmployeeLeaveEntitlementId: [''],
      EmployeeSlno: [''],
      EmployeeName: [''],
      LeaveInformationId: [''],
      LeaveInformationName: [''],
      YearOfLeave: ['', [Validators.required]],
      DateValidFrom: ['', [Validators.required]],
      DateValidUntil: ['', [Validators.required]],
      TotalLeaves: [0, [Validators.required]],
      ConsumedLeaves: [0, [Validators.required]],
      RowVersion: [''],
      OriTotalLeaves: [0],
      LeavePostedDate: [new Date],
      NextLeavePostingDate: [new Date],
      StatusId: [1],
      OfficeTypeSlno: [null],
      PBranchSlno: [null],
      LeaveTypeId: [''],
      UpdatedBy: [''],
      CreatedBy: ['']
    });
  }
  get f() { return this.entitlementForm.controls; }

  ngOnInit(): void {
    if (this.entitlementData.isUpdateForm) {
      this.entitlementForm.patchValue(this.entitlementData.data);
      this.entitlementForm.patchValue({
        DateValidFrom: new Date(this.entitlementData.data.DateValidFrom),
        DateValidUntil: new Date(this.entitlementData.data.DateValidUntil),
        UpdatedBy: this.employeeProfile.EmployeeSlno,
      });
    } else {
      const d = new Date();
      let year = d.getFullYear();
      this.entitlementForm.patchValue({
        OfficeTypeSlno: this.entitlementData.data.OfficeTypeSlno,
        PBranchSlno: this.entitlementData.data.PBranchSlno,
        LeaveInformationId: this.entitlementData.data.LeaveInformationId,
        YearOfLeave: year,
        EmployeeSlno: this.employeeProfile.EmployeeSlno,
        CreatedBy: this.employeeProfile.EmployeeSlno
      });

      this.entitlementForm.controls['OfficeTypeSlno'].setValidators([Validators.required])
      this.entitlementForm.controls['OfficeTypeSlno'].updateValueAndValidity();
      this.entitlementForm.controls['PBranchSlno'].setValidators([Validators.required])
      this.entitlementForm.controls['PBranchSlno'].updateValueAndValidity();
      this.entitlementForm.controls['LeaveInformationId'].setValidators([Validators.required])
      this.entitlementForm.controls['LeaveInformationId'].updateValueAndValidity();
      this.getOfficeTypes();
      this.onChangeOfficeType(this.entitlementData.data);
      this.onChangeLeaveType(this.entitlementData.data);
    }
  }
  changeFromDate(event: any) {
    let todate = new Date(event.selectedDates[0]);
    if (event.selectedDates !== undefined && event.selectedDates.length > 0) {
      let selectedFromDate = event.selectedDates[0];
      this.entitlementForm.controls['DateValidUntil'].patchValue('');
      this.toMinDate = selectedFromDate;
    }
  }
  getOfficeTypes() {
    this.branchesService.GetOfficeType().subscribe((data: any) => {
      this.officeTypeList = data;
    });
  }
  onChangeOfficeType(event: any) {
    if (event.OfficeTypeSlno) {
      let obj = {
        officeTypeSlno:event.OfficeTypeSlno,
        employeeSlno: this.entitlementForm.value.employeeSlno
      }
      this.branchesService.GetBranchesByOfcType(obj).subscribe((data: any) => {
        this.branchLIst = data;
      });
      this.leaveInformationService.getLeaveTypeInformation(event.OfficeTypeSlno).subscribe((data: any) => {
        this.leaveTypeList = data;
      });
    }

  }
  onChangeLeaveType(event: any) {
    this.entitlementForm.controls['LeaveTypeId'].patchValue(event.LeaveTypeId);
  }
  onSubmit() {
    if (this.entitlementForm.invalid) {
      return;
    }

    if (this.entitlementData.isUpdateForm) {
      this.leaveEntitlementService.UpdateLeaveEntitlement(this.entitlementForm.getRawValue()).subscribe((result: any) => {
        if (result) {
          this.savedResponse();
        }
        else {
          this.errorResponse();
        }
      });
    } else {
      this.leaveEntitlementService.SaveLeaveEntitlement(this.entitlementForm.getRawValue()).subscribe((result: any) => {
        if (result) {
          this.savedResponse();
        }
        else {
          this.errorResponse();
        }
      });
    }

  }
  savedResponse() {
    Swal.fire({
      title: 'Well done !',
      text: `Aww yeah, Leave entitlement details are successfully ${this.entitlementData.isUpdateForm ? 'updated' : 'saved'}.`,
      icon: 'success',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    }).then(() => {
      this.activeModal.close(this.entitlementForm.value);
    });
  }
  errorResponse() {
    Swal.fire({
      title: 'Oops...! Something went Wrong !',
      text: 'Leave entitlement details are not Saved.',
      icon: 'warning',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    }).then(() => { });
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
