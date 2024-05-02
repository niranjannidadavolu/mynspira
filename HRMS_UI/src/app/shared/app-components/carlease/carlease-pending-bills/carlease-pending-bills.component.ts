import { Component, OnInit } from '@angular/core';
import { ModalDismissReasons, NgbModal, NgbModalOptions } from '@ng-bootstrap/ng-bootstrap';
import { StorageService } from 'src/app/core/services';
import { CarLeaseService } from 'src/app/core/services/carlease/carlease.service';
import { CarLeasePendingBillsUploadComponent } from '../pending-bills-upload/carlease-pending-bills-upload.component';
import Swal from 'sweetalert2';

@Component({
  selector: 'carlease-pending-bills',
  template: ''
})
export class CarLeasePendingBillsComponent implements OnInit {
  pendingBills: any[];
  processing: boolean;
  modalOptions: NgbModalOptions;
  closeResult: string;
  userInformation: any;

  constructor(private readonly carLeaseService: CarLeaseService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal) {
      
    this.userInformation = JSON.parse(this.storageService.get('LoggedInUser',1));
    this.processing = false;
    this.pendingBills = [];
    this.modalOptions = {
      backdrop: 'static',
      backdropClass: 'customBackdrop',
      size: 'lg'
    }
    this.closeResult = '';
  }

  ngOnInit(): void {
    this.getPendingBills();
  }

  getPendingBills() {
    this.processing = false;
    this.carLeaseService.getPendingBills(this.userInformation.EmployeeSlno).subscribe((data: any) => {
      if (data) {
        this.pendingBills = data;
      }
      this.processing = true;
    });
  }

  loadPendingItems() {
    this.getPendingBills();
  }

  uploadNewBill() {
    this.modalService.open(CarLeasePendingBillsUploadComponent, { size: 'lg',centered: true, backdrop: 'static', backdropClass: 'customBackdrop' }).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
      this.getPendingBills();
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }

  getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }

  deleteSelectedBill(event:any)
  {
    
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
      else
      {
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
}
