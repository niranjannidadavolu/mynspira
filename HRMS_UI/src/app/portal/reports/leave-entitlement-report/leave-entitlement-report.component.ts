import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { StorageService } from 'src/app/core/services';
import { BranchesService } from 'src/app/core/services/masters';
import { formatDate } from '@angular/common';
import { FilteringEventArgs } from '@syncfusion/ej2-angular-dropdowns';
import { EmitType } from '@syncfusion/ej2-base';
import { Query } from '@syncfusion/ej2-data';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { GridComponent } from '@syncfusion/ej2-angular-grids';
import { ClickEventArgs } from '@syncfusion/ej2-navigations';

@Component({
  selector: 'app-leave-entitlement-report',
  templateUrl: './leave-entitlement-report.component.html',
  styleUrls: ['./leave-entitlement-report.component.scss']
})
export class LeaveEntitlementReportComponent implements OnInit {
  breadCrumbItems: ({ label: string; active?: undefined; } | { label: string; active: boolean; })[];
  @ViewChild('grid')
  public grid: GridComponent | undefined;
  fields: Object = { text: 'BranchName', value: 'PBranchSLNo' };
  watermarks: string = 'Select Branches';
  format: any;
  filterReportForm: FormGroup;
  plColumns: any = [];
  sickColumns: any = [];
  casualColumns: any = [];
  minDate: any;
  toMinDate: any;
  branches: any[] = [];
  employeeProfile: any;
  isSubmitted: boolean = false;
  leaveBalancesReport: any;
  maxDate: any;
  mode: string;
  popHeight: string = '350px'
  filterPlaceholder: string;
  filterOptions: { type: string; };
  level3: any;
  level2: any;
  level1: any;
  toolbar: any;
  loadingIndicator: { indicatorType: string; };
  today: Date = new Date(new Date().toDateString());
  weekStart: Date = new Date(new Date(new Date().setDate(new Date().getDate() - (new Date().getDay() + 7) % 7)).toDateString());
  weekEnd: Date = new Date(new Date(new Date().setDate(new Date(new Date().setDate((new Date().getDate() - (new Date().getDay() + 7) % 7))).getDate() + 6)).toDateString());
  monthStart: Date = new Date(new Date(new Date().setDate(1)).toDateString());
  monthEnd: Date = this.today;
  lastStart: Date = new Date(new Date(new Date(new Date().setMonth(new Date().getMonth() - 1)).setDate(1)).toDateString());
  lastEnd: Date = this.today;
  yearStart: Date = new Date(new Date(new Date().setDate(new Date().getDate() - 365)).toDateString());
  yearEnd: Date = this.today;
  

  constructor(
    private fb: FormBuilder,
    private leaveManagementService: LeaveManagementService,
    private branchService: BranchesService,
    private readonly storageService: StorageService
  ) { 
    this.loadingIndicator = { indicatorType: "Shimmer" };
    this.filterReportForm = this.fb.group({
      BranchSlno: [null, Validators.required],
    });
    this.breadCrumbItems = [
      { label: 'Reports' },
      { label: 'Leave Entitlement Report', active: true }
    ];
    this.filterOptions = {
      type: 'Menu'
    };
    this.toolbar = ['ExcelExport', 'PdfExport', 'CsvExport'];
    this.format = { type: "date", format: "dd-MMM-yyyy" };
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
      }
    ];
    if (this.grid) {
      this.grid.frozenColumns = 4;
    }
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.mode = 'CheckBox';
    this.filterPlaceholder = 'Search Bracnches';
  }

  ngOnInit(): void {
    this.getHrBranches();
    this.getEmployeeLeaveReport();
  }
  onFiltering: EmitType<FilteringEventArgs> = (e: FilteringEventArgs) => {
    let query: Query = new Query();
    query = (e.text !== '') ? query.where('BranchName', 'contains', e.text, true) : query;
    e.updateData(this.branches, query);
  };
  selectAllForDropdownItems(items: any[]) {
    let allSelect = (items: any[]) => {
      items.forEach(element => {
        element['selectedAllGroup'] = 'selectedAllGroup';
      });
    };

    allSelect(items);
  }
  getHrBranches() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.branchService.getHrBranches(employeeSlno).subscribe((res: any) => {
      this.branches = res;
    })
  }

  getEmployeeLeaveReport() {
    this.isSubmitted = true;
    
    this.filterReportForm.markAsTouched();
    if (this.filterReportForm.invalid) {
      return;
    }
    
    let searchCriteria = this.filterReportForm.value;
    // searchCriteria.FromDate = this.employeeProfile.PayrollMonthFrom;
    // searchCriteria.ToDate = this.employeeProfile.PayrollMonthTo;
    this.leaveManagementService.getEmployeeLeaveEntitlementReport(searchCriteria).subscribe((res: any) => {
      this.isSubmitted = false;
      this.leaveBalancesReport = res;
    })
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
}
