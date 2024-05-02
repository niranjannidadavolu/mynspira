import { formatDate } from '@angular/common';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { LEAVE_STATUS_ID } from 'src/app/core/constants/leave-status.constant';
import { StorageService } from 'src/app/core/services';
import { BranchesService } from 'src/app/core/services/masters';
import { ReportsService } from 'src/app/core/services/reports/reports.service';
import { SwiperSliderComponent } from 'src/app/shared/app-components/swiper-slider/swiper-slider.component';
import { Workbook } from 'exceljs';
import { saveAs } from 'file-saver';
import { exportDataGrid } from 'devextreme/excel_exporter';
import { ClickEventArgs } from '@syncfusion/ej2-angular-navigations';
import { GridComponent, SelectionSettingsModel } from '@syncfusion/ej2-angular-grids';
@Component({
  selector: 'app-auto-approval-report',
  templateUrl: './auto-approval-report.component.html',
  styleUrls: ['./auto-approval-report.component.scss']
})
export class AutoApprovalReportComponent implements OnInit {
  breadCrumbItems: ({ label: string; active?: undefined; } | { label: string; active: boolean; })[];
  @ViewChild('grid') public grid?: GridComponent;
  filterReportForm: FormGroup;
  minDate: any;
  toMinDate: any;
  teamLeaves: any = [];
  branches: any = [];
  employeeProfile: any;
  statusList: any = [
    {
      id: LEAVE_STATUS_ID.Pending_For_Approval,
      name: 'Pending For Approval'
    },
    {
      id: LEAVE_STATUS_ID.Approved,
      name: 'Approved'
    }
  ];
  leaveReports: any = [];
  showHeaderFilter: boolean;
  applyFilterTypes: any;
  isSubmitted: boolean = false;
  maxDate: any;
  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  toolbar!:string[];
  public selectionSettings?: SelectionSettingsModel;
  constructor(
    private fb: FormBuilder,
    private reportsService: ReportsService,
    private branchService: BranchesService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal,

  ) {
    
    this.filterReportForm = this.fb.group({
      fromDate: [new Date()],
      toDate: [new Date()],
      pBranchSlno: ['', Validators.required],
      employeeSLNo: [''],
      statusId: ['2']
    });
    this.breadCrumbItems = [
      { label: 'Reports' },
      { label: 'Leave Report', active: true }
    ];
    this.showHeaderFilter = true;
    this.applyFilterTypes = [{
      key: "auto",
      name: "Immediately"
    }, {
      key: "onClick",
      name: "On Button Click"
    }];
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.filterReportForm.controls['employeeSLNo'].patchValue(this.employeeProfile.EmployeeSlno);
    this.minDate = new Date(new Date().getFullYear()-1, 11, 26);
    this.maxDate = new Date(new Date().getFullYear(), 11, 25);
    this.toMinDate = new Date();
  }

  ngOnInit(): void {
    this.selectionSettings = { type: 'Multiple', enableSimpleMultiRowSelection: true };
    this.toolbar = ['ExcelExport', 'PdfExport', 'CsvExport'];
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 14 };
    this.loadingIndicator = { indicatorType: "Shimmer" };
  
    this.getHrBranches();
  }
  changeFromDate(event: any) {
    if (event.selectedDates !== undefined && event.selectedDates.length > 0) {
      let selectedFromDate = event.selectedDates[0];
      this.toMinDate = new Date(selectedFromDate);
      if(formatDate(selectedFromDate, 'dd-MM-yyyy', 'en') > formatDate(this.filterReportForm.value.toDate, 'dd-MM-yyyy', 'en')){
        this.filterReportForm.controls['toDate'].patchValue('');        
      }
    }
  }
  get pBranchSlnoControl() {
    return this.filterReportForm.get('pBranchSlno')!;
  }
  getValue(data: any){
    return data.BranchName    
  }
  getHrBranches() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.branchService.getHrBranches(employeeSlno).subscribe((res) => {
      this.branches = res;
      this.selectAllForDropdownItems(this.branches);

    })
  }
  getLeaveReports() {
    this.filterReportForm.markAsTouched();
    this.isSubmitted = true;
    if(this.filterReportForm.invalid){
      return;
    }
    let obj = this.filterReportForm.getRawValue();
    // obj.fromDate = formatDate(obj.fromDate, 'dd-MM-yyyy', 'en');
    // obj.toDate = formatDate(obj.toDate, 'dd-MM-yyyy', 'en');
    this.reportsService.getAutoApprovalReport(obj).subscribe((res) => {
    this.isSubmitted = false;
      this.leaveReports = res;
    })
  }
onExporting(e: any) {
    const workbook = new Workbook();
    const worksheet = workbook.addWorksheet('Employees');
    exportDataGrid({
      component: e.component,
      worksheet,
      autoFilterEnabled: true,
    }).then(() => {
      workbook.xlsx.writeBuffer().then((buffer) => {
        saveAs(new Blob([buffer], { type: 'application/octet-stream' }),`leave_report_${formatDate(new Date(), 'ddMMyyyyhhmmss', 'en')}.xlsx`);
      });
    });
    e.cancel = true;
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
    let arrayEle = Object.keys(event).map(function(k){return event[k].PBranchSLNo}).join(",");;    
    if (event.length) {
      this.filterReportForm.controls['pBranchSlno'].patchValue(arrayEle);
    } else if (event.length == 0) {
      this.filterReportForm.controls['pBranchSlno'].patchValue(null);
    }
  }
  onChangeStatus(event: any) {
    if (event) {
      this.filterReportForm.controls['statusId'].patchValue(event.id);
    } else {
      this.filterReportForm.controls['statusId'].patchValue('');
    }
  }

  viewFiles(event: any) { 
    if(event.data?.leaveFileUploadReports?.length){
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
