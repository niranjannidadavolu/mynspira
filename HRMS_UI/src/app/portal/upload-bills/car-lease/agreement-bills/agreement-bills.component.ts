import { Component, OnInit, ViewChild } from '@angular/core';
import { ModalDismissReasons, NgbModal, NgbModalOptions } from '@ng-bootstrap/ng-bootstrap';
import { DxFileUploaderComponent } from 'devextreme-angular';
import { finalize } from 'rxjs/operators';
import { CalLeaseAgreementBill } from 'src/app/core/models/carlease/carlease-agreementbill.model';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { StorageService } from 'src/app/core/services';
import { CarLeaseService } from 'src/app/core/services/carlease';
// import { CarLeaseService } from 'src/app/core/services/carlease';
import Swal from 'sweetalert2';
import { saveAs as importedSaveAs } from 'file-saver';
import { UploadAgreementBillsComponent } from './upload-agreement-bills/upload-agreement-bills.component';

@Component({
  selector: 'app-agreement-bills',
  templateUrl: './agreement-bills.component.html',
  styleUrls: ['./agreement-bills.component.scss']
})
export class CarLeaseAgreementBillsComponent implements OnInit {
  @ViewChild('fileUploader') fileUploaderRef: DxFileUploaderComponent | undefined;

  isSubmitted: boolean;
  processing: boolean;
  modalOptions: NgbModalOptions;
  closeResult: string;
  agreementBills: any[];
  retryButtonVisible: boolean;
  uploadedImage: string | ArrayBuffer | null | undefined;
  fileData: FileUpload | undefined;
  empSLNo: any;

  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  billNorules: any;
  billDaterules: any;
  format: { type: string; format: string; };
  constructor(private readonly carLeaseService: CarLeaseService,
    private readonly modalService: NgbModal,
    private readonly storageService: StorageService) {
    this.isSubmitted = false;
    this.retryButtonVisible = false;
    this.processing = false;
    this.agreementBills = []
    this.modalOptions = {
      backdrop: 'static',
      backdropClass: 'customBackdrop',
      size: 'lg'
    }
    this.closeResult = '';
    this.format = { type: "date", format: "dd-MMM-yyyy" };
    let employeeProfile = JSON.parse(this.storageService.get('EmployeeProfile', 1));
    this.empSLNo = employeeProfile.EmpSLNo;
  }

  ngOnInit(): void {
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 14 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
    this.billNorules = { required: true };
    this.billDaterules = { required: true };
    this.getCarLeaseAgreementBills();
  }

  getCarLeaseAgreementBills = () => {
    this.processing = false;

    this.carLeaseService.getCarLeaseAgreementBills(this.empSLNo).subscribe((data: any) => {
      if (data) {
        
        this.agreementBills = data;
      }
      else {
        this.agreementBills = [];
      }
      this.processing = true;
      //this.agreementBills = [{"EmpCarLeasedDTSLNo":6974,"Salary_Voucher":"SALARY","MonthName":"FEBRUARY-2023","ToBePaid":20000,"Paid":0,"Balance":20000,"BillNo":0,"BillDate":null,"FileData":null,"FileImage":null,"FilePath":"","BillCopy":null,"BillCopyName":null,"Remarks":"","IsApproved":0,"MonthSlNo":200,"EmployeeSlno":0,"ApprovalStatus":"PENDING"},{"EmpCarLeasedDTSLNo":7473,"Salary_Voucher":"SALARY","MonthName":"MARCH-2023","ToBePaid":20000,"Paid":0,"Balance":20000,"BillNo":0,"BillDate":null,"FileData":null,"FileImage":null,"FilePath":"","BillCopy":null,"BillCopyName":null,"Remarks":"","IsApproved":0,"MonthSlNo":201,"EmployeeSlno":0,"ApprovalStatus":"PENDING"}];
    });
  }

  // onEditorPreparing(e: any) {
  //   if (e.dataField === 'Salary_Voucher' && e.parentType === 'dataRow') {
  //     e.editorOptions.disabled = true;    
  //   }
  //   if (e.dataField === 'MonthName' && e.parentType === 'dataRow') {
  //     e.editorOptions.disabled = true;
  //   }
  //   if (e.dataField === 'ToBePaid' && e.parentType === 'dataRow') {
  //     e.editorOptions.disabled = true;
  //   }
  //   if (e.dataField === 'Paid' && e.parentType === 'dataRow') {
  //     e.editorOptions.disabled = true;
  //   }
  //   if (e.dataField === 'Balance' && e.parentType === 'dataRow') {
  //     e.editorOptions.disabled = true;
  //   }
  //   if (e.dataField === 'ApprovalStatus' && e.parentType === 'dataRow') {
  //     e.editorOptions.disabled = true;
  //   }
  //   if (e.dataField === 'BillCopy' && e.parentType === 'dataRow') {
  //     e.editorOptions.disabled  = true;
  //     e.editorOptions.visible=false;
  //   }
  //   if (e.dataField === 'FileData' && e.parentType === 'dataRow') {
  //     e.editorOptions.visible=true;
  //   }
  //   if (e.dataField === 'BillNo' && e.parentType === 'dataRow') {
  //     e.editorOptions.maxLength = 9;
  //   }    
  // }

