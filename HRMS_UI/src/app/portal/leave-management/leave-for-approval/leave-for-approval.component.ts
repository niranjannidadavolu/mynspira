import {
  Component,
  EventEmitter,
  Input,
  Output,
  ViewChild,
} from "@angular/core";
import { FormGroup, FormBuilder } from "@angular/forms";
import { Router } from "@angular/router";
import { NgbModal } from "@ng-bootstrap/ng-bootstrap";
import { Subscription } from "rxjs";
import { LEAVE_STATUS_ID, approveLeaveBtnShow } from "src/app/core";
import { LeaveType, RouteUrl } from "src/app/core/enum/application-enums";
import { StorageService } from "src/app/core/services";
import { LeaveManagementService } from "src/app/core/services/leave-management";
import { GridComponent } from "@syncfusion/ej2-angular-grids";
import Swal from "sweetalert2";
import { LeaveDetail } from "src/app/core/models/leave-management/emp-leave-detail.model";
import { Browser } from "@syncfusion/ej2-base";
import { ClickEventArgs } from "@syncfusion/ej2-navigations";

@Component({
  selector: "app-leave-for-approval",
  templateUrl: "./leave-for-approval.component.html",
  styleUrls: ["./leave-for-approval.component.scss"],
})
export class LeaveForApprovalComponent {
  breadCrumbItems: (
    | { label: string; active?: undefined }
    | { label: string; active: boolean }
  )[];
  @ViewChild("grid") public grid?: GridComponent;

  loadingIndicator: Object;

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
  @Output() canApplyCompOff = new EventEmitter();
  @Output() canApplyEarlyLogOut = new EventEmitter();
  statusType: any;
  selectionSettings: {
    persistSelection: boolean;
    type: string;
    checkboxOnly: boolean;
  };
  filterSettings: { type: string };
  format = { type: "date", format: "dd-MMM-yyyy" };
  commands: any;
  toolbar: string[];
  rowMode: string;
  isDeskTop: boolean;

