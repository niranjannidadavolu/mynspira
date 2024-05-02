import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { EmployeeService, StorageService } from 'src/app/core/services';
import { BranchesService } from 'src/app/core/services/masters';
import { formatDate } from '@angular/common';
import { FilteringEventArgs } from '@syncfusion/ej2-angular-dropdowns';
import { EmitType } from '@syncfusion/ej2-base';
import { Query } from '@syncfusion/ej2-data';
import { GridComponent } from '@syncfusion/ej2-angular-grids';
import { ClickEventArgs } from '@syncfusion/ej2-angular-navigations';

@Component({
  selector: 'app-employee-reporting-structure',
  templateUrl: './employee-reporting-structure.component.html',
  styleUrls: ['./employee-reporting-structure.component.scss']
})
export class EmployeeReportingStructureComponent implements OnInit {
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
  level1: any;
  level2: any;
  level3: any;
  loadingIndicator: { indicatorType: string; };
  toolbar: string[];

  constructor(private fb: FormBuilder,
    private employeeInformationService: EmployeeService,
    private branchService: BranchesService,
    private readonly storageService: StorageService) {
    this.loadingIndicator = { indicatorType: "Shimmer" };
    this.toolbar = ['ExcelExport', 'PdfExport', 'CsvExport'];
    this.filterReportForm = this.fb.group({
      Branches: [null, Validators.required]
    });
    this.breadCrumbItems = [
      { label: 'Reports' },
      { label: 'Leave Report', active: true }
    ];
    this.filterOptions = {
      type: 'Menu'
    };
    this.level1 = [
      {
        field: 'L1_EmployeeId',
        headerText: 'Employee Id',
        minWidth: 10
      },
      {
        field: 'L1_EmployeeNumber',
        headerText: 'Employee Number',
        minWidth: 10
      },
      {
        field: 'L1_EmployeeName',
        headerText: 'Employee Name',
        minWidth: 10
      }
    ];

    this.level2 = [
      {
        field: 'L2_EmployeeId',
        headerText: 'Employee Id',
        minWidth: 10
      },
      {
        field: 'L2_EmployeeNumber',
        headerText: 'Employee Number',
        minWidth: 10
      },
      {
        field: 'L2_EmployeeName',
        headerText: 'Employee Name',
        minWidth: 10
      }
    ];

    this.level3 = [
      {
        field: 'L3_EmployeeId',
        headerText: 'Employee Id',
        minWidth: 10
      },
      {
        field: 'L3_EmployeeNumber',
        headerText: 'Employee Number',
        minWidth: 10
      },
      {
        field: 'L3_EmployeeName',
        headerText: 'Employee Name',
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
    //frame the query based on search string with filter type.
    query = (e.text !== '') ? query.where('BranchName', 'contains', e.text, true) : query;
    //pass the filter data source, filter query to updateData method.
    e.updateData(this.branches, query);
  };
  dataBound() {
    (this.grid as any).autoFitColumns(['EmployeeId', 'EmployeeNumber', 'EmployeeName', 'BranchName', 'OfficeTypeName']);
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
    this.employeeInformationService.getEmployeeReportingStructure(searchCriteria).subscribe((res: any) => {
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
