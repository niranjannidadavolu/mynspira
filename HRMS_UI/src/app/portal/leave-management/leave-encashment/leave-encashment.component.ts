import { Component, OnInit } from '@angular/core';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { StorageService } from 'src/app/core/services';
import { CreateEncashmentComponent } from './create-encashment/create-encashment.component';
import { LeaveEncashmentService } from 'src/app/core/services/leave-encashment/leave-encashment.service';
import Swal from 'sweetalert2';
import { LEAVE_STATUS_ID, approveLeaveBtnShow } from 'src/app/core/constants/leave-status.constant';
import { LeaveTypeService } from 'src/app/core/services/masters';
import { LeaveType } from 'src/app/core/enum/application-enums';
@Component({
  selector: 'app-leave-encashment',
  templateUrl: './leave-encashment.component.html',
  styleUrls: ['./leave-encashment.component.scss']
})
export class LeaveEncashmentComponent implements OnInit {
  breadCrumbItems: ({ label: string; active?: undefined; } | { label: string; active: boolean; })[];
  employeeProfile: any;
  leaveEncashmentList: any = [];
  leaveAction = approveLeaveBtnShow;
  leaveEncashmentApprovalList: any = [];
  plLeaveData: any = null;
  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  constructor(
    private readonly storageService: StorageService,
    private readonly leaveEncashmentService: LeaveEncashmentService,
    private readonly modalService: NgbModal,
    private readonly leaveTypeService: LeaveTypeService,
  ) {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Leave Encashment', active: true }
    ];
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
  }
  ngOnInit(): void {
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 14 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
    this.getLeaveEncashment();
    this.getLeaveEncashmentApproval();
    this.getLeaveTypes();
  }
  getLeaveEncashment() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.leaveEncashmentService.getLeaveEncashment(employeeSlno).subscribe((res: any) => {
      this.leaveEncashmentList = res;
    })
  }
  getLeaveEncashmentApproval() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.leaveEncashmentService.getLeaveEncashmentApproval(employeeSlno).subscribe((res: any) => {
      this.leaveEncashmentApprovalList = res;
      // if (this.approvalDataGrid) {
      //   this.approvalDataGrid.instance.refresh();
      // }
    })
  }
  getLeaveTypes() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.leaveTypeService.getAssignedLeaveTypes(employeeSlno).subscribe((data: any) => {
      let leave = data.find((s: any) => s.LeaveTypeId == LeaveType.PRIVILEGE_LEAVE);
      if (leave) {
        this.plLeaveData = 100;
      }
    });
  }
  applyEncashment(leaveData?: any, type?: any) {
    const modalRef = this.modalService.open(CreateEncashmentComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = leaveData;
    modalRef.componentInstance.type = type;
    modalRef.result.then(() => {
      this.getLeaveEncashment();
      this.getLeaveEncashmentApproval();
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
  isCancelVisible(e: any) {
    let leaveStatusId = e.StatusId;
    return leaveStatusId != LEAVE_STATUS_ID.Canceled && leaveStatusId != LEAVE_STATUS_ID.Rejected && leaveStatusId != LEAVE_STATUS_ID.Approved;
  }
  deleteEncashment(leaveData?: any) {
    let obj = {
      EncashmentId: leaveData.EncashmentId,
      UpdatedBy: this.employeeProfile.EmployeeSlno,
      EntitlementId: leaveData.EntitlementId,
      TotalDaysTaken: leaveData.TotalDaysTaken
    }
    Swal.fire({
      title: 'Are you sure to cancel your leave encashment request?',
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        this.leaveEncashmentService.cancelEncashment(obj).subscribe(res => {
          if (res) {
            this.getLeaveEncashment();
            Swal.fire({
              title: 'Well done !',
              text: 'Aww yeah, your encashment request is successfully cancelled.',
              icon: 'success',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
          else {
            Swal.fire({
              title: 'Oops...! Something went Wrong !',
              text: 'Your encashment request is not cancelled.',
              icon: 'warning',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
        })
      }
    });
  }
}
