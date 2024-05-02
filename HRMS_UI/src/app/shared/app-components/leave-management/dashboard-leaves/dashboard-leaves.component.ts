import { filter } from 'rxjs/operators';
import { FormControl, FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ApplyOnDutyComponent } from './../../../../portal/leave-management/apply-on-duty/apply-on-duty.component';
import { Component, HostBinding, Input, OnChanges, OnInit, Pipe, PipeTransform, SimpleChanges, ViewChild, OnDestroy, Output, EventEmitter } from '@angular/core';
import { Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { DxDataGridComponent } from 'devextreme-angular';
import { Subscription } from 'rxjs';
import { approveLeaveBtnShow, LEAVE_STATUS_ID } from 'src/app/core/constants/leave-status.constant';
import { LeaveType, RouteUrl } from 'src/app/core/enum/application-enums';
import { LeaveDetail } from 'src/app/core/models/leave-management/emp-leave-detail.model';
import { StorageService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { BranchesService, LeaveTypeService } from 'src/app/core/services/masters';
import { ApplyLeaveComponent } from 'src/app/portal/leave-management/apply-leave/apply-leave.component';
import { ApproveLeaveComponent } from 'src/app/portal/leave-management/approve-leave/approve-leave.component';
import { EmployeeLeaveHistoryComponent } from 'src/app/portal/leave-management/employee-leave-history/employee-leave-history.component';
import Swal from 'sweetalert2';
import { HttpParams } from '@angular/common/http';
import { formatDate } from '@angular/common';
import { ApplyEmployeeLeaveByHrOpsComponent } from 'src/app/portal/leave-management/apply-employee-leave-by-hr-ops/apply-employee-leave-by-hr-ops.component';
import { Switch } from '@syncfusion/ej2-angular-buttons';
import { ApplySessionBreakLeaveComponent } from 'src/app/portal/leave-management/leave-components/apply-session-break-leave/apply-session-break-leave.component';

@Component({
  selector: 'app-dashboard-leaves',
  templateUrl: './dashboard-leaves.component.html',
  styleUrls: ['./dashboard-leaves.component.scss']
})
export class DashboardLeavesComponent implements OnInit, OnChanges, OnDestroy {
  @ViewChild('myLeavesDataGrid', { static: false }) myLeaveDataGrid: DxDataGridComponent | undefined;
  @ViewChild('approvalDataGrid', { static: false }) approvalDataGrid: DxDataGridComponent | undefined;
  @Input() isMinheight: boolean = false;

  @Input() statusId: number = 0;
  @Input() refreshData: boolean = false;
  @Input() holidays: any = [];
  @Input() canApplyLeave: boolean = false;
  employeeProfile: any;
  gridData: any;
  subscriptionName: Subscription;
  pendingLeaves: any;
  myLeaves: any;
  leaveAction = approveLeaveBtnShow;
  isApprovalLeaveHide: boolean = false;
  ShowMaternity: any;
  ShowPaternity: any;
  ShowVaction: any;
  leaveTypeIds = LeaveType;
  // leaveTypes: any;
  specialLeaveTypes: any = [];
  showButton: boolean;
  teamLeaves: any;
  toMinDate: any;
  minDate: any;
  teamLeaveForm: FormGroup;
  isHROPS: any;
  //ShowPaternity: any;
  @Output() canApplyCompOff = new EventEmitter();
  @Output() canApplyEarlyLogOut = new EventEmitter();
  canHrApplyLeave: boolean;
  loggedInUser: any;

  constructor(
    private readonly leaveService: LeaveManagementService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal,
    private readonly leaveTypeService: LeaveTypeService,
    private fb: FormBuilder,
    private router: Router,
    private branchService: BranchesService) {
    this.ShowMaternity = true;
    this.ShowPaternity = true;
    this.ShowVaction = true;

    this.employeeProfile = this.storageService.getParsedData("EmployeeProfile", 1);
    this.loggedInUser = this.storageService.getParsedData("LoggedInUser", 1);

    this.cancelLeave = this.cancelLeave.bind(this);
    // for hide approval leave in my-teams route.
    this.isApprovalLeaveHide = this.router.url == RouteUrl.MYLEAVES ? true : false;
    this.subscriptionName = new Subscription();
    this.showButton = false;
    this.canHrApplyLeave = this.loggedInUser.CanApplyLeave;

    this.teamLeaveForm = this.fb.group({
      EmployeeSlno: [this.employeeProfile.EmployeeSlno],
      LeaveFrom: [new Date(), Validators.required],
      LeaveTo: [new Date(), Validators.required]
    });
    this.getHrBranches();
  }
  ngOnChanges(changes: SimpleChanges): void {
    if (this.refreshData) {
      this.getMyLeaves();
      this.getPendingLeaves();
      this.getLeaveTypes();
    }
  }
  ngOnInit(): void {
    this.subscriptionName = this.leaveService.getUpdate().subscribe
      ((isApplyLeave: boolean) => { //message contains the data sent from service
        if (isApplyLeave) {
          this.getMyLeaves();
          this.getLeaveTypes();
          if (!this.isApprovalLeaveHide) {
            this.getPendingLeaves();
          }
        }
      });

    this.getMyLeaves();
    this.getLeaveTypes();
    if (!this.isApprovalLeaveHide) {
      this.getPendingLeaves();
    }
  }
  cancelLeave(event: any) {
    this.cancelLeaveRequest(event.data);
  }
  getHrBranches() {

    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.branchService.getHrBranches(employeeSlno).subscribe((res) => {
      if (res && res.length > 0) {
        this.isHROPS = true;
      }
      else {
        this.isHROPS = false;
      }
      // this.branches = res;
      // this.selectAllForDropdownItems(this.branches);
    })
  }
  getMyLeaves() {
    this.leaveService.getMyLeaves(this.employeeProfile.EmployeeSlno, this.statusId, this.isApprovalLeaveHide == true ? false : true).subscribe(data => {

      this.myLeaves = data;
      if (this.myLeaveDataGrid) {
        this.myLeaveDataGrid.instance.refresh();
      }
    });
  }
  getPendingLeaves() {

    let searchCriteria = {
      EmployeeSlno: this.employeeProfile.EmployeeSlno,
      FromDate: new Date(this.employeeProfile.PayrollMonthFrom),
      ToDate: new Date(this.employeeProfile.PayrollMonthTo),
    };
    this.leaveService.getPendingLeaves(searchCriteria).subscribe((data: any) => {
      this.pendingLeaves = data;
      if (this.approvalDataGrid) {
        this.approvalDataGrid.instance.refresh();
      }
    });
  }
  getLeaveTypes() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.leaveTypeService.getAssignedLeaveTypes(employeeSlno).subscribe((data: any) => {
      this.specialLeaveTypes = data;
      this.specialLeaveTypes = this.specialLeaveTypes.filter((item: any) => !item.ShowInDashboard && item.LeaveTypeId !== LeaveType.COMPENSATORY_OFF_LEAVE && item.LeaveTypeId !== LeaveType.EARLY_LOGOUT_TIME);
      let canApplyCompOff = data.some((item: any) => item.LeaveTypeId == LeaveType.COMPENSATORY_OFF_LEAVE);
      let canApplyEarlyLogOut = data.some((item: any) => item.LeaveTypeId == LeaveType.EARLY_LOGOUT_TIME);
      this.canApplyCompOff.emit(canApplyCompOff);
      this.canApplyEarlyLogOut.emit(canApplyEarlyLogOut);

    });
  }
  applyLeave() {
    const modalRef = this.modalService.open(ApplyLeaveComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.result.then(() => {
      this.getMyLeaves();
      if (!this.isApprovalLeaveHide) {
        this.getPendingLeaves();
      }
    });
  }

  applyLeaveByHrOps() {
    const modalRef = this.modalService.open(ApplyEmployeeLeaveByHrOpsComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.result.then(() => {
      this.getMyLeaves();
      if (!this.isApprovalLeaveHide) {
        this.getPendingLeaves();
      }
    });
  }
  applySpecialLeaves(leaveType: any) {
    debugger;
    let modalRef: any;
    let lt = leaveType.LeaveTypeId as LeaveType;

    switch (leaveType.LeaveTypeId) {
      case LeaveType.SICK_LEAVE:
      case LeaveType.PATERNITY_LEAVE:
      case LeaveType.MATERNITY_LEAVE:
      case LeaveType.MARRIAGE_LEAVE:
      case LeaveType.SPECIAL_CASUAL_LEAVE:
      case LeaveType.BEREAVEMENT_LEAVE:
        modalRef = this.modalService.open(ApplyLeaveComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
        modalRef.componentInstance.leaveType = leaveType;
        modalRef.componentInstance.holidays = this.holidays;
        modalRef.result.then((result: any) => {
          this.getMyLeaves();
          if (!this.isApprovalLeaveHide) {
            this.getPendingLeaves();
          }
        });
        break;
      case LeaveType.SUMMER_VACATION:
        modalRef = this.modalService.open(ApplyOnDutyComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
        modalRef.componentInstance.leaveType = leaveType;
        modalRef.componentInstance.holidays = this.holidays;
        modalRef.result.then((result: any) => {
          this.getMyLeaves();
          if (!this.isApprovalLeaveHide) {
            this.getPendingLeaves();
          }
        });
        break;
      case LeaveType.WINTER_VACATION:
        modalRef = this.modalService.open(ApplyOnDutyComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
        modalRef.componentInstance.leaveType = leaveType;
        modalRef.componentInstance.holidays = this.holidays;
        modalRef.result.then((result: any) => {
          this.getMyLeaves();
          if (!this.isApprovalLeaveHide) {
            this.getPendingLeaves();
          }
        });
        break;
      case LeaveType.SPECIAL_SICK_LEAVE:
        break;
      case LeaveType.ON_DUTY:
        modalRef = this.modalService.open(ApplyOnDutyComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
        modalRef.componentInstance.leaveType = leaveType;
        modalRef.componentInstance.holidays = this.holidays;
        modalRef.result.then((result: any) => {
          this.getMyLeaves();
          if (!this.isApprovalLeaveHide) {
            this.getPendingLeaves();
          }
        });
        break;
      case LeaveType.SESSION_BREAK:
        modalRef = this.modalService.open(ApplySessionBreakLeaveComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
        modalRef.componentInstance.leaveType = leaveType;
        modalRef.componentInstance.holidays = this.holidays;
        modalRef.result.then((result: any) => {
          this.getMyLeaves();
          if (!this.isApprovalLeaveHide) {
            this.getPendingLeaves();
          }
        });
        break;
      case LeaveType.LEAVE:
        modalRef = this.modalService.open(ApplyLeaveComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
        modalRef.componentInstance.leaveType = leaveType;
        modalRef.componentInstance.holidays = this.holidays;
        modalRef.result.then((result: any) => {
          this.getMyLeaves();
          if (!this.isApprovalLeaveHide) {
            this.getPendingLeaves();
          }
        });
        break;
    }




    let component;
    if (leaveType.LeaveTypeId == this.leaveTypeIds.SUMMER_VACATION || leaveType.LeaveTypeId == this.leaveTypeIds.WINTER_VACATION) {
      component = ApplyOnDutyComponent;
    } else {
      component = ApplyLeaveComponent;
    }

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
  getTeamLeaves() {

    if (this.teamLeaveForm.invalid) {
      return;
    }
    this.leaveService.getTeamLeaves(this.teamLeaveForm.value).subscribe((data: any) => {
      this.teamLeaves = data;
    });
  }
  viewLeaveDetails(leaveData: any, visibleButton: string, isManager?: boolean) {
    debugger;
    let leave = leaveData;
    const modalRef = this.modalService.open(ApproveLeaveComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = leaveData.data;
    modalRef.componentInstance.isManager = isManager;
    modalRef.componentInstance.visibleButton = visibleButton.toString()
    modalRef.result.then(() => {
      this.refreshData = true;
    });
  }
  isCancelVisible(e: any) {

    let leaveStatusId = e.row.data.LeaveStatusId;
    return (e.row.data.EnableDelete) && leaveStatusId != LEAVE_STATUS_ID.Canceled && leaveStatusId != LEAVE_STATUS_ID.Rejected;
  }
  viewEmpHistoryDetails(event: any) {
    const modalRef = this.modalService.open(EmployeeLeaveHistoryComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = event.row.data;
    modalRef.result.then(() => {
    });
  }
  cancelLeaveRequest(data: any) {
    Swal.fire({
      title: 'Are you sure to cancel leaves?',
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      if (result.isConfirmed) {
        this.leaveService.cancelEmpLeave(data.LeaveId, this.employeeProfile.EmployeeSlno).subscribe(res => {
          if (res) {
            this.leaveService.sendUpdate(true);
            Swal.fire({
              title: 'Well done !',
              text: 'Aww yeah, your leaves are successfully cancelled.',
              icon: 'success',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
          else {
            Swal.fire({
              title: 'Oops...! Something went Wrong !',
              text: 'Your leaves are not cancelled.',
              icon: 'warning',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
        })
      }
    })
  }
  ngOnDestroy() { // It's a good practice to unsubscribe to ensure no memory leaks
    this.subscriptionName.unsubscribe();
    this.modalService.dismissAll();
  }
}
@Pipe({ name: 'gridCellData' })
export class GridCellDataPipe implements PipeTransform {
  transform(gridData: any) {
    return gridData.data['LeaveStatusStyle'];
  }
}
