import {
  FormBuilder,
  FormGroup,
  Validators,
} from "@angular/forms";
import { DatePipe } from "@angular/common";
import {
  Component,
  Input,
  OnInit,
  ViewChild,
} from "@angular/core";
import { NgbModal } from "@ng-bootstrap/ng-bootstrap";
import {
  approveLeaveBtnShow,
} from "src/app/core/constants/leave-status.constant";
import { StorageService } from "src/app/core/services";
import { LeaveManagementService } from "src/app/core/services/leave-management";
import { ApproveLeaveComponent } from "src/app/portal/leave-management/approve-leave/approve-leave.component";
import { EmployeeLeaveHistoryComponent } from "../employee-leave-history/employee-leave-history.component";
import { GridComponent } from "@syncfusion/ej2-angular-grids";
import { ClickEventArgs } from "@syncfusion/ej2-angular-navigations";

@Component({
  selector: "app-my-team-leaves",
  templateUrl: "./my-team-leaves.component.html",
  styleUrls: ["./my-team-leaves.component.scss"],
})
export class MyTeamLeavesComponent implements OnInit {
  @ViewChild('grid')
  public grid: GridComponent | undefined;
  @Input() statusId: number = 0;
  @Input() refreshData: boolean = false;
  @Input() public isApproved: boolean = false;
  employeeProfile: any;
  gridData: any;
  pendingLeaves: any;
  teamLeaves: any;
  myLeaves: any;
  leaveAction = approveLeaveBtnShow;
  minDate: any;
  toMinDate: any;
  maxDate: any;
  teamLeaveForm: FormGroup;
  breadCrumbItems: (
    | { label: string; active?: undefined }
    | { label: string; active: boolean }
  )[];

  today: Date = new Date(new Date().toDateString());
  weekStart: Date = new Date(new Date(new Date().setDate(new Date().getDate() - (new Date().getDay() + 7) % 7)).toDateString());
  weekEnd: Date = new Date(new Date(new Date().setDate(new Date(new Date().setDate((new Date().getDate() - (new Date().getDay() + 7) % 7))).getDate() + 6)).toDateString());
  monthStart: Date = new Date(new Date(new Date().setDate(1)).toDateString());
  monthEnd: Date = this.today;
  lastStart: Date = new Date(new Date(new Date(new Date().setMonth(new Date().getMonth() - 1)).setDate(1)).toDateString());
  lastEnd: Date = this.today;

  yearStart: Date = new Date(this.today.getFullYear() - 1, 1, 1);
  yearEnd: Date = new Date(this.today.getFullYear() - 1, 12, 31);

  lastYearStart: Date = new Date(this.today.getFullYear() - 2, 1, 1);
  lastYearEnd: Date = new Date(this.today.getFullYear() - 2, 12, 31);

  filterOptions: { type: string; };
  toolbar: string[];
  format: { type: string; format: string; };
  level3: any;
  level2: any;
  level1: any;

