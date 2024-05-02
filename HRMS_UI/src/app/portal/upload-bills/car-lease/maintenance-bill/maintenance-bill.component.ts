import { Component, OnInit } from '@angular/core';
import { EmployeeService, StorageService } from 'src/app/core/services';
import { CarLeaseService } from 'src/app/core/services/carlease';
import { finalize } from 'rxjs/operators';
import Swal from 'sweetalert2';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { saveAs as importedSaveAs } from 'file-saver';
import { UploadNewBillComponent } from './upload-new-bill/upload-new-bill.component';
@Component({
  selector: 'app-maintenance-bill',
  templateUrl: './maintenance-bill.component.html',
  styleUrls: ['./maintenance-bill.component.scss']
})
export class MaintenanceBillComponent implements OnInit {
  profile: any;
  loggedInUser: any;
  processing: boolean;
  approvedBills: any;
  pendingBills: any;
  isTotalAmount: boolean;

  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  constructor(
    private readonly storageService: StorageService,
    private readonly employeeService: EmployeeService,
    private readonly carLeaseService: CarLeaseService,
    private readonly modalService: NgbModal) {
    this.isTotalAmount = false;
    this.processing = false;
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.getMyProfile();
    this.getPendingBills();
    this.getCarLeaseApprovedBills();
    this.downloadFile = this.downloadFile.bind(this);
  }
  ngOnInit(): void {
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 14 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
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
  currencyTemplate(props: any): string {
    return '<span>₹' + props.Amount.toFixed(2) + '</span>';
  }
  getCarLeaseApprovedBills() {
    this.processing = true;
    this.approvedBills = [];
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.carLeaseService.getApprovedBills(employeeSlno).pipe(finalize(() => this.processing = false)).subscribe((data: any) => {
      if (data.length) {
        this.approvedBills = data;
        this.isTotalAmount = data[0].TotalAmount > 0;
      }
    });
  }

  getPendingBills() {
    this.processing = true;
    this.pendingBills = [];
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.carLeaseService.getPendingBills(employeeSlno).pipe(finalize(() => this.processing = false)).subscribe((data: any) => {
      if (data) {
        
        this.pendingBills = data;
      }
    });
  }

  deleteSelectedBill(event: any) {

    let rowData = event.data;
    let recordId = rowData.RecordId;
    this.carLeaseService.deleteMaintenenceBill(recordId).subscribe((data: any) => {
      if (data) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Car Lease Manintenence Bill Is Successfully Deleted.',
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
          text: 'Car Lease Manintenence Bill Is Not Deleted.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    });
  }

  uploadNewBill() {
    const modalRef = this.modalService.open(UploadNewBillComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.result.then(() => {
      this.getPendingBills();
    }).catch(() => {
      this.getPendingBills();
    });
  }

  downloadFile(e: any) {
    this.processing = true;
    let filePath = e.row.data.FilePath;
    this.carLeaseService.downloadFile(filePath)
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
}
