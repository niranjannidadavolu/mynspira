import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { StorageService } from 'src/app/core/services';
import { BranchesService } from 'src/app/core/services/masters';
import { FilteringEventArgs } from '@syncfusion/ej2-angular-dropdowns';
import { EmitType } from '@syncfusion/ej2-base';
import { Query } from '@syncfusion/ej2-data';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { ClickEventArgs } from '@syncfusion/ej2-angular-navigations';
import { ExcelQueryCellInfoEventArgs, GridComponent } from '@syncfusion/ej2-angular-grids';
import { Internationalization } from '@syncfusion/ej2-base';

@Component({
  selector: 'app-leave-balance-report',
  templateUrl: './leave-balance-report.component.html',
  styleUrls: ['./leave-balance-report.component.scss']
})
export class LeaveBalanceReportComponent implements OnInit {
  breadCrumbItems: ({ label: string; active?: undefined; } | { label: string; active: boolean; })[];
  @ViewChild('grid') public grid?: GridComponent;
  fields: Object = { text: 'BranchName', value: 'PBranchSLNo' };
  watermarks: string = 'Select Branches';

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

  constructor(private fb: FormBuilder,
    private leaveManagementService: LeaveManagementService,
    private branchService: BranchesService,
    private readonly storageService: StorageService) {
    this.loadingIndicator = { indicatorType: "Shimmer" };
    this.toolbar = ['CsvExport', 'PdfExport'];

    this.filterReportForm = this.fb.group({
      BranchSlno: [null, Validators.required]
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
    this.filterPlaceholder = 'Search Bracnches';
  }

  ngOnInit(): void {
    this.getHrBranches();
  }
  onFiltering: EmitType<FilteringEventArgs> = (e: FilteringEventArgs) => {
    let query: Query = new Query();
    query = (e.text !== '') ? query.where('BranchName', 'contains', e.text, true) : query;
    e.updateData(this.branches, query);
  };

  excelQueryCellInfo(args: any): void {
    if (args.column.field === 'DateOfJoin' || args.column.field === 'LeaveApplicableDate') {
      args.data[args.column.field] = new Date(args.data[args.column.field]);
      args.value = args.data[args.column.field];
    }
  }
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
  getLeaveBalancesReport() {
    this.isSubmitted = true;
    this.filterReportForm.markAsTouched();
    if (this.filterReportForm.invalid) {
      return;
    }

    let searchCriteria = this.filterReportForm.value;
    this.leaveManagementService.getLeaveBalancesReport(searchCriteria).subscribe((res: any) => {
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