  constructor(
    private readonly leaveService: LeaveManagementService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal,
    private fb: FormBuilder,
    private readonly datePipe: DatePipe
  ) {

    this.breadCrumbItems = [
      { label: "ESSP" },
      { label: "My Team Leaves", active: true },
    ];


    this.employeeProfile = JSON.parse(
      this.storageService.get("EmployeeProfile", 1)
    );
    this.filterOptions = {
      type: 'Menu'
    };
    this.toolbar = ['ExcelExport', 'PdfExport', 'CsvExport'];
    this.format = { type: "date", format: "dd-MMM-yyyy" };
    //this.cancelLeave = this.cancelLeave.bind(this);
    //this.subscriptionName = new Subscription();

    // let fromDate = new Date();
    // // fromDate.setMonth(fromDate.getMonth() - 1);
    // // let minDate = LeaveApplyLimitDays.monthMinDate + '-' + this.datePipe.transform(fromDate, "MMM-yyyy");
    // this.minDate = new Date(new Date().getFullYear() - 1, 11, 26);
    // this.maxDate = new Date(new Date().getFullYear(), 11, 25);
    // this.toMinDate = fromDate;
    this.teamLeaveForm = this.fb.group({
      ReportRange: ['', Validators.required]
    });
    

    this.level1 = [
      {
        field: 'L1_EmployeeId',
        headerText: 'Employee Id',
        width: 200,
        minWidth: 10
      },
      {
        field: 'L1_EmployeeNumber',
        headerText: 'Employee Number',
        width: 200,
        minWidth: 10
      },
      {
        field: 'L1_EmployeeName',
        headerText: 'Employee Name',
        width: 200,
        minWidth: 10
      },
      {
        field: 'L1_Leave_Status_Name',
        headerText: 'Leave Status',
        width: 200,
        minWidth: 10
      },
      {
        field: 'L1_Leave_Approved_Date',
        headerText: 'Approved On',
        width: 200,
        minWidth: 10,
        type: 'date',
        format: "dd-MMM-yyyy",
        align: 'Right'
      },
      {
        field: 'L1_Leave_Remarks',
        headerText: 'Remarks',
        width: 200,
        minWidth: 10
      }
    ];

    this.level2 = [
      {
        field: 'L2_EmployeeId',
        headerText: 'Employee Id',
        width: 200,
        minWidth: 10
      },
      {
        field: 'L2_EmployeeNumber',
        headerText: 'Employee Number',
        width: 200,
        minWidth: 10
      },
      {
        field: 'L2_EmployeeName',
        headerText: 'Employee Name',
        width: 200,
        minWidth: 10
      },
      {
        field: 'L2_Leave_Status_Name',
        headerText: 'Leave Status',
        width: 200,
        minWidth: 10
      },
      {
        field: 'L2_Leave_Approved_Date',
        headerText: 'Approved On',
        width: 200,
        minWidth: 10,
        type: 'date',
        format: "dd-MMM-yyyy",
        align: 'Right'
      },
      {
        field: 'L2_Leave_Remarks',
        headerText: 'Remarks',
        width: 200,
        minWidth: 10
      }
    ];

    this.level3 = [
      {
        field: 'L3_EmployeeId',
        headerText: 'Employee Id',
        width: 200,
        minWidth: 10
      },
      {
        field: 'L3_EmployeeNumber',
        headerText: 'Employee Number',
        width: 200,
        minWidth: 10
      },
      {
        field: 'L3_EmployeeName',
        headerText: 'Employee Name',
        width: 200,
        minWidth: 10
      },
      {
        field: 'L3_Leave_Status_Name',
        headerText: 'Leave Status',
        width: 200,
        minWidth: 10
      },
      {
        field: 'L3_Leave_Approved_Date',
        headerText: 'Approved On',
        width: 200,
        minWidth: 10,
        type: 'date',
        format: "dd-MMM-yyyy",
        align: 'Right'
      },
      {
        field: 'L3_Leave_Remarks',
        headerText: 'Remarks',
        width: 200,
        minWidth: 10
      }
    ];
    if (this.grid) {
      this.grid.frozenColumns = 4;
    }
  }
  // ngOnChanges(changes: SimpleChanges): void {
  //   if (this.refreshData) {
  //     this.getPendingLeaves();
  //     this.getTeamLeaves();
  //   }
  // }
  get f() {
    return this.teamLeaveForm.controls;
  }

  ngOnInit(): void {
    // if (this.fromDate) {
    //   this.fromDate.clickOpens = true;
    // }
    //this.getTeamLeaves();
  }
  // cancelLeave(event: any) {
  //   this.cancelLeaveRequest(event.data);
  // }
  // changeFromDate(event: any) {
  //   if (event.selectedDates !== undefined && event.selectedDates.length > 0) {
  //     let selectedFromDate = event.selectedDates[0];
  //     this.toMinDate = new Date(selectedFromDate);
  //     if (
  //       formatDate(selectedFromDate, "dd-MM-yyyy", "en") >
  //       formatDate(this.teamLeaveForm.value.leaveToDate, "dd-MM-yyyy", "en")
  //     ) {
  //       this.teamLeaveForm.controls["leaveToDate"].patchValue("");
  //     }
  //   }
  // }
  // getEmployeeLeaves() {
  //   
  //   let searchCriteria = this.teamLeaveForm.value;
  //   searchCriteria.FromDate = this.employeeProfile.PayrollMonthFrom;
  //   searchCriteria.ToDate = this.employeeProfile.PayrollMonthTo;
  //   let searchCritera = {
  //     EmployeeSlno: this.employeeProfile.EmployeeSlno,
  //     LeaveFrom: this.teamLeaveForm.value.leaveFromDate,
  //     LeaveTo: this.teamLeaveForm.value.leaveToDate,
  //   };
  //   this.leaveService.GetMyTeamEmployeeLeaves(searchCritera).subscribe((data) => {
  //     this.teamLeaves.map((s: any) => {
  //       if (s.EmployeeSlno == this.employeeProfile.EmployeeSlno) {
  //         s.myLeaves = data;
  //       }
  //     });
  //   });
  // }
  // getPendingLeaves() {
  //   this.leaveService
  //     .getPendingLeaves(this.employeeProfile.EmployeeSlno)
  //     .subscribe((data: any) => {
  //       this.pendingLeaves = data;
  //     });
  // }
  // onRowExpanded(event: any) {
  //   this.getEmployeeLeaves();
  // }
  getTeamLeaves() {
    
    if (this.teamLeaveForm.invalid) {
      return;
    }
    let searchCriteria = this.teamLeaveForm.value;
    let searchCritera = {
      EmployeeSlno: this.employeeProfile.EmployeeSlno,
      FromDate: searchCriteria.ReportRange[0],
      ToDate: searchCriteria.ReportRange[1],
    };
    this.leaveService.getTeamLeaves(searchCritera).subscribe((data: any) => {
      data.map((s: any) => (s.myLeaves = []));
      this.teamLeaves = data;
    });
  }

