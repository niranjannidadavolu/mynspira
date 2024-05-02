import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Lightbox } from 'ngx-lightbox';
import { LEAVE_STATUS_ID } from 'src/app/core/constants/leave-status.constant';
import { Form16Service, StorageService } from 'src/app/core/services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-view-employee-itr-verification-report',
  templateUrl: './view-employee-itr-verification-report.component.html',
  styleUrls: ['./view-employee-itr-verification-report.component.scss']
})
export class ViewEmployeeItrVerificationReportComponent implements OnInit {

    // @ViewChild('pdfViewerAutoLoad') pdfViewerAutoLoad: any;
    @Input() public employeeData: any;
    isRejectSubmitted: boolean = false;
    isApproveSubmitted: boolean = false;
    isHoldSubmitted: boolean = false;
    pdfSrc: any;
    employeeProfile: any;
    approveForm: FormGroup;

  constructor(
    private form16Service: Form16Service,
    public activeModal: NgbActiveModal,
    private _lightbox: Lightbox,
    private readonly storageService: StorageService,
    private formBuilder: FormBuilder
  ) { 

    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.approveForm = this.formBuilder.group({
      approvedRemarks: new FormControl('')
    });
  }

  get f(){
    return this.approveForm.controls;
  }

  ngOnInit(): void {
  }

  open(): void {
    // open lightbox
    let _albums: any = [];
    const album = {
      src: this.employeeData?.FilePath,
      caption: this.employeeData.ItrNumber,
      thumb: 'assets/images/favicon.png'
   };

   _albums.push(album);
    this._lightbox.open(_albums, 0);
  }
approve(){
  this.approveForm.controls['approvedRemarks'].clearValidators();
  this.approveForm.controls['approvedRemarks'].updateValueAndValidity();
  this.onStatusChange(LEAVE_STATUS_ID.Approved);

}
reject(){
  this.approveForm.controls['approvedRemarks'].setValidators([Validators.required])
  this.approveForm.controls['approvedRemarks'].updateValueAndValidity();
  this.approveForm.markAllAsTouched();
  if(this.approveForm.valid){
    this.onStatusChange(LEAVE_STATUS_ID.Rejected);
  }
}
hold(){
  this.approveForm.controls['approvedRemarks'].clearValidators();
  this.approveForm.controls['approvedRemarks'].updateValueAndValidity();
  this.onStatusChange(LEAVE_STATUS_ID.OnHold);
}
onStatusChange(StatusID: any){
 
  Swal.fire({
    title:  `Are you sure want to ${StatusID == LEAVE_STATUS_ID.Approved ? 'Approve': StatusID == LEAVE_STATUS_ID.Rejected ? 'Reject': 'Hold'}? \n ( ${this.employeeData.ItrNumber} )`,
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
        EmployeeSlno: this.employeeData.EmployeeSlno,
        ItrId: this.employeeData.ItrId,
        ApprovedBy: this.employeeProfile.EmployeeSlno,
        ApprovedRemarks: this.approveForm.value.approvedRemarks
      }
  this.form16Service.updateITRApprovalStatus(obj).subscribe((result: any) => {
    if (result) {
      this.activeModal.close(result);
      this.isApproveSubmitted = false;
      this.isRejectSubmitted = false;
      this.isHoldSubmitted = false;
       Swal.fire({
         title: 'Well done !',
         text: `Aww yeah, ITR was ${StatusID == LEAVE_STATUS_ID.Approved ? 'Approved': StatusID == LEAVE_STATUS_ID.Rejected ? 'Rejected': 'Hold'} successfully`,
         icon: 'success',
         confirmButtonColor: 'rgb(54, 69, 116)',
         confirmButtonText: 'Ok'
       });
     }
     else {
       Swal.fire({
         title: 'Oops...! Something went Wrong !',
         text: `ITR was not ${StatusID == LEAVE_STATUS_ID.Approved ? 'Approved': StatusID == LEAVE_STATUS_ID.Rejected ? 'Rejected': 'Hold'}.`,
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
