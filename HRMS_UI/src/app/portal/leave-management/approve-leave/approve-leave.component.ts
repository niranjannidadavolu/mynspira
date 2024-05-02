import { DatePipe, formatDate } from '@angular/common';
import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormControl, Validators } from '@angular/forms';
import { ModalDismissReasons, NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { finalize } from 'rxjs/operators';
import { approveLeaveBtnShow, LEAVE_STATUS_ID } from 'src/app/core/constants/leave-status.constant';
import { LeaveType } from 'src/app/core/enum/application-enums';
import { StorageService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { LeaveTypeService, LeaveDayTypeService } from 'src/app/core/services/masters';
import Swal from 'sweetalert2';
import { saveAs as importedSaveAs } from 'file-saver';
import { SwiperSliderComponent } from 'src/app/shared/app-components/swiper-slider/swiper-slider.component';
@Component({
  selector: 'app-approve-leave',
  templateUrl: './approve-leave.component.html',
  styleUrls: ['./approve-leave.component.scss']
})
export class ApproveLeaveComponent implements OnInit , OnDestroy{
  @Input() public selectedRowData: any;
  @Input() public selectedLeave: any;
  @Input() public visibleButton: any;
  @Input() public isManager: any;

  isApproveSubmitted: any;
  isRejectSubmitted: any;
  leaveForm: any;
  employeeProfile: any;
  minDate: { year: any; month: any; day: number; };
  maxDate: { year: any; month: any; day: number; };
  leaveAction = approveLeaveBtnShow;
  leaveType: any;
  leaveTypes: any = LeaveType;
  leaveFiles: any[] = [];
  get f() { return this.leaveForm.controls; }
  toDisableDate: any = '';

  constructor(
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    private datePipe: DatePipe,
    private readonly leaveTypeService: LeaveTypeService,
    private readonly leaveDayTypeService: LeaveDayTypeService,
    private readonly leaveService: LeaveManagementService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal) {
    let today = new Date();

    this.minDate = {
      year: today.getFullYear(),
      month: today.getMonth(),
      day: 26
    };
    this.maxDate = {
      year: today.getFullYear(),
      month: today.getMonth(),
      day: 26
    };
    this.leaveForm = this.formBuilder.group({
      EmployeeId: new FormControl(),
      EmployeeName: new FormControl(),
      EmployeeSlno: new FormControl(),
      LeaveFrom: new FormControl(),
      FromDateDayTypeId: new FormControl(),
      LeaveTo: new FormControl(),
      ToDateDayTypeId: new FormControl(),
      LeaveType: new FormControl(),
      Remarks: new FormControl(),
      LeaveBalance: new FormControl(),
      LeaveTypeName: new FormControl(),
      ManagerId: new FormControl(),
      ApprovedRemarks: new FormControl(),
      TotalDaysTaken: new FormControl(),
      LeaveStatusId: new FormControl(),
      LeaveId: new FormControl(),
      LeaveStatusStyle: new FormControl(''),
      PhotoPath: new FormControl(''),
      LeaveTypeId: new FormControl(),
      LeaveWorkFlowStepId: new FormControl(),
      StepMasterId: new FormControl(),
      StepTypeId: new FormControl(),
      WorkFlowTypeId: new FormControl(),
      CompOffDate: new FormControl(''),
      EarlyLogoutTimeDisplay: new FormControl(''),
      EarlyLogoutTime: new FormControl(''),
      LeaveReason: new FormControl(''),
      BranchName: new FormControl(''),
      OfficeTypeName: new FormControl('Test')
    });

    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
  }

  ngOnInit(): void {
    
    this.getLeaveTypesByLeaveId();
    if (this.visibleButton === this.leaveAction.reject) {
      this.leaveForm.controls['ApprovedRemarks'].setValidators([Validators.required])
      this.leaveForm.controls['ApprovedRemarks'].updateValueAndValidity();
    }
    else {
      this.leaveForm.controls['ApprovedRemarks'].clearValidators();
      this.leaveForm.controls['ApprovedRemarks'].updateValueAndValidity();
    }
    if(this.selectedRowData.hasOwnProperty('data')){
      this.selectedRowData.LeaveFrom = this.datePipe.transform(this.selectedRowData.LeaveFrom, 'dd-MMM-yyyy');
      this.selectedRowData.LeaveTo = this.datePipe.transform(this.selectedRowData.LeaveTo, 'dd-MMM-yyyy');
    }
    this.leaveForm.patchValue(this.selectedRowData);
    this.leaveForm.patchValue({
      LeaveStatusId: LEAVE_STATUS_ID.Approved,
      ManagerId: this.employeeProfile.EmployeeSlno
    })
    this.toDisableDate = formatDate(this.selectedRowData.CompOffDate, 'dd-MMM-yyyy', 'en');
  }
 
  approve() {
    this.approveLeave()
  }
  reject() {
    this.rejectLeave();
  }

  getSickLeaveFiles() {
      this.leaveService.getLeaveFiles(this.selectedRowData.LeaveId).subscribe((data: any) => {
        this.leaveFiles = data;
      })
  }

  downloadFile(file: any) {
    let filePath = file.FilePath;
    this.leaveService.downloadFile(filePath)
      .pipe().subscribe((data: any) => {
        importedSaveAs(data, file.OriginalFileName);
      });
  }
 
  getLeaveTypesByLeaveId() {
    this.leaveService.getLeaveTypesByLeaveId(this.selectedRowData.LeaveId).subscribe((data: any) => {
      this.leaveType = data;
      if(this.leaveType.IsDocumentRequired) {
        this.getSickLeaveFiles();
      }
    });
  }

  approveLeave() {
    this.isApproveSubmitted = true;
    this.selectedRowData.LeaveStatusId = LEAVE_STATUS_ID.Approved;
    this.leaveForm.get('LeaveStatusId').patchValue(LEAVE_STATUS_ID.Approved);
    this.selectedRowData.ManagerId = this.employeeProfile.EmployeeSlno;
    this.selectedRowData.ApprovedRemarks = 'Approved.';
    let leaveData = this.leaveForm.value;
    leaveData.LeaveWorkFlows = [];
    leaveData.BranchName = 'TEST';
    leaveData.OfficeTypeName = 'Test';
    this.leaveService.approveLeave(leaveData).pipe(finalize(() => this.isApproveSubmitted = false))
      .subscribe((item: any) => {
        if (item) {
          this.leaveService.sendUpdate(true);
          this.activeModal.dismiss('Saved Successfully');
          Swal.fire({
            title: 'Selected leave has been Approved.',
            text: 'Leave has been Approved.',
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
        else {
          this.leaveService.sendUpdate(false);

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
    this.leaveForm.get('LeaveStatusId').patchValue(LEAVE_STATUS_ID.Rejected);
    this.selectedRowData.ManagerId = this.employeeProfile.EmployeeSlno;
    this.selectedRowData.ManagerId = this.employeeProfile.EmployeeSlno;
    let leaveData = this.leaveForm.value;
    leaveData.BranchName = 'TEST';
    leaveData.OfficeTypeName = 'Test';
    this.leaveService.approveLeave(leaveData).pipe(finalize(() => this.isRejectSubmitted = false))
      .subscribe((item: any) => {
        if (item) {
          this.leaveService.sendUpdate(true);
          this.activeModal.dismiss('Saved Successfully');
          Swal.fire({
            title: 'Selected leave has been Rejected.',
            text: 'Leave has been Rejected.',
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
        else {
          this.leaveService.sendUpdate(false);

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

  previewDocument(){
    
    let helpItem = JSON.parse(JSON.stringify(this.leaveFiles));
    // helpItem.map(((s: any)=> s.FilePath =  'http:'+s.FilePath))
    const modalRef = this.modalService.open(SwiperSliderComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    let data = {
      accept: false,
      title: this.selectedRowData.LeaveTypeName + ' Documents',
      attachments: helpItem
    }
    modalRef.componentInstance.attchmentmentDetails = data;
    modalRef.result.then(() => {
     
    },
    (reason) => {
      let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }
  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
}
ngOnDestroy(): void {
  //Called once, before the instance is destroyed.
  //Add 'implements OnDestroy' to the class.
  this.activeModal.dismiss();
}
}
