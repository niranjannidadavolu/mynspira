import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { StorageService } from 'src/app/core/services';
import { BranchesService } from 'src/app/core/services/masters';
import { ReportsService } from 'src/app/core/services/reports/reports.service';
import { SwiperSliderComponent } from 'src/app/shared/app-components/swiper-slider/swiper-slider.component';
import { DxDataGridComponent } from 'devextreme-angular';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import Swal from 'sweetalert2';
import { LEAVE_STATUS_ID } from 'src/app/core/constants/leave-status.constant';

@Component({
  selector: 'app-leave-report',
  templateUrl: './leave-report.component.html',
  styleUrls: ['./leave-report.component.scss']
})
export class LeaveReportComponent implements OnInit {
  breadCrumbItems: ({ label: string; active?: undefined; } | { label: string; active: boolean; })[];
  filterReportForm: FormGroup;
  minDate: any;
  toMinDate: any;
  teamLeaves: any = [];
  branches: any[] = [];
  employeeProfile: any;
  leaveReports: any = [];
  showFilterRow: boolean;
  showHeaderFilter: boolean;
  applyFilterTypes: any;
  pBranchSlno: any
  currentFilter: string;
  isSubmitted: boolean = false;
  allMode: string;

  checkBoxesMode: string;
  @ViewChild(DxDataGridComponent, { static: false }) dataGrid!: DxDataGridComponent;

  constructor(
    private fb: FormBuilder,
    private reportsService: ReportsService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal,
    private branchService: BranchesService,
    private leaveManagementService: LeaveManagementService
  ) {
    this.filterReportForm = this.fb.group({
      FromDate: [new Date()],
      ToDate: [new Date()],
      BranchSlno: [null, Validators.required],
      EmployeeSlno: [''],
      statusId: [1]
    });
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Leave Transactions', active: true }
    ];
    this.showFilterRow = true;
    this.showHeaderFilter = true;
    this.applyFilterTypes = [{
      key: "auto",
      name: "Immediately"
    }, {
      key: "onClick",
      name: "On Button Click"
    }];
    this.currentFilter = this.applyFilterTypes[0].key;
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.filterReportForm.controls['employeeSLNo'].patchValue(this.employeeProfile.EmployeeSlno);
    this.allMode = 'allPages';
    this.checkBoxesMode = 'always';//themes.current().startsWith('material') ? 'always' : 'onClick';
  }
  ngOnInit(): void {
    this.getHrBranches();
  }
  get pBranchSlnoControl() {
    return this.filterReportForm.get('pBranchSlno')!;
  }
  getHrBranches() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.branchService.getHrBranches(employeeSlno).subscribe((res) => {
      this.branches = res;
      this.selectAllForDropdownItems(this.branches);
    })
  }

  getSelectedRowsData(isForApprove: boolean) {
    let data = this.dataGrid.instance.getSelectedRowsData();
    if (data.length) {
      Swal.fire({
        title: `Are you sure want to ${isForApprove ? 'Approve' : 'Reject'} the leaves?`,
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          let obj = {
            LeaveId: data.map(s => s.LeaveId),
            ApprovedBy: this.employeeProfile.EmployeeSlno,
            LeaveStatusId: isForApprove ? LEAVE_STATUS_ID.Approved : LEAVE_STATUS_ID.Rejected,
            ApprovedRemarks: (`Auto ${isForApprove ? 'Approved' : 'Rejected'} by ` + this.employeeProfile.EmployeeName).toUpperCase()
          }
          this.autoProcessLeave(obj);
        }
      })
    }

  }

  autoProcessLeave(obj: any) {
    this.leaveManagementService.UpdateTeamLeaves(obj).subscribe((res) => {
      if (res) {
        this.getLeaveReports();
        Swal.fire({
          title: `Selected leave has been ${obj.LeaveStatusId ? 'Approved' : 'Rejected'}.`,
          text: `Leave has been ${obj.LeaveStatusId == LEAVE_STATUS_ID.Approved ? 'Approved' : 'Rejected'}.`,
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: `Leave not ${obj.LeaveStatusId == LEAVE_STATUS_ID.Approved ? 'Approved' : 'Rejected'}.`,
          icon: 'error',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    })
  }
  approveOrRejectLeave(data: any, isForApprove: boolean) {
    Swal.fire({
      title: `Are you sure want to ${isForApprove ? 'Approve' : 'Reject'} the leave?`,
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        let obj = {
          LeaveId: [data.LeaveId],
          ApprovedBy: this.employeeProfile.EmployeeSlno,
          LeaveStatusId: isForApprove ? LEAVE_STATUS_ID.Approved : LEAVE_STATUS_ID.Rejected,
          ApprovedRemarks: (`Auto ${isForApprove ? 'Approved' : 'Rejected'} by ` + this.employeeProfile.EmployeeName).toUpperCase()
        }
        this.autoProcessLeave(obj);
      }
    })
  }
  getLeaveReports() {
    this.isSubmitted = true;
    this.filterReportForm.markAsTouched();
    if (this.filterReportForm.invalid) {
      return;
    }
    let obj = this.filterReportForm.getRawValue();
    this.reportsService.getAllLeavesReport(obj).subscribe((res) => {
      this.isSubmitted = false;
      this.leaveReports = res;
    })
  }
  selectAllForDropdownItems(items: any[]) {
    let allSelect = (items: any[]) => {
      items.forEach(element => {
        element['selectedAllGroup'] = 'selectedAllGroup';
      });
    };

    allSelect(items);
  }
  onChangeBranch(event: any) {
    // //console.log(event);
    let arrayEle = Object.keys(event).map(function (k) { return event[k].PBranchSLNo }).join(",");;
    if (event.length) {
      this.filterReportForm.controls['pBranchSlno'].patchValue(arrayEle);
    } else if (event.length == 0) {
      this.filterReportForm.controls['pBranchSlno'].patchValue(null);
    }
  }
  getValue(data: any) {
    return data.BranchName
  }
  viewFiles(event: any) {
    if (event.data?.leaveFileUploadReports?.length) {
      const modalRef = this.modalService.open(SwiperSliderComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
      let obj = {
        title: `${event.data?.EmpID}- ${event.data?.EmployeeName} - (${event.data?.LeaveTypeName})`,
        attachments: event.data.leaveFileUploadReports
      };
      modalRef.componentInstance.attchmentmentDetails = obj;
      modalRef.result.then(() => {
      },
        (reason) => {
          let closeResult = `Dismissed ${this.getDismissReason(reason)}`;

        });
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
}
