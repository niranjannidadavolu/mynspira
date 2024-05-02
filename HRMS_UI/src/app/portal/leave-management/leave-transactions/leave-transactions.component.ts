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
import { FilteringEventArgs } from '@syncfusion/ej2-angular-dropdowns';
import { EmitType } from '@syncfusion/ej2-base';
import { Query } from '@syncfusion/ej2-data';
import { GridComponent } from '@syncfusion/ej2-angular-grids';


@Component({
  selector: 'app-leave-transactions',
  templateUrl: './leave-transactions.component.html',
  styleUrls: ['./leave-transactions.component.scss'],
  preserveWhitespaces: true,
})
export class LeaveTransactionsComponent implements OnInit {
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
  @ViewChild("grid") public grid?: GridComponent;
  fields: Object = { text: 'BranchName', value: 'PBranchSLNo' };
  watermarks: string = 'Select Branches';
  filterPlaceholder: any;
  filterOptions: any;
  mode: string;
  popHeight: string = '350px'
  format: { type: string; format: string; };
  timeFormat: { type: string; format: string; };
  selectedRows: any;
  selectionSettings: any;

  constructor(
    private fb: FormBuilder,
    private reportsService: ReportsService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal,
    private branchService: BranchesService,
    private leaveManagementService: LeaveManagementService,
  ) {
    this.filterReportForm = this.fb.group({
      FromDate: [],
      ToDate: [],
      pBranchSlno: [null],
      employeeSLNo: [null],
      statusId: [null],
      BranchSlno: [],
      Branches: [null, Validators.required]
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
    this.filterReportForm.controls['BranchSlno'].patchValue([]);
    this.allMode = 'allPages';
    this.checkBoxesMode = 'always';//themes.current().startsWith('material') ? 'always' : 'onClick';
    this.mode = 'CheckBox';
    this.filterPlaceholder = 'Search Bracnches';
    this.format = { type: "date", format: "dd-MMM-yyyy" };
    this.timeFormat = { type: "dateTime", format: "hh:mm a" };
    this.filterOptions = {
      type: 'Menu'
    };
    this.selectionSettings = {
      persistSelection: true,
      type: "Multiple",
      checkboxOnly: true,
    };
  }
  ngOnInit(): void {
    this.getHrBranches();
  }
  onFiltering: EmitType<FilteringEventArgs> = (e: FilteringEventArgs) => {
    let query: Query = new Query();
    //frame the query based on search string with filter type.
    query = (e.text !== '') ? query.where('BranchName', 'contains', e.text, true) : query;
    //pass the filter data source, filter query to updateData method.
    e.updateData(this.branches, query);
  };

  get getSelectedRows() {
    this.selectedRows = [];
    if (this.grid) {
      this.selectedRows = this.grid?.getSelectedRecords();
    }
    return null;
  }

  get isRecordsSelected() {
    let selectedRowsCount = 0;
    if (this.grid) {
      selectedRowsCount = this.grid?.getSelectedRecords().length;
    }
    return selectedRowsCount > 0;
  }

  getHrBranches() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.branchService.getHrBranches(employeeSlno).subscribe((res) => {
      this.branches = res;
      this.selectAllForDropdownItems(this.branches);
    })
  }
  approveLeave(data: any) {
    Swal.fire({
      title: `Approve Leave`,
      html: 'Are you sure want to <span class="text-success"><strong>Approve</strong></span> the leave?',
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        
        let leaveData: any;
        leaveData = [];
        data.HREmployeeSlno = this.employeeProfile.EmployeeSlno;
        data.LeaveStatusId = LEAVE_STATUS_ID.Approved;
        data.ApprovedRemarks = 'Approved By ' + this.employeeProfile.EmployeeName;
        leaveData.push(data);
        this.leaveManagementService.updateTeamLeavesByHR(leaveData).subscribe((res: any) => {
          if (res) {
            this.getLeaveReports();
            Swal.fire({
              title: `Selected leave has been Approved`,
              text: `Leave has been 'Approved'.`,
              icon: 'success',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
          else {
            Swal.fire({
              title: 'Oops...! Something went Wrong !',
              text: `Leave not Approved.`,
              icon: 'error',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
        });
      }
    });

  }
  rejectLeave(data: any) {
    Swal.fire({
      title: `Reject Leave`,
      html: 'Are you sure want to <span class="text-danger"><strong>Reject</strong></span> the leave?',
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        
        let leaveData: any;
        leaveData = [];
        data.HREmployeeSlno = this.employeeProfile.EmployeeSlno;
        data.LeaveStatusId = LEAVE_STATUS_ID.Rejected;
        data.ApprovedRemarks = 'Rejected By ' + this.employeeProfile.EmployeeName;
        leaveData.push(data);
        this.leaveManagementService.updateTeamLeavesByHR(leaveData).subscribe((res: any) => {
          if (res) {
            this.getLeaveReports();
            Swal.fire({
              title: `Selected leave has been Rejected.`,
              text: `Leave has been 'Rejected'.`,
              icon: 'success',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
          else {
            Swal.fire({
              title: 'Oops...! Something went Wrong !',
              text: `Leave not Rejected.`,
              icon: 'error',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
        });
      }
    });

  }

  approveAllLeaves() {
    let data = this.grid?.getSelectedRecords();
    if (data) {
      data.forEach((element: any) => {
        element.HREmployeeSlno = this.employeeProfile.EmployeeSlno;
        element.LeaveStatusId = LEAVE_STATUS_ID.Approved;
        element.ApprovedRemarks = 'Approved By ' + this.employeeProfile.EmployeeName;
      });
      Swal.fire({
        title: `Approve Leave`,
        html: 'Are you sure want to <span class="text-success"><strong>Approve</strong></span> All Leaves Selected?',
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          
          this.leaveManagementService.updateTeamLeavesByHR(data).subscribe((res: any) => {
            if (res) {
              this.getLeaveReports();
              Swal.fire({
                title: `Selected leave has been Approved`,
                text: `Leave has been 'Approved'.`,
                icon: 'success',
                confirmButtonColor: 'rgb(54, 69, 116)',
                confirmButtonText: 'Ok'
              });
            }
            else {
              Swal.fire({
                title: 'Oops...! Something went Wrong !',
                text: `Leave not Approved.`,
                icon: 'error',
                confirmButtonColor: 'rgb(54, 69, 116)',
                confirmButtonText: 'Ok'
              });
            }
          });
        }
      });
    }

  }
  rejectAllLeaves() {
    let data = this.grid?.getSelectedRecords();
    if (data) {
      data.forEach((element: any) => {
        element.HREmployeeSlno = this.employeeProfile.EmployeeSlno;
        element.LeaveStatusId = LEAVE_STATUS_ID.Approved;
        element.ApprovedRemarks = 'Rejected By ' + this.employeeProfile.EmployeeName;
      }); Swal.fire({
        title: `Reject Leave`,
        html: 'Are you sure want to <span class="text-danger"><strong>Reject</strong></span> All Leaves Selected?',
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          
          this.leaveManagementService.updateTeamLeavesByHR(data).subscribe((res: any) => {
            if (res) {
              this.getLeaveReports();
              Swal.fire({
                title: `Selected leave has been Rejected.`,
                text: `Leave has been 'Rejected'.`,
                icon: 'success',
                confirmButtonColor: 'rgb(54, 69, 116)',
                confirmButtonText: 'Ok'
              });
            }
            else {
              Swal.fire({
                title: 'Oops...! Something went Wrong !',
                text: `Leave not Rejected.`,
                icon: 'error',
                confirmButtonColor: 'rgb(54, 69, 116)',
                confirmButtonText: 'Ok'
              });
            }
          });
        }
      });
    }

  }


  getSelectedRowsData(isForApprove: boolean) {
    let data = this.selectedRows;
    if (data.length) {
      Swal.fire({
        title: `Are you sure want to ${isForApprove ? 'Approve' : 'Reject'} the leaves?`,
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          
          data.forEach((element: any) => {
            element.LeaveStatusId = isForApprove ? LEAVE_STATUS_ID.Approved : LEAVE_STATUS_ID.Rejected,
              element.StatusId = isForApprove ? LEAVE_STATUS_ID.Approved : LEAVE_STATUS_ID.Rejected,
              element.ApprovedBy = this.employeeProfile.EmployeeSlno,
              element.ApprovedRemarks = (`Auto ${isForApprove ? 'Approved' : 'Rejected'} by ` + this.employeeProfile.EmployeeName).toUpperCase()
          });
          // this.leaveManagementService.updateTeamLeavesByHR(data).subscribe((res: any) => {
          //   if (res) {
          //     this.getLeaveReports();
          //     Swal.fire({
          //       title: `Selected leave has been Approved`,
          //       text: `Leave has been 'Approved'.`,
          //       icon: 'success',
          //       confirmButtonColor: 'rgb(54, 69, 116)',
          //       confirmButtonText: 'Ok'
          //     });
          //   }
          //   else {
          //     Swal.fire({
          //       title: 'Oops...! Something went Wrong !',
          //       text: `Leave not ${obj.LeaveStatusId == LEAVE_STATUS_ID.Approved ? 'Approved' : 'Rejected'}.`,
          //       icon: 'error',
          //       confirmButtonColor: 'rgb(54, 69, 116)',
          //       confirmButtonText: 'Ok'
          //     });
          //   }
          // });
        }
      })
    }

  }

  autoProcessLeave(obj: any) {

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
  onCancelLeave(data: any) {
    Swal.fire({
      title: `Are you sure to cancel ( ${data.EmployeeName} - ${data.LeaveTypeName.toLowerCase()}) ?`,
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        this.leaveManagementService.cancelEmpLeave(data.LeaveId, this.employeeProfile.EmployeeSlno).subscribe(res => {
          if (res) {
            // this.leaveManagementService.sendUpdate(true);
            this.getLeaveReports();
            Swal.fire({
              title: 'Well done !',
              text: `Aww yeah, ${data.EmployeeName} leaves are successfully cancelled.`,
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
  getShortName(fullName: any) {
    return fullName.split(' ').map((n: any) => n[0]).join('');
  }
  getLeaveReports() {

    this.isSubmitted = true;
    this.filterReportForm.markAsTouched();
    if (this.filterReportForm.invalid) {
      return;
    }
    
    let obj = this.filterReportForm.value;
    this.reportsService.getLeavesForHRApproval(obj).subscribe((res) => {
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
