import { Component, Input, OnChanges, OnInit, Pipe, PipeTransform, SimpleChanges, OnDestroy, ViewChild } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { DxDataGridComponent } from 'devextreme-angular';
import { Subscription } from 'rxjs';
import { approveLeaveBtnShow, LEAVE_STATUS_ID } from 'src/app/core/constants/leave-status.constant';
import { LeaveDetail } from 'src/app/core/models/leave-management/emp-leave-detail.model';
import { StorageService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { ApplyLeaveComponent } from 'src/app/portal/leave-management/apply-leave/apply-leave.component';
import { ApproveLeaveComponent } from 'src/app/portal/leave-management/approve-leave/approve-leave.component';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-my-leaves-dashboard',
  templateUrl: './my-leaves-dashboard.component.html',
  styleUrls: ['./my-leaves-dashboard.component.scss']
})
export class MyLeavesDashboardComponent implements OnInit, OnDestroy {
  @ViewChild('gridContainer', { static: false }) myLeaveDataGrid: DxDataGridComponent | undefined;
  @Input() statusId: number = 0;
  @Input() refreshData: boolean = false;
  employeeProfile: any;
  gridData: any;
  subscriptionName: Subscription;
  pendingLeaves: any;
  myLeaves: any;
  leaveAction = approveLeaveBtnShow;
  myLeavesStatus: any;
  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  constructor(
    private readonly leaveService: LeaveManagementService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal) {
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.cancelLeave = this.cancelLeave.bind(this);
    this.subscriptionName = new Subscription();
    this.myLeavesStatus = [{ id: 2, name: "Approved" }, { id: 1, name: "Pending For Approve" }, { id: 3, name: "Reject" }, { id: 4, name: "Cancel" }]
  }
  removeleaveTypeDuplicates(data: any) {
    // 
    const leaveTypeArray: any = [];
    let leaveTypes = data.map((p: any) => p.LeaveTypeName);
    const uniqueLeaveType = Array.from(new Set(leaveTypes.map((p: any) => JSON.stringify(p)))).map((p: any) => JSON.parse(p));
    leaveTypeArray.push(uniqueLeaveType)
    const mapped = Object.entries(uniqueLeaveType).map(([id, value]) => ({ id, value }));
    return mapped;
  }
  ngOnChanges(changes: SimpleChanges): void {
    if (this.refreshData) {
      this.getMyLeaves();
    }
  }
  ngOnInit(): void {
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 14 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
    this.subscriptionName = this.leaveService.getUpdate().subscribe
      ((isApplyLeave: boolean) => { //message contains the data sent from service
        if (isApplyLeave) {
          this.getMyLeaves();
        }
      });
    this.getMyLeaves();
  }
  cancelLeave(event: any) {
    this.cancelLeaveRequest(event.data);
  }
  getMyLeaves() {
    this.leaveService.getMyLeaves(this.employeeProfile.EmployeeSlno, this.statusId, false).subscribe(data => {
      this.myLeaves = data;
      if (this.myLeaveDataGrid) {
        this.myLeaveDataGrid.instance.refresh();
      }
    });
  }
  viewLeaveDetails(leaveData: any, visibleButton: string, isManager?: boolean) {
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
    let leaveStatusId = e.LeaveStatusId;
    return (e.EnableDelete) && leaveStatusId != LEAVE_STATUS_ID.Canceled && leaveStatusId != LEAVE_STATUS_ID.Rejected;
  }
  cancelLeaveRequest(data: any) {
    // let cancelLeave = new LeaveDetail();
    // cancelLeave.LeaveId = data.LeaveId;
    // cancelLeave.ManagerId = this.employeeProfile.EmployeeSlno;
    // cancelLeave.LeaveStatusId = LEAVE_STATUS_ID.Canceled;
    // cancelLeave.LeaveWorkFlows = [];
    Swal.fire({
      title: 'Are you sure to cancel leaves?',
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
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