  // onClick(e: any): void {
  //   if (this.fileUploaderRef) {
  //     const fileUploaderInstance = this.fileUploaderRef.instance;
  //     // @ts-ignore
  //     // tslint:disable-next-line:prefer-for-of
  //     for (let i = 0; i < fileUploaderInstance._files.length; i++) {
  //       // @ts-ignore
  //       delete fileUploaderInstance._files[i].uploadStarted;
  //     }
  //     // @ts-ignore
  //     fileUploaderInstance.upload();
  //   }
  // }

  // onValueChanged(e: any): void {
  //   const reader: FileReader = new FileReader();
  //   this.fileData = new FileUpload();
  //   this.fileData.fileName = e.value[0].name;
  //   this.fileData.fileSize = e.value[0].size;
  //   this.fileData.fileType = e.value[0].type;
  //   this.fileData.lastModifiedTime = e.value[0].lastModified;
  //   this.fileData.lastModifiedDate = e.value[0].lastModifiedDate;
  //   this.fileData.fileAsBase64 = '';
  //   reader.onload = (args) => {

  //     if (args.target !== undefined && args.target !== null) {
  //       this.uploadedImage = args.target.result;
  //     }
  //   };
  //   reader.readAsDataURL(e.value[0]); // convert to base64 string
  // }
  // saveBillData(data: any) {

  //   data.data.FileImage = this.uploadedImage;
  //   data.data.FileData = this.fileData;
  // }

  // saveData() {
  //   ////
  //   this.isSubmitted = true;
  //   this.agreementBills.forEach(element => {
  //     element.EmployeeSlno = this.empSLNo;
  //     element.BillCopy = '';
  //     element.BillCopyName = '';
  //   });

  //   let requestData= this.agreementBills.filter(item=>item.FileData!=null && item.BillNo>0 );
  //   if(requestData.length==0)
  //   {
  //     Swal.fire({
  //       title: 'Oops...!',
  //       text: 'Please Upload Car Lease Agreement(s) Files.',
  //       icon: 'warning',
  //       confirmButtonColor: 'rgb(54, 69, 116)',
  //       confirmButtonText: 'Ok'
  //     }).then(()=>{
  //       this.isSubmitted = false;
  //     });
  //     return;
  //   }

  //   this.carLeaseService.uploadAgreementBills(this.agreementBills)
  //     .pipe(finalize(() => this.isSubmitted = false))
  //     .subscribe((data: any) => {
  //       if (data) {
  //         Swal.fire({
  //           title: 'Well done !',
  //           text: 'Aww yeah, Car Lease Agreement(s) are successfully saved.',
  //           icon: 'success',
  //           confirmButtonColor: 'rgb(54, 69, 116)',
  //           confirmButtonText: 'Ok'
  //         }).then(() => {
  //           this.getCarLeaseAgreementBills();
  //         });
  //       }
  //       else {
  //         Swal.fire({
  //           title: 'Oops...! Something went Wrong !',
  //           text: 'Car Lease Agreement(s)  are not Saved.',
  //           icon: 'warning',
  //           confirmButtonColor: 'rgb(54, 69, 116)',
  //           confirmButtonText: 'Ok'
  //         }).then(()=>{
  //           this.isSubmitted = false;
  //         });
  //         this.agreementBills = data;
  //       }
  //     });
  // }

  // cancelData(){
  //   this.getCarLeaseAgreementBills();
  // }

  // onUploaded(e: any, cellInfo: any): void {

  //   cellInfo.setValue('images/employees/' + e.request.responseText);
  //   this.retryButtonVisible = false;
  // }

  downloadFile(e: any) {
    let billCopy = e.row.data.BillCopy
    this.carLeaseService.downloadFile(billCopy)
      .pipe(finalize(() => this.isSubmitted = false))
      .subscribe((data: any) => {
        importedSaveAs(data, e.row.data.BillCopyName);
      });
  }
  uploadAgreementBill(event: any) {
    
    const modalRef = this.modalService.open(UploadAgreementBillsComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = event;
    modalRef.result.then((result) => {
      this.getCarLeaseAgreementBills();
    },
      (reason) => {

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