  // applyLeave() {
  //   const modalRef = this.modalService.open(ApplyLeaveComponent, {
  //     size: "lg",
  //     centered: true,
  //     backdrop: "static",
  //     backdropClass: "customBackdrop",
  //   });
  //   modalRef.result.then(() => {
  //     this.getPendingLeaves();
  //   });
  // }
  viewLeaveDetails(leaveData: any) {
    let leave = leaveData;
    this.isApproved = true;
    const modalRef = this.modalService.open(ApproveLeaveComponent, {
      size: "lg",
      centered: true,
      backdrop: "static",
      backdropClass: "customBackdrop",
    });
    modalRef.componentInstance.selectedRowData = leaveData;
    modalRef.componentInstance.visibleButton = approveLeaveBtnShow.view;
    modalRef.result.then(() => {
      this.refreshData = true;
    });
  }
  viewEmpHistoryDetails(event: any) {
    const modalRef = this.modalService.open(EmployeeLeaveHistoryComponent, {
      size: "lg",
      centered: true,
      backdrop: "static",
      backdropClass: "customBackdrop",
    });
    modalRef.componentInstance.selectedRowData = event.row.data;
    modalRef.result.then(() => { });
  }
  approveOrRejectLeaveDetails(leaveData: any, leaveType: string) {
    let leave = leaveData;
    this.isApproved = true;
    const modalRef = this.modalService.open(ApproveLeaveComponent, {
      size: "lg",
      centered: true,
      backdrop: "static",
      backdropClass: "customBackdrop",
    });
    modalRef.componentInstance.selectedRowData = leaveData;
    modalRef.componentInstance.visibleButton = leaveType;
    modalRef.result.then(() => {
      this.refreshData = true;
    });
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
  // isCancelVisible(e: any) {
  //   let leaveStatusId = e.row.data.LeaveStatusId;
  //   return leaveStatusId != 5;
  // }
  // cancelLeaveRequest(data: any) {
  //   // let cancelLeave = new LeaveDetail();
  //   // cancelLeave.LeaveId = data.LeaveId;
  //   // cancelLeave.ManagerId = this.employeeProfile.EmployeeSlno;
  //   // cancelLeave.LeaveStatusId = LEAVE_STATUS_ID.Canceled;
  //   this.leaveService.cancelEmpLeave(data.LeaveId, this.employeeProfile.EmployeeSlno).subscribe((data) => {
  //     if (data) {
  //       this.leaveService.sendUpdate(true);
  //       Swal.fire({
  //         title: "Well done !",
  //         text: "Aww yeah, your leaves are successfully cancelled.",
  //         icon: "success",
  //         confirmButtonColor: "rgb(54, 69, 116)",
  //         confirmButtonText: "Ok",
  //       });
  //     } else {
  //       Swal.fire({
  //         title: "Oops...! Something went Wrong !",
  //         text: "Your leaves are not cancelled.",
  //         icon: "warning",
  //         confirmButtonColor: "rgb(54, 69, 116)",
  //         confirmButtonText: "Ok",
  //       });
  //     }
  //   });
  // }
  // approveLeave(row: any) {
  // }
}