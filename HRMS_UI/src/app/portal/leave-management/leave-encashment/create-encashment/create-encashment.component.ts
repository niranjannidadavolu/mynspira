import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { finalize } from 'rxjs/operators';
import { commonMethods } from 'src/app/core/common/common.static';
import { LEAVE_STATUS_ID, approveLeaveBtnShow } from 'src/app/core/constants/leave-status.constant';
import { LeaveType } from 'src/app/core/enum/application-enums';
import { StorageService } from 'src/app/core/services';
import { LeaveEncashmentService } from 'src/app/core/services/leave-encashment';
import { LeaveTypeService } from 'src/app/core/services/masters';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-create-encashment',
  templateUrl: './create-encashment.component.html',
  styleUrls: ['./create-encashment.component.scss']
})
export class CreateEncashmentComponent implements OnInit, OnDestroy {
  leaveForm!: FormGroup;
  isSubmitted: boolean= false;
  LeaveBalance:any;
  @Input() public selectedRowData: any = null;
  @Input() public type: any = null;
  employeeProfile: any;
  empLeaveBalance:any;
  leaveTypes:any;
  leaveAction = approveLeaveBtnShow;
  plLeaveData: any;
  isApproveSubmitted: boolean = false;
  isRejectSubmitted: boolean = false;
  constructor(
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    private readonly storageService: StorageService,
    private readonly leaveEncashmentService: LeaveEncashmentService,
    private readonly leaveTypeService: LeaveTypeService,

  ) {  

    this.employeeProfile = JSON.parse(this.storageService.get('EmployeeProfile', 1));  
    // //console.log(this.employeeProfile);
    
}

  ngOnInit(): void {
    this.createForm();
    this.getLeaveTypes();  
    if(this.selectedRowData) {
      this.leaveForm.patchValue(this.selectedRowData);
      this.leaveForm.patchValue({
        EncashmentAmount: this.selectedRowData.EncashmentAmount.toFixed(2),
        TaxbleAmount: this.selectedRowData.TaxbleAmount.toFixed(2),
        TotalAmount: this.selectedRowData.TotalAmount.toFixed(2),
      });
    } 
  }
  createForm(){
    this.leaveForm = this.formBuilder.group({
      EncashmentId: [''],
      EmployeeSlno: [this.employeeProfile.EmployeeSlno],
      TotalDaysTaken: ['', [Validators.required]],
      EncashmentAmount: [''],
      TaxbleAmount: [''],
      TotalAmount: [''],
      Remarks: ['', [Validators.required]],
      StatusId: [1],
      LeaveBalance: [''],
      BranchSlno: [this.employeeProfile.PBranchSLNo],
      EmpSlno: [this.employeeProfile.EmpSLNo],
      UniqueNo: [this.employeeProfile.UniqueNo],
      FinSlno: [this.employeeProfile.FinSLNo],
      ApprovedRemarks: [''],
      EntitlementId: [''],
    });
    if(this.type == this.leaveAction.reject){
      this.leaveForm.controls['ApprovedRemarks'].setValidators(Validators.required);
      this.leaveForm.controls['ApprovedRemarks'].updateValueAndValidity();
    }
  }
  // get formControls(){
  //   return this.leaveForm.controls;
  // }
   get f() { return this.leaveForm.controls; }
   numberOnly(event: any): boolean {
    return commonMethods.isNumberKey(event);
  }
  getLeaveTypes() {
      let employeeSlno = this.employeeProfile.EmployeeSlno;
      this.leaveTypeService.getAssignedLeaveTypes(employeeSlno).subscribe((data: any) => {
        this.leaveTypes = data;
        this.plLeaveData = data.find((s: any) => s.LeaveTypeId == LeaveType.PRIVILEGE_LEAVE);
        if(this.plLeaveData && this.type == this.leaveAction.add){
          this.leaveForm.controls['LeaveBalance'].patchValue(this.plLeaveData.LeaveBalance);
          this.leaveForm.controls['EntitlementId'].patchValue(this.plLeaveData.EntitlementId);
        }
     });
  }
  onEncashChange(event: any){
    // ((Basic+DA)/30)*no of days
    let EncashmentAmount = (this.employeeProfile.DaySalary) * parseInt(event.value);
    this.leaveForm.controls['EncashmentAmount'].patchValue(EncashmentAmount.toFixed(2));
    this.getTaxableAmount(EncashmentAmount);
    // let totalAmount = this.leaveForm.value.EncashmentAmount - this.leaveForm.value.TaxbleAmount;
    // this.leaveForm.controls['TotalAmount'].patchValue(totalAmount);
  }
  getTaxableAmount(EncashmentAmount: any) {
    let obj = {
      BranchSlno: this.leaveForm.value.BranchSlno,
      EmpSlno: this.leaveForm.value.EmpSlno,
      UniqueNo: this.leaveForm.value.UniqueNo,
      FinSlno: this.leaveForm.value.FinSLNo,
      EncashmentAmount: EncashmentAmount,
    }
    
    this.leaveEncashmentService.getTdsAmount(obj).subscribe((res: any) => {
       let totalAmount = parseFloat(EncashmentAmount)-parseFloat(res);
     this.leaveForm.controls['TaxbleAmount'].patchValue(res.toFixed(2));
     this.leaveForm.controls['TotalAmount'].patchValue(totalAmount.toFixed(2));
    })
  }
  applyLeaveRequest() {
    this.isSubmitted = true;
    if (this.leaveForm.invalid) {
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        html: 'There were some errors in the Apply Form.  Please correct the same.',
        footer: 'Please correct the erross.'
      });
    }else{
      this.leaveEncashmentService.applyLeaveEncashment(this.leaveForm.value).pipe(finalize(() => this.isSubmitted = false))
      .subscribe((item: any) => {
        if (item) {
          if (item) {
            this.applyLeaveSuccessMsg();
          }
          else {
            Swal.fire({
              title: 'Oops...! Something went Wrong !',
              html: '<p class="text-danger" >' + item.Message + '</p>',
              icon: 'error',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
        }
        else {
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            html: 'Your encashment request is not applied.',
            icon: 'error',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
      });
    }
  }
  applyLeaveSuccessMsg() {
    this.activeModal.close(true);
    Swal.fire({
      title: 'Well done !',
      html: 'Aww yeah, your encashment request is successfully applied.',
      icon: 'success',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    });
    return;
  }

  approve() {
    this.approveLeave()
  }
  reject() {
    this.rejectLeave();
  }
  approveLeave() {
    this.isApproveSubmitted = true;
    this.selectedRowData.LeaveStatusId = LEAVE_STATUS_ID.Approved;
    // this.leaveForm.controls['LeaveStatusId'].patchValue(LEAVE_STATUS_ID.Approved);
    let leaveData = {
      EmployeeSlno: this.leaveForm.value.EmployeeSlno,
      EncashmentId: this.leaveForm.value.EncashmentId,
      StepMasterId: this.selectedRowData.StepMasterId,
      StepId: this.selectedRowData.StepId,
      StepTypeId: this.selectedRowData.StepTypeId,
      WorkFlowTypeId: this.selectedRowData.WorkFlowTypeId,
      ApprovedRemarks: this.leaveForm.value.ApprovedRemarks,
      LeaveStatusId: LEAVE_STATUS_ID.Approved,
    };
    this.leaveEncashmentService.updateLeaveEncashment(leaveData).pipe(finalize(() => this.isApproveSubmitted = false))
      .subscribe((item: any) => {
        if (item) {
          this.activeModal.close(true);
          Swal.fire({
            title: 'Selected leave has been Approved.',
            text: 'Leave has been Approved.',
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
        else {
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            text: 'Leave not Approved.',
            icon: 'error',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
      });
  };

  rejectLeave() {
    this.isRejectSubmitted = true;
    this.selectedRowData.LeaveStatusId = LEAVE_STATUS_ID.Rejected;
    // this.leaveForm.controls['LeaveStatusId'].patchValue(LEAVE_STATUS_ID.Rejected);
    let leaveData = {
      EmployeeSlno: this.leaveForm.value.EmployeeSlno,
      EncashmentId: this.leaveForm.value.EncashmentId,
      StepMasterId: this.selectedRowData.StepMasterId,
      StepId: this.selectedRowData.StepId,
      StepTypeId: this.selectedRowData.StepTypeId,
      WorkFlowTypeId: this.selectedRowData.WorkFlowTypeId,
      ApprovedRemarks: this.leaveForm.value.ApprovedRemarks,
      LeaveStatusId: LEAVE_STATUS_ID.Rejected,
    };
    this.leaveEncashmentService.updateLeaveEncashment(leaveData).pipe(finalize(() => this.isRejectSubmitted = false))
      .subscribe((item: any) => {
        if (item) {
          this.activeModal.close(true);
          Swal.fire({
            title: 'Selected leave has been Rejected.',
            text: 'Leave has been Rejected.',
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
        else {
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            text: 'Leave not Rejected.',
            icon: 'error',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
      });
  };
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
