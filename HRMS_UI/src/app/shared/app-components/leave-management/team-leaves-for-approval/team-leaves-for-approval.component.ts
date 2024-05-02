import { formatDate } from '@angular/common';
import { Component, EventEmitter, Input, OnChanges, OnDestroy, OnInit, Output, Pipe, PipeTransform, SimpleChanges, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { DxDataGridComponent } from 'devextreme-angular';
import { Subscription } from 'rxjs';
import { LEAVE_STATUS_ID, approveLeaveBtnShow } from 'src/app/core/constants/leave-status.constant';
import { LeaveType, RouteUrl } from 'src/app/core/enum/application-enums';
import { StorageService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { LeaveTypeService } from 'src/app/core/services/masters';
import { ApproveLeaveComponent } from 'src/app/portal/leave-management/approve-leave/approve-leave.component';
import { EmployeeLeaveHistoryComponent } from 'src/app/portal/leave-management/employee-leave-history/employee-leave-history.component';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-team-leaves-for-approval',
  templateUrl: './team-leaves-for-approval.component.html',
  styleUrls: ['./team-leaves-for-approval.component.scss']
})
export class TeamLeavesForApprovalComponent implements OnInit, OnChanges, OnDestroy {
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
  specialLeaveTypes: any = [];
  showButton: boolean;
  teamLeaves: any;
  toMinDate: any;
  minDate: any;
  teamLeaveForm: FormGroup;
  pageSettings: any;
  filterSettings: any;
  @Output() canApplyCompOff = new EventEmitter();
  @Output() canApplyEarlyLogOut = new EventEmitter();
  statusType: any;
  constructor(
    private readonly leaveService: LeaveManagementService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal,
    private readonly leaveTypeService: LeaveTypeService,
    private fb: FormBuilder,
    private router: Router) {
    this.ShowMaternity = true;
    this.ShowPaternity = true;
    this.ShowVaction = true;
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.isApprovalLeaveHide = this.router.url == RouteUrl.MYLEAVES ? true : false;
    this.subscriptionName = new Subscription();
    this.showButton = false;
    this.teamLeaveForm = this.fb.group({
      EmployeeSlno: [this.employeeProfile.EmployeeSlno],
      LeaveFrom: [new Date(), Validators.required],
      LeaveTo: [new Date(), Validators.required]
    })
    this.statusType = [{ id: 2, name: "Approved" }, { id: 1, name: "Pending For Approve" }, { id: 3, name: "Reject" }, { id: 4, name: "Cancel" }]
  }
  ngOnChanges(changes: SimpleChanges): void {
    if (this.refreshData) {
      this.getPendingLeaves();
    }
  }
  ngOnInit(): void {
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 14 };
    this.subscriptionName = this.leaveService.getUpdate().subscribe
      ((isApplyLeave: boolean) => { //message contains the data sent from service
        if (isApplyLeave) {
          if (!this.isApprovalLeaveHide) {
            this.getPendingLeaves();
          }
        }
      });
    if (!this.isApprovalLeaveHide) {
      this.getPendingLeaves();
    }
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
  canApproveLeave(leaveData: any) {
    let payrollMonthFrom = this.getDate(this.employeeProfile.PayrollMonthFrom);
    let leaveDate = this.getDate(leaveData.LeaveFrom);
    if (payrollMonthFrom > leaveDate) {
      return false;
    }
    return true;
  }
  getDate(date: any): any {
    const _date = new Date(date);
    //return `${_date.getFullYear()}-${_date.getMonth()}-${_date.getDate()}`;      
    return _date;
  };
  viewLeaveDetails(leaveData: any, visibleButton: string, isManager?: boolean) {
    debugger;
    let leave = leaveData;
    const modalRef = this.modalService.open(ApproveLeaveComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = leaveData;
    modalRef.componentInstance.isManager = isManager;
    modalRef.componentInstance.visibleButton = visibleButton.toString()
    modalRef.result.then(() => {
      this.refreshData = true;
    });
  }
  isCancelVisible(e: any) {
    let leaveStatusId = e.data.LeaveStatusId;
    return (e.data.EnableDelete) && leaveStatusId != LEAVE_STATUS_ID.Canceled && leaveStatusId != LEAVE_STATUS_ID.Rejected;
  }
  viewEmpHistoryDetails(event: any) {
    const modalRef = this.modalService.open(EmployeeLeaveHistoryComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = event;
    modalRef.result.then(() => {
    });
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