  constructor(
    private readonly leaveService: LeaveManagementService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal,
    private fb: FormBuilder,
    private router: Router,
    private leaveManagementService: LeaveManagementService
  ) {
    
    this.loadingIndicator = { indicatorType: "Shimmer" };
    this.commands = [
      {
        buttonOption: {
          iconCss: "pending-icon",
          title: "Penidng For Approval",
        },
      },
      { buttonOption: { iconCss: "approve-icon", title: "Approve Leave" } },
      { buttonOption: { iconCss: "reject-icon", title: "Reject Leave" } },
      { buttonOption: { iconCss: "cancelled-icon", title: "Cancel Leave" } },
    ];

    this.ShowMaternity = true;
    this.ShowPaternity = true;
    this.ShowVaction = true;
    this.employeeProfile = JSON.parse(
      this.storageService.get("EmployeeProfile", 1)
    );
    this.isApprovalLeaveHide =
      this.router.url == RouteUrl.MYLEAVES ? true : false;
    this.selectionSettings = {
      persistSelection: true,
      type: "Multiple",
      checkboxOnly: true,
    };
    this.filterSettings = { type: "Menu" };
    this.subscriptionName = new Subscription();
    this.showButton = false;
    this.teamLeaveForm = this.fb.group({
      EmployeeSlno: [this.employeeProfile.EmployeeSlno],
      FromDate: [new Date(this.employeeProfile.PayrollMonthFrom)],
      ToDate: [new Date(this.employeeProfile.PayrollMonthTo)],
    });
    this.statusType = [
      { id: 2, name: "Approved" },
      { id: 1, name: "Pending For Approve" },
      { id: 3, name: "Reject" },
      { id: 4, name: "Cancel" },
    ];
    this.breadCrumbItems = [
      { label: "ESSP" },
      { label: "Leaves For Approval", active: true },
    ];
    this.toolbar = ["ColumnChooser", "ExcelExport"];
    this.rowMode = "Vertical";
    
    this.isDeskTop = !Browser.isDevice;
    this.getPendingLeaves();
  }
  get selectedRowsCount() {
    if (this.grid) {
      let selectedRows = this.grid?.getSelectedRecords().length;
      return selectedRows;
    }
    return 0;
  }
  toolbarClick(args: ClickEventArgs): void {
    switch (args.item.id) {
      case "grid_pdfexport":
        if (this.grid) {
          this.grid.pdfExport();
        }
        break;
      case "grid_excelexport":
        if (this.grid) {
          this.grid.excelExport();
        }
        break;
      case "grid_csvexport":
        if (this.grid) {
          this.grid.csvExport();
        }
        break;
    }
  }
  ApproveLeaves() {
    
    let selectedRows = this.grid?.getSelectedRecords() as LeaveDetail[];
    if (selectedRows) {
      selectedRows.forEach((_leaveDetail: any) => {
        _leaveDetail.LeaveStatusId = LEAVE_STATUS_ID.Approved;
        _leaveDetail.ApprovedRemarks = (
          `Leave has been approved by ` + this.employeeProfile.EmployeeName
        ).toUpperCase();
        _leaveDetail.ApprovedBy = this.employeeProfile.EmployeeSlno;
        _leaveDetail.OfficeTypeName = this.employeeProfile.EmployeeSlno;
      });
    }
    Swal.fire({
      title: `Are you sure want to Approve the selected leave(s)?`,
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
    }).then((result) => {
      if (result.isConfirmed) {
        this.leaveManagementService
          .UpdateTeamLeaves(selectedRows)
          .subscribe((res) => {
            if (res) {
              this.getPendingLeaves();
              Swal.fire({
                title: `Selected leave(s) are Approved.`,
                text: `Selected leave(s) are Approved.`,
                icon: "success",
                confirmButtonColor: "rgb(54, 69, 116)",
                confirmButtonText: "Ok",
              });
            } else {
              Swal.fire({
                title: "Oops...! Something went Wrong !",
                text: `Selected leave(s) are NOT Approved.`,
                icon: "error",
                confirmButtonColor: "rgb(54, 69, 116)",
                confirmButtonText: "Ok",
              });
            }
          });
      }
    });
  }
  RejectLeaves() {
    
    let selectedRows = this.grid?.getSelectedRecords() as LeaveDetail[];
    if (selectedRows) {
      selectedRows.forEach((_leaveDetail: any) => {
        _leaveDetail.LeaveStatusId = LEAVE_STATUS_ID.Rejected;
        _leaveDetail.ApprovedRemarks = (
          `Leave has been rejected by ` + this.employeeProfile.EmployeeName
        ).toUpperCase();
        _leaveDetail.ApprovedBy = this.employeeProfile.EmployeeSlno;
        _leaveDetail.OfficeTypeName = this.employeeProfile.EmployeeSlno;
      });
    }
    Swal.fire({
      title: `Are you sure want to Reject the selected leave(s)?`,
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
    }).then((result) => {
      if (result.isConfirmed) {
        this.leaveManagementService
          .UpdateTeamLeaves(selectedRows)
          .subscribe((res) => {
            if (res) {
              this.getPendingLeaves();
              Swal.fire({
                title: `Selected leave(s) are Rejected.`,
                text: `Selected leave(s) are Rejected.`,
                icon: "error",
                confirmButtonColor: "rgb(54, 69, 116)",
                confirmButtonText: "Ok",
              });
            } else {
              Swal.fire({
                title: "Oops...! Something went Wrong !",
                text: `Selected leave(s) are NOT Rejected.`,
                icon: "error",
                confirmButtonColor: "rgb(54, 69, 116)",
                confirmButtonText: "Ok",
              });
            }
          });
      }
    });
  }
  getPendingLeaves() {
    this.leaveService
      .getPendingLeaves(this.teamLeaveForm.value)
      .subscribe((data: any) => {
        this.pendingLeaves = data;
      });
  }
}
