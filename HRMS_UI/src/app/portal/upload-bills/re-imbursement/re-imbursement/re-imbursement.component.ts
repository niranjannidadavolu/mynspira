import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { EmployeeService, ReimbursementService, StorageService } from 'src/app/core/services';
import { finalize } from 'rxjs/operators';
import Swal from 'sweetalert2';
import { UploadBillComponent } from '../upload-bill/upload-bill.component';
import { commonMethods } from 'src/app/core/common/common.static';
import { saveAs as importedSaveAs } from 'file-saver';
@Component({
  selector: 'app-re-imbursement',
  templateUrl: './re-imbursement.component.html',
  styleUrls: ['./re-imbursement.component.scss']
})
export class ReImbursementComponent implements OnInit {
  breadCrumbItems!: Array<{}>;
  profile: any;
  loggedInUser: any;
  processing: boolean;
  pendingBills: any;
  approvedBills: any;
  enableUploadButton: boolean;
  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  inrCurrency: any = { format: 'C2', currency: 'INR' };
  format: any;
  constructor(
    private readonly storageService: StorageService,
    private readonly employeeService: EmployeeService,
    private readonly reImbursementService: ReimbursementService,
    private readonly modalService: NgbModal) {
     
    this.enableUploadButton = false;
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Re-Imbursement', active: true }
    ];
    this.processing = false;
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.getMyProfile();
    this.deleteSelectedBill = this.deleteSelectedBill.bind(this);
    this.downloadFile = this.downloadFile.bind(this);
    this.format = { format: 'C2', currency: 'INR' };
  }
  ngOnInit(): void {
    this.filterSettings = { type: 'Menu' };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
    this.pageSettings = { pageSize: 14 };
    this.getPendingBills();
    this.getApprovedBills();
  }
  customizeText(e: any) {
    return commonMethods.ConvertToIndianRupee(e.value);
  };
  isCloneIconDisabled(e: any) {
    return false;
  }
  deleteSelectedBill(event: any) {
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.isConfirmed) {
        let recordId = event.row.data.RecordId;
        this.reImbursementService.deleteReimbursementBill(recordId).pipe(finalize(() => this.processing = false)).subscribe((data: any) => {
          if (data) {
            if (data) {
              Swal.fire({
                title: 'Well done !',
                text: 'Aww yeah, Re-Imbursement Bill was Successfully Deleted.',
                icon: 'success',
                confirmButtonColor: 'rgb(54, 69, 116)',
                confirmButtonText: 'Ok'
              }).then((result) => {
                this.getPendingBills();
              });
            }
            else {
              Swal.fire({
                title: 'Oops...! Something went Wrong !',
                text: 'Re-Imbursement Bill Is Not Deleted.',
                icon: 'warning',
                confirmButtonColor: 'rgb(54, 69, 116)',
                confirmButtonText: 'Ok'
              });
            }
          }
        });
      }
    })
  }
  downloadFile(e: any) {
    let billCopy = e.row.data.FilePath;
    this.reImbursementService.downloadFile(billCopy)
      .pipe(finalize(() => this.processing = false))
      .subscribe((data: any) => {
        importedSaveAs(data, e.row.data.FileName);
      });
  }
  showActionButton(e: any) {
    if (e.row.data.Status === "PENDING") {
      return true;
    }
    else if (e.row.data.Status === "CANCELLED") {
      return false;
    }
    else {
      return false;
    }
  }
  currencyTemplate(props: any): string {
    
    return '<span>₹' + props.Amount.toFixed(2) + '</span>';
  }
  getPendingBills() {
    this.processing = false;
    let employeeSlno = this.profile.EmployeeSlno;
    this.pendingBills = [];
    this.reImbursementService.getPendingBills(employeeSlno).pipe(finalize(() => this.processing = false)).subscribe((data: any) => {
      if (data) {
        this.pendingBills = data;
      }
    });
  }
  getApprovedBills() {
    this.processing = false;
    let employeeSlno = this.profile.EmployeeSlno;
    this.approvedBills = [];
    this.reImbursementService.getApprovedBills(employeeSlno).pipe(finalize(() => this.processing = false)).subscribe((data: any) => {
      if (data) {
        this.approvedBills = data;
        let firstData = data[0];
        if(firstData){
          this.enableUploadButton = firstData.TotalAmount > 0;
        }
      }
    })
  }
  getMyProfile() {
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.profile = JSON.parse(this.storageService.get('EmployeeProfile', 1));
    if (!this.profile) {
      this.employeeService.getMyprofile(employeeSlno).subscribe(data => {
        this.profile = data;
      });
    }
  }
  uploadNewBill() {
    const modalRef = this.modalService.open(UploadBillComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.result.then(() => {
      this.getPendingBills();
    }).catch(() => {
      this.getPendingBills();
    });
  }
}
