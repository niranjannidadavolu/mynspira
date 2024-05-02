import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { commonMethods } from 'src/app/core/common/common.static';
import { UserInformation } from 'src/app/core/models/administration/user-information.model';
import { StorageService } from 'src/app/core/services/helper/storage-service';
import { CarLeaseService } from 'src/app/core/services/carlease';
import { finalize } from 'rxjs/operators';
import { FileUpload } from "src/app/core/models/file-upload/file-upload.model"
import Swal from 'sweetalert2';

@Component({
  selector: 'carlease-pending-bills-upload',
  templateUrl: './carlease-pending-bills-upload.component.html',
  // styleUrls: ['./carlease-pending-bills-upload.component.scss']
})
export class CarLeasePendingBillsUploadComponent implements OnInit ,OnDestroy{
  uploadForm: FormGroup;
  submitted = false;
  userInformation?: UserInformation;
  carLeaseBillNames: any[];
  processing: boolean;
  selectedFiles: any = [];
  fileData: any;
  uploadedImage: string | ArrayBuffer | null | undefined;
  employeeProfile: any;

  constructor(private readonly modalService: NgbModal,
    private formBuilder: FormBuilder,
    private readonly carLeaseService: CarLeaseService,
    private readonly storageService: StorageService,
    public activeModal: NgbActiveModal)
    {
    this.carLeaseBillNames = [];
    this.processing = false;
    this.uploadForm = this.formBuilder.group({      
      carLeaseDetails: this.formBuilder.array([])
    }); 
  }

  ngOnInit(): void {
    this.userInformation = JSON.parse(this.storageService.get('LoggedInUser', 1));
    this.employeeProfile = JSON.parse(this.storageService.get('EmployeeProfile', 1));
    this.getCarLeaseBillNames();
  }
 
  get carLeaseDetails(): FormArray {
    let array = this.uploadForm.controls['carLeaseDetails'] as FormArray;
    return array;
  }

  get f() { return   this.uploadForm.controls; 
     // this.uploadForm.get('carLeaseDetails'); 
    }

  onFileChange(e: any, item: any): void {
    
    const reader: FileReader = new FileReader();
    this.fileData = new FileUpload();
    this.fileData.fileName = e.target.files[0].name;
    this.fileData.fileSize = e.target.files[0].size;
    this.fileData.fileType = e.target.files[0].type;
    this.fileData.lastModifiedTime = e.target.files[0].lastModified;
    this.fileData.lastModifiedDate = e.target.files[0].lastModifiedDate;
    this.fileData.carLeaseSLno = item.value.carLeaseSLno;  
    item.value.file=this.fileData;

    reader.onload = (args) => {      
      if (args.target !== undefined && args.target !== null) {
        this.uploadedImage = args.target.result;
        this.fileData.fileAsBase64 = reader?.result?.toString();;
      }
    };
    reader.readAsDataURL(e.target.files[0]);
    this.selectedFiles.push(this.fileData);    
  }

  onSubmit() {    
    
      const formData = new FormData();
      let index = 0;
      let uploadData = this.carLeaseDetails.value;
      
      uploadData=this.carLeaseDetails.value.filter((item:any)=>item.amount!=null &&item.billDate!=null &&item.billNo!=null && item.file!=null);

      if(uploadData.length==0){        
        return;
      }
      
      uploadData.forEach((element: any) => {
        if (this.userInformation != null && this.userInformation != undefined) {
          element.EmpSLNo = this.userInformation?.EmployeeSlno||0;
          element.UniqueNo = this.employeeProfile?.UniqueNo||0;
          element.PBranchSLNo = this.employeeProfile?.PBranchSLNo||0;
          element.UserSLNo = this.employeeProfile?.UserSLNo||0;          
        }
      });
          this.selectedFiles.forEach((f: any) => {
            formData.append(index.toString(), f);
            index = index + 1;
          }
      );

      formData.append('carBills', JSON.stringify(this.selectedFiles));
      formData.append('CarLeaseBills', JSON.stringify(uploadData));     
      if(this.selectedFiles.length>0)
      {
        this.carLeaseService.UploadCarLeaseMaintenance(formData).subscribe(data => {
          if(data){
            this.activeModal.dismiss('Saved Successfully');
            this.uploadForm.reset();
            Swal.fire({
              title: 'Well done !',
              text: 'Aww yeah, Car Lease Maintenece bills are successfully saved.',
              icon: 'success',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            }).then((result) => {              
            });
          }        
        });        
      }
      else
      {
        Swal.fire({
          title: 'Oops...',
          text: 'Choose at lease one file',
          icon: 'warning',
          confirmButtonText: 'Close',
          showLoaderOnConfirm: true,
          allowOutsideClick: false,
        }).then(() => {
        });
      } 
  }

  openModal(content: any) {
    this.modalService.open(content);
  }

  numberOnly(event: any, index: number): boolean {
    return commonMethods.isNumberKey(event);
  }

  getCarLeaseBillNames = () => {
    this.processing = false;
    this.carLeaseBillNames = [];
    this.carLeaseService.getCarLeaseBillNames()
      .pipe(finalize(() => this.processing = true))
      .subscribe((data: any) => {
        if (data) {
          
          //this.carLeaseBillNames = data;
          data.forEach((item: any) => {
            this.carLeaseDetails.push(this.buildCarLeaseForm(item))
          });
        }
      });
  }

  buildCarLeaseForm(item: any): FormGroup {    
    let formGroup = this.formBuilder.group({
      billName:  item.Name,
      maxAmount: item.Max_Amt, 
      carLeaseSLno:item.CarLeaseSLno,
      amount: [item.Amount, [Validators.required]] ,
      billNo: [item.BillNo, [Validators.required]] ,
      billDate: [item.BillDate, [Validators.required]],
      file:''          
    });
    return formGroup;
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
