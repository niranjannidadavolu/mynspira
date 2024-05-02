import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { FilteringEventArgs } from '@syncfusion/ej2-angular-dropdowns';
import { GridComponent } from '@syncfusion/ej2-angular-grids';
import { EmployeeService, StorageService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { BranchesService } from 'src/app/core/services/masters';
import { EmitType } from '@syncfusion/ej2-base';
import { Query } from '@syncfusion/ej2-data';

@Component({
  selector: 'app-employee-leave-entitlement',
  templateUrl: './employee-leave-entitlement.component.html',
  styleUrls: ['./employee-leave-entitlement.component.scss']
})
export class EmployeeLeaveEntitlementComponent implements OnInit {
  breadCrumbItems: ({ label: string; active?: undefined; } | { label: string; active: boolean; })[];
  @ViewChild('grid') public grid?: GridComponent;
  branchFields: Object = { text: 'BranchName', value: 'PBranchSLNo' };
  employeeFields: Object = { text: 'EmployeeName', value: 'EmployeeSlno' };
  watermark: any;

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
  loadingIndicator: { indicatorType: string; };
  toolbar: string[];
  employees: any;
  employeeWatermark: string;
  employeeFilterPlaceholder: string;
  constructor(private fb: FormBuilder,
    private leaveManagementService: LeaveManagementService,
    private employeeSevice: EmployeeService,
    private branchService: BranchesService,
    private readonly storageService: StorageService) {
    this.loadingIndicator = { indicatorType: "Shimmer" };
    this.toolbar = ['ExcelExport', 'PdfExport', 'CsvExport'];
    this.employeeWatermark = "Select Employee";
    this.watermark = 'Select Branches';
    this.filterReportForm = this.fb.group({
      BranchSlno: [null, Validators.required],
      EmployeeSlno: [null, Validators.required]
    });
    this.breadCrumbItems = [
      { label: 'Reports' },
      { label: 'Leave Report', active: true }
    ];
    this.filterOptions = {
      type: 'Menu'
    };

    this.casualColumns = [
      {
        field: 'CasualTotalLeaves',
        headerText: 'Total Leaves',
        format: 'N2',
        width: 120,
        textAlign: 'Right',
        minWidth: 10
      },
      {
        field: 'CasualConsumedLeaves',
        headerText: 'Consumed Leaves',
        width: 120,
        format: 'N2',
        textAlign: 'Right',
        minWidth: 10
      },
      {
        field: 'CasualBalanceLeaves',
        headerText: 'Leave Balance',
        width: 120,
        format: 'N2',
        textAlign: 'Right',
        minWidth: 10
      }
    ];

    this.sickColumns = [
      {
        field: 'SickTotalLeaves',
        headerText: 'Total Leaves',
        format: 'N2',
        width: 120,
        textAlign: 'Right',
        minWidth: 10
      },
      {
        field: 'SickConsumedLeaves',
        headerText: 'Consumed Leaves',
        width: 120,
        format: 'N2',
        textAlign: 'Right',
        minWidth: 10
      },
      {
        field: 'SickBalanceLeaves',
        headerText: 'Leave Balance',
        width: 120,
        format: 'N2',
        textAlign: 'Right',
        minWidth: 10
      }
    ];

    this.plColumns = [
      {
        field: 'PrivilegeTotalLeaves',
        headerText: 'Total Leaves',
        format: 'N2',
        width: 120,
        textAlign: 'Right',
        minWidth: 10
      },
      {
        field: 'PrivilegeConsumedLeaves',
        headerText: 'Consumed Leaves',
        width: 120,
        format: 'N2',
        textAlign: 'Right',
        minWidth: 10
      },
      {
        field: 'PrivilegeEncashedLeaves',
        headerText: 'Encashed Leaves',
        width: 120,
        format: 'N2',
        textAlign: 'Right',
        minWidth: 10
      },
      {
        field: 'PrivilegeBalanceLeaves',
        headerText: 'Leave Balance',
        width: 120,
        format: 'N2',
        textAlign: 'Right',
        minWidth: 10
      }
    ];

    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.mode = 'CheckBox';
    this.filterPlaceholder = 'Search Branches';
    this.employeeFilterPlaceholder = 'Search Employees';
  }

  ngOnInit(): void {
    this.getHrBranches();
  }

  getHrBranches() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.branchService.getHrBranches(employeeSlno).subscribe((res: any) => {
      this.branches = res;
    })
  }

  getEmployees() {
    let selectedBranches = this.filterReportForm.value.BranchSlno;
    this.employeeSevice.getEmployeesByBranch(selectedBranches).subscribe((res: any) => {
      this.employees = res;
    })
  }

  onBranchFiltering: EmitType<FilteringEventArgs> = (e: FilteringEventArgs) => {
    let query: Query = new Query();
    query = (e.text !== '') ? query.where('BranchName', 'contains', e.text, true) : query;
    e.updateData(this.branches, query);
  };

  onEmployeeFiltering: EmitType<FilteringEventArgs> = (e: FilteringEventArgs) => {
    let query: Query = new Query();
    query = (e.text !== '') ? query.where('BranchName', 'contains', e.text, true) : query;
    e.updateData(this.branches, query);
  };


  getLeaveBalancesReport() {
    this.isSubmitted = true;
    this.filterReportForm.markAsTouched();
    if (this.filterReportForm.invalid) {
      return;
    }

    let searchCriteria = this.filterReportForm.value;
    // this.leaveManagementService.getLeaveEntitlementReport(employeeSlno).subscribe((res: any) => {
    //   this.isSubmitted = false;
    //   this.leaveBalancesReport = res;
    // })
  }

  deleteMappedEntitlement(data: any) {

  }

}
