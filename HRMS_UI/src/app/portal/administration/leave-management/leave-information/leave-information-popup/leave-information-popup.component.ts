import { LeaveInformationService } from './../../../../../core/services/administration/leave-information.service';
import { Component, Input, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { FlatpickrDirective } from 'angularx-flatpickr';
import { finalize } from 'rxjs/operators';
import { LeaveType } from 'src/app/core/enum/application-enums';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { LeavePolicyInformation } from 'src/app/core/models/leave-management/leave-policy-information';
import { EmployeeService, StorageService } from 'src/app/core/services';
import { LeavePolicyService } from 'src/app/core/services/administration/leave-policy.service';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { LeaveDayTypeService, LeaveTypeService } from 'src/app/core/services/masters';
import Swal from 'sweetalert2';
import { formatDate } from '@angular/common';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { LEAVE_STATUS_ID } from 'src/app/core/constants/leave-status.constant';
import { BranchesService } from 'src/app/core/services/masters';
import { ReportsService } from 'src/app/core/services/reports/reports.service';
import { SwiperSliderComponent } from 'src/app/shared/app-components/swiper-slider/swiper-slider.component';
import { Workbook } from 'exceljs';
import { saveAs } from 'file-saver';
import { exportDataGrid } from 'devextreme/excel_exporter';
import { data } from 'jquery';
@Component({
  selector: 'app-leave-information-popup',
  templateUrl: './leave-information-popup.component.html',
  styleUrls: ['./leave-information-popup.component.scss']
})
export class LeaveInformationPopupComponent implements OnInit , OnDestroy{
  @ViewChild(FlatpickrDirective, { static: false }) fromDate: FlatpickrDirective | undefined;
  @Input() selectedRowData: any;
  leaveForm: FormGroup;
  isSubmitted:any;
  isVerify:any;
  leaveTypes:any=[];
  policies:any=[];
  officeTypeList:any=[];
  employeeProfile: any;
  branchLIst:any=[];
  get f() { return this.leaveForm.controls; }
  constructor(
    public activeModal: NgbActiveModal,
    private readonly leavePolicyService: LeavePolicyService,
    private formBuilder: FormBuilder,
    private  leaveTypeService:LeaveTypeService,
    private branchesService:BranchesService,
    private readonly modalService: NgbModal,
    private leaveInformationService:LeaveInformationService,
    private readonly storageService: StorageService
  ) { 
    this.getAllLeaveTypes();
    this.getleaveInformation();
    this.getOfficeTypes();
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.leaveForm = this.formBuilder.group({
      LeaveInformationID:[],
      LeaveInformationName:['',Validators.required],
      LeaveTypeId:[Validators.required],
      LeavePolicyID:[Validators.required],
      OfficeTypeSlno:[Validators.required],
      PBranchSlno:[],
      StatusID:[1],
      employeeSlno: [this.employeeProfile.EmployeeSlno],
     // CreatedBy: this.employeeProfile.EmployeeSlno
    });
    this.isSubmitted = false;
    this.getleaveInformation();
   
  }

  onLeaveTypeChange  (event:any)
  {
      this.leaveTypeService.getAllLeaveTypes().subscribe((data: any) => {
      this.leaveTypes = data;
    });
  }
  getAllLeaveTypes(){
    this.leaveTypeService.getAllLeaveTypes().subscribe((data: any) => {
      this.leaveTypes = data;
    });
  }
  getleaveInformation() {
    this.leaveInformationService.getALLLeaveInformation().subscribe((data:any) => {
      this.policies = data;
    });
  }

  getOfficeTypes() {
    this.branchesService.GetOfficeType().subscribe((data: any) => {
      this.officeTypeList = data;
    });
  }
  onChangeOfficeType(event: any) {
    let obj = {
      officeTypeSlno:event.OfficeTypeSlno,
      employeeSlno: this.leaveForm.value.employeeSlno
    }
    this.branchesService.GetBranchesByOfcType(obj).subscribe((data: any) => {
      this.branchLIst = data;
    });
  }

  ngOnInit(): void {
    if (this.selectedRowData){
      this.leaveForm.patchValue(this.selectedRowData);
      this.leaveForm.controls['LeaveTypeId'].patchValue(this.selectedRowData.LeaveTypeID);
      this.leaveForm.controls['LeavePolicyID'].patchValue(this.selectedRowData.LeavePolicyID);
    }   
  }
 
  leaveInformationRequest()
  {
   if(this.selectedRowData){
    this.leaveInformationService.updateLeaveInformation(this.leaveForm.value).subscribe((result)=>{
      if(result){
       this.showsucess();
       this. getleaveInformation(); 
      }
      else {
        this.showerror();
      }
    });
   }
   else{
    this.leaveInformationService.savedLeaveInformation(this.leaveForm.value).subscribe((result)=>{
      if(result){
        this.showsucess();
        this.getleaveInformation(); 
       }
       else {
         this.showerror();
       }
    })     
   }
  }
  showsucess(){
    Swal.fire({
      title: 'Well done !',
      text: 'Aww yeah,  Leave Information is successfully saved.',
      icon: 'success',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    }).then(() => {
      this.activeModal.close();
    });
  }
  showerror(){
    Swal.fire({
      title: 'Oops...! Something went Wrong !',
      text: ' Leave Information is not saved.',
      icon: 'warning',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    }).then(() => { });
    this.activeModal.close();
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
