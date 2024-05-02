import { Component, Input, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Lightbox } from 'ngx-lightbox';
import { EmployeeVerificationService, StorageService } from 'src/app/core/services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-view-employee-verification-report',
  templateUrl: './view-employee-verification-report.component.html',
  styleUrls: ['./view-employee-verification-report.component.scss']
})
export class ViewEmployeeVerificationReportComponent implements OnInit, OnDestroy {
  // @ViewChild('pdfViewerAutoLoad') pdfViewerAutoLoad: any;
  @Input() public employeeData: any;
  isRejectSubmitted: boolean = false;
  isApproveSubmitted: boolean = false;
  isHoldSubmitted: boolean = false;
  pdfSrc: any;
  employeeProfile: any;
  approveForm: FormGroup;
  
  constructor(
    private employeeVerificationService: EmployeeVerificationService,
    public activeModal: NgbActiveModal,
    private _lightbox: Lightbox,
    private readonly storageService: StorageService,
    private formBuilder: FormBuilder
  ) { 
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.approveForm = this.formBuilder.group({
      approvedRemarks: new FormControl(''),
      lockBankDetails: new FormControl(0)
    });
  }
get f(){
  return this.approveForm.controls;
}
    ngOnInit(): void {
      this.showPDF();
      
    }
    ngOnDestroy(): void {
      //Called once, before the instance is destroyed.
      //Add 'implements OnDestroy' to the class.
      this.activeModal.dismiss();
    }
    showPDF() {
      this.pdfSrc = this.employeeData.id_verification_report;
      //this.pdfSrc = "https://s3.ap-south-1.amazonaws.com/equalinfradeploymentbuil-eq00idvreports3bucket00p-1q0sxav2ne9f6/51182c20-8c31-42f4-880e-27561799837b.pdf?X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCmFwLXNvdXRoLTEiRzBFAiEA1Ghy46PrDuX%2Fcqpl%2BlZ4C6si10zCp3QxDrZnl6P3OGkCIEIxMeQKE3yt4sOMUAO8bK5ggb%2BrINzWsJY5oyvpmwGqKrkFCJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMzgwNDk1NDMzMTM2Igylyr5X9Q9wDiidohAqjQXLxJ8tyQdM9d3GdYlAKdILiIUYg66hDTmnCzMYBe5Av1VmLxdOiNbp%2BGzAxZ8R6xUKZpzOJpf7CZalsGHdTOnjgtubIpz%2BSpV2rYdODtPIlzsdviOrLOImNAW7VT7SpV7zkKm0d9zWhuFyJ9Qj3v%2FRzwTHtQ8XuUVpj1YGM91WzAS2R4VyvZNy1z2zSaCQiw3XYdCmiYr9iz7IrqHrkurzn%2FCqJkuHBkfbOsQdrD0Jn2nHZL7hU7uAy0%2Fcb6mvD7RoHjgeyCzzoyXqmsmqBOKtKlTDu2wo1%2Fx4nOhSogRvR0zccMGlk2iiJUhDu6rbrV4PXQF5OfMxynOrF8NVGC%2F8rkPHUBN0tuMh%2FnXeDWO6s3VKOF%2FPOlNG7LuGdpOH3SaE5X64fTvBxqNPzurFQxH1V9osHS%2FiFXRfQo%2FlnP52L7Lox9LbB%2BxuVrfli5yTJBHRgCI%2BAshqukl1HZjNhAumQqC6UpKry6dOjiwbGbPf3PKDuF3ysIWKUXf6R0Nz%2Fw6wgdKB3QhJpJnOerwlAatHU%2BfmOeGjYAqMCzhg8Pvrq5VtKVOFJmkGbCCbdW7H2zz55EVc7Dj%2F8QWkFzNjc6rQBf6VzNQQfdg8LSyF00pCPbkPJT6500VKxB9p2YeRsXoDJjmJ9%2BFnHLtDQZ9sZtAoAKqCNxrtXuzFJA95Vvs2MWZ46aTJ9l5a1lxQGOr9C9l72%2FgLyMBpFiLUh9Tz5m0gJOTPea4zWDNP63jDKKHhe75x68gIYZ2KR%2F9qOsKQb8YIfpLSHAhETrM8A7WM8MXULYOHlURP8WJcyrx6Sy2hUgz6leSeusGNvGSyT8T6VrB7%2FGMJMj7VigRtmLuWY4vuSPdGYBdBqqenUZP4zTDLgq6lBjqoAUvZd4BMMAvj38TraAe7temHLMKa4jsY%2Bjrk5O3gY9gtUlPmuQyu7%2BCMNLDyaI%2F%2BsR3yCAOndcyAuBP%2Fvo5dnkYElLnkRBpVCbpJmPv6yeAIAmgrGTPVpXjV%2BHBeKaz9gl7fS0agXtMt01P%2B3j%2F6rGfoE3ONGY3LU%2FGRe5YOcg4WM4WnMi1JMr6spEr4BlZzq1qUU9joUcTjJZd1%2BXCG0Y00AKfB5iZTag%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230710T070036Z&X-Amz-SignedHeaders=host&X-Amz-Expires=600&X-Amz-Credential=ASIAVRF2LRWYMMW4YFYF%2F20230710%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Signature=68c893e6b848a0a0cd20e44245a543fceeabfd7d7620c10143a6d5972a85552d";
      //this.pdfViewerAutoLoad.pdfSrc = encodeURIComponent(this.employeeData.id_verification_report);
    }
    open(): void {
      // open lightbox
      let _albums: any = [];
      const album = {
        src: this.employeeData?.AadharPath,
        caption: this.employeeData.Employee.AadharNo,
        thumb: 'assets/images/favicon.png'
     };

     _albums.push(album);
      this._lightbox.open(_albums, 0);
    }
  approve(){
    this.approveForm.controls['approvedRemarks'].clearValidators();
    this.approveForm.controls['approvedRemarks'].updateValueAndValidity();
    this.onStatusChange(1);
  }
  reject(){
    this.approveForm.controls['approvedRemarks'].setValidators([Validators.required])
    this.approveForm.controls['approvedRemarks'].updateValueAndValidity();
    this.approveForm.markAllAsTouched();
    if(this.approveForm.valid){
      this.onStatusChange(2);
    }
  }
  hold(){
    this.approveForm.controls['approvedRemarks'].clearValidators();
    this.approveForm.controls['approvedRemarks'].updateValueAndValidity();
    this.onStatusChange(3);
  }
  onLockBankDetails(event: any){
    Swal.fire({
      title: event.target.checked ? 'Are you sure want to lock bank details' : 'Are you sure want to unlock bank details',
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        this.approveForm.controls['lockBankDetails'].patchValue(event.target.checked ? 1 : 0);
      }
    })
  }
  onStatusChange(StatusID: any){
    Swal.fire({
      title:  `Are you sure want to ${StatusID == 1 ? 'Approve': StatusID == 2 ? 'Reject': 'Hold'}? \n ( ${this.employeeData.Employee.EmployeeName.toLowerCase()} )`,
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        StatusID == 1 ?  this.isApproveSubmitted = true : false;
        StatusID == 2 ?  this.isRejectSubmitted = true : false;
        StatusID == 3 ?  this.isHoldSubmitted = true : false;
        let obj = {
          StatusId: StatusID,
          EmployeeSlno: this.employeeData.Employee.EmployeeSlno,
          IdempotencyId: this.employeeData.Employee.IdempotencyId,
          ApprovedBy: this.employeeProfile.EmployeeSlno,
          ApprovedRemarks: this.approveForm.value.approvedRemarks,
          LockBankDetails: StatusID == 1 ? this.approveForm.value.lockBankDetails : 0
        }
    this.employeeVerificationService.updateEmpployeeVerificationStatus(obj).subscribe((result: any) => {
      this.isApproveSubmitted = false;
      this.isRejectSubmitted = false;
      this.isHoldSubmitted = false;
      if (result) {
        this.activeModal.close(result);
         Swal.fire({
           title: 'Well done !',
           text: `Aww yeah, row data was ${StatusID == 1 ? 'Approved': StatusID == 2 ? 'Rejected': 'Hold'} successfully`,
           icon: 'success',
           confirmButtonColor: 'rgb(54, 69, 116)',
           confirmButtonText: 'Ok'
         });
       }
       else {
         Swal.fire({
           title: 'Oops...! Something went Wrong !',
           text: `row data was not ${StatusID == 1 ? 'Approved': StatusID == 2 ? 'Rejected': 'Hold'}.`,
           icon: 'warning',
           confirmButtonColor: 'rgb(54, 69, 116)',
           confirmButtonText: 'Ok'
         });
       }
    });
  }
  })
  
  }
}
