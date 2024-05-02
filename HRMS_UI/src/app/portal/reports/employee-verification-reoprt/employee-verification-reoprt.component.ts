import { formatDate } from '@angular/common';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { LEAVE_STATUS_ID } from 'src/app/core/constants/leave-status.constant';
import { EmployeeVerificationService, StorageService } from 'src/app/core/services';
import { BranchesService } from 'src/app/core/services/masters';
import { ReportsService } from 'src/app/core/services/reports/reports.service';
import { ViewEmployeeVerificationReportComponent } from './view-employee-verification-report/view-employee-verification-report.component';
import { GridComponent } from '@syncfusion/ej2-angular-grids';
import { ClickEventArgs } from '@syncfusion/ej2-angular-navigations';

@Component({
  selector: 'app-employee-verification-reoprt',
  templateUrl: './employee-verification-reoprt.component.html',
  styleUrls: ['./employee-verification-reoprt.component.scss']
})
export class EmployeeVerificationReoprtComponent implements OnInit {
  @ViewChild('grid') public grid?: GridComponent;
  breadCrumbItems: ({ label: string; active?: undefined; } | { label: string; active: boolean; })[];
  filterReportForm: FormGroup;
  minDate: any;
  toMinDate: any;
  teamLeaves: any = [];
  branches:  any[] = [];
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
  showFilterRow: boolean;
  showHeaderFilter: boolean;
  applyFilterTypes: any;
  pBranchSlno: any
  currentFilter: string;
  isSubmitted: boolean = false;
  maxDate: any;

  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  toolbar!:string[];
  constructor(
    private fb: FormBuilder,
    private reportsService: ReportsService,
    private branchService: BranchesService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal,
    private readonly employeeVerificationService: EmployeeVerificationService,

  ) {
    this.filterReportForm = this.fb.group({
      fromDate: [new Date()],
      toDate: [new Date()],
      pBranchSlno: [null, Validators.required],
      employeeSLNo: [''],
      statusId: ['']
    });
    this.breadCrumbItems = [
      { label: 'Reports' },
      { label: 'Employee Verification Report', active: true }
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
    this.minDate = new Date(new Date().getFullYear()-1, 11, 26);
    this.maxDate = new Date(new Date().getFullYear(), 11, 25);
    this.toMinDate = new Date();
  }
  get pBranchSlnoControl() {
    return this.filterReportForm.get('pBranchSlno')!;
  }
  ngOnInit(): void {
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
  getHrBranches() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.branchService.getHrBranches(employeeSlno).subscribe((res: any) => {
      this.branches = res;
    })
  }
  getReports() {
    this.isSubmitted = true;
    this.filterReportForm.markAsTouched();
    if(this.filterReportForm.invalid){
      return;
    }
    let obj = this.filterReportForm.getRawValue();
    // obj.fromDate = formatDate(obj.fromDate, 'dd-MM-yyyy', 'en');
    // obj.toDate = formatDate(obj.toDate, 'dd-MM-yyyy', 'en');
    this.reportsService.getEmployeeVerificationReport(obj).subscribe((res) => {
    this.isSubmitted = false;
      this.leaveReports = res;
    })
  }
  getValue(data: any){
    return data.BranchName    
  }
  onChangeBranch(event: any) { 
    let arrayEle = Object.keys(event).map(function(k){return event[k].PBranchSLNo}).join(",");;    
    if (event.length) {
      this.filterReportForm.controls['pBranchSlno'].patchValue(arrayEle);
    } else if (event.length == 0) {
      this.filterReportForm.controls['pBranchSlno'].patchValue("");
    }
  }
  viewDetails(event: any) { 
    this.employeeVerificationService.getVerifiedResult(event.IdempotencyId, event.EmployeeSlno).subscribe(res => {
      if(res.status = "SUCCESS"){
        const modalRef = this.modalService.open(ViewEmployeeVerificationReportComponent, { size: 'xl', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
        let obj = {
          ...res.data,
          AadharPath:res.AadharPath,
          Employee: event
        }
        modalRef.componentInstance.employeeData = obj
        // let helpItem = JSON.parse(JSON.stringify(event));
        // helpItem.FilePath =  'http:'+helpItem.FilePath;
        // const modalRef = this.modalService.open(SwiperSliderComponent, { size: 'lg', centered: true,keyboard: false, backdrop: 'static', backdropClass: 'customBackdrop' });
        // let data = {
        //   accept: false,
        //   title: 'Employee Verified Data',
        //   attachments: [
        //     {
        //       FilePath: res.data.id_verification_report + ".pdf"
        //     }
        //   ]
        // }
        // modalRef.componentInstance.attchmentmentDetails = data;
        modalRef.result.then((data) => {
          if(data){
            this.getReports();
          }
        },
        (reason) => {
          let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
          
        });
      }
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
