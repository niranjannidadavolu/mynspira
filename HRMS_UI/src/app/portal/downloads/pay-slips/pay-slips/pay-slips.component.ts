import { Component, OnInit, ViewChild } from '@angular/core';
import { UserInformation } from 'src/app/core/models';
import { EmployeeService, PayslipService, StorageService, Form16Service } from 'src/app/core/services';
import { saveAs as importedSaveAs } from 'file-saver';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import Swal from 'sweetalert2';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { finalize } from 'rxjs/operators';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { UploadItrFileComponent } from './upload-itr-file/upload-itr-file.component';
import { SwiperSliderComponent } from 'src/app/shared/app-components/swiper-slider/swiper-slider.component';
import { LEAVE_STATUS_ID } from 'src/app/core/constants/leave-status.constant';
import { DxDataGridComponent } from 'devextreme-angular';

@Component({
  selector: 'app-pay-slips',
  templateUrl: './pay-slips.component.html',
  styleUrls: ['./pay-slips.component.scss']
})
export class PaySlipsComponent implements OnInit {

  searchTerm: any;
  // bread crumb items
  breadCrumbItems!: Array<{}>;
  loggedInUser: UserInformation;
  myPaySlips: any;
  employeePaySlip: any;
  pdfSrc: any;
  years: any[] = [];
  profile: any;
  taxDocuments: any;
  employeeProfile: any;

  public Collapsed = false;
  public HCollapsed = false;
  public DownCollapsed = false;
  public FilterCollapsed = false;
  public InlineCollapsed = false;
  public BlockCollapsed = false;
  public firstColleaps = false;
  public secondColleaps = false;
  public bothColleaps = false;
  itrList: any = [];
  isUpload: boolean = false;
  @ViewChild(DxDataGridComponent)
  dataGrid!: DxDataGridComponent;
  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  
  constructor(private readonly storageService: StorageService, private employeeService: EmployeeService,
    private readonly paySlipService: PayslipService,
    private readonly form16Service: Form16Service,
    private readonly modalService: NgbModal,
    private fb: FormBuilder) {
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
  }

  ngOnInit(): void {
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 14 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Pay Slips & Form-16', active: true }
    ];

    this.getMyPaySlips();
    this.getTaxDocuments(this.employeeProfile?.PANNo);
    this.getMyITRFiles();
  }
  getMyPaySlips() {
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.paySlipService.getMyPaySlips(employeeSlno?.toString()).subscribe(data => {
      this.myPaySlips = data;
    });
  }

  downloadPayslip(paySlip: any) {
    this.paySlipService.downloadPayslip(paySlip?.Slno).pipe().subscribe(data => {
      let fileName = paySlip?.MonthName + ".pdf";
      importedSaveAs(data, fileName);
    });
  };

  getTaxDocuments(panNumber: any) {
    this.form16Service.getForm16(panNumber).pipe().subscribe(data => {
      this.taxDocuments = data;
    });
  }
  downLoadForm16(taxDocument: any) {
    taxDocument.forEach((item: any) => {
      this.form16Service.downLoadForm16(item).pipe().subscribe(data => {
        let fileName = item.PartId + ".pdf";
        importedSaveAs(data, fileName);
      });
    });
  }
  getMyITRFiles() {
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.form16Service.getMyITRFiles(employeeSlno).pipe().subscribe(data => {
      let checkYear = data.some((s: any) => s.ItrYear == new Date().getFullYear() && (s.StatusId == LEAVE_STATUS_ID.Approved || s.StatusId == LEAVE_STATUS_ID.Pending_For_Approval) );
        this.isUpload = checkYear ?false: true;
      this.itrList = data;
    });
  }
  viewFile(item: any){
    const modalRef = this.modalService.open(SwiperSliderComponent, { size: 'lg', centered: true,keyboard: false, backdrop: 'static', backdropClass: 'customBackdrop' });
    let data = {
      accept: false,
      title: `${item.ItrYear} - ${item.ItrNumber}`,
      attachments: [
        {
          FilePath: item.FilePath
        }
      ]
    }
    modalRef.componentInstance.attchmentmentDetails = data;
    modalRef.result.then(() => {
    },
    (reason) => {
      let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }
  onStatusChange(event: any){
 
    Swal.fire({
      title:  `Are you sure want to cancel? \n ( ${event.ItrNumber} )`,
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        let obj = {
          StatusId: 5,
          EmployeeSlno: event.EmployeeSlno,
          ItrId: event.ItrId,
          ApprovedBy: this.employeeProfile.EmployeeSlno,
          ApprovedRemarks: 'cancelled by employee'
        }
    this.form16Service.updateITRApprovalStatus(obj).subscribe((result: any) => {
      if (result) {
        this.getMyITRFiles();
         Swal.fire({
           title: 'Well done !',
           text: `Aww yeah, ITR was cancelled successfully`,
           icon: 'success',
           confirmButtonColor: 'rgb(54, 69, 116)',
           confirmButtonText: 'Ok'
         });
       }
       else {
         Swal.fire({
           title: 'Oops...! Something went Wrong !',
           text: `ITR was not cancelled.`,
           icon: 'warning',
           confirmButtonColor: 'rgb(54, 69, 116)',
           confirmButtonText: 'Ok'
         });
       }
    });
  }
  })
  
  }
  uploadFile() {
    const modalRef = this.modalService.open(UploadItrFileComponent, { size: 'md', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    // modalRef.componentInstance.selectedRowData = event.row.data;
    modalRef.result.then((result: any) => {
      this.getMyITRFiles();

    },
    (reason: any) => {
      this.getMyITRFiles();

      let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
      
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
}
