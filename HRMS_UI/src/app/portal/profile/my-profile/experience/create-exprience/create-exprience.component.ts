import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { finalize } from 'rxjs/operators';
import { commonMethods } from 'src/app/core/common/common.static';
import { LEAVE_STATUS_ID, approveLeaveBtnShow } from 'src/app/core/constants/leave-status.constant';
import { LeaveType } from 'src/app/core/enum/application-enums';
import { ExperienceDetail } from 'src/app/core/models/employee/experience-detail.model';
import { EmployeeService, StorageService } from 'src/app/core/services';
import { LeaveEncashmentService } from 'src/app/core/services/leave-encashment';
import { LeaveTypeService } from 'src/app/core/services/masters';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-create-exprience',
  templateUrl: './create-exprience.component.html',
  styleUrls: ['./create-exprience.component.scss']
})
export class CreateExprienceComponent implements OnInit {
  // @Input() public selectedRole: any;
  experiencefrom!: FormGroup;
  isSubmitted: boolean = false;
  LeaveBalance: any;
  @Input() public selectedRowData: any;
  @Input() public type: any = null;
  employeeProfile: any;
  empLeaveBalance: any;
  minDate: any;
  maxDate: any;
  leaveTypes: any;
  employeeType!: any[];
  Salaryunit: any[];
  profile: any;
  leaveAction = approveLeaveBtnShow;
  plLeaveData: any;
  isApproveSubmitted: boolean = false;
  isRejectSubmitted: boolean = false;

  constructor(
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    private readonly storageService: StorageService,
    private readonly leaveEncashmentService: LeaveEncashmentService,
    private readonly leaveTypeService: LeaveTypeService,
    private readonly employeeService: EmployeeService,

  ) {
    this.Salaryunit = [];
    this.employeeType = [];
    this.employeeProfile = JSON.parse(this.storageService.get('EmployeeProfile', 1));
    // //console.log(this.employeeProfile);

  }
  createForm() {
    this.experiencefrom = this.formBuilder.group({
      EmployeeSlno: [this.employeeProfile.EmployeeSlno],
      IsNarayanaEmp: ['', [Validators.required]],
      EmpId: [''],
      Organisation: ['', [Validators.required]],
      Designation: ['', [Validators.required]],
      FromDate: ['', [Validators.required]],
      ToDate: ['', [Validators.required]],
      Salary: ['', [Validators.required]],
      Salaryunit: ['', [Validators.required]],
      place: ['', [Validators.required]],
      RefName: ['', [Validators.required]],
      RefPhoneNo: [''],
      RefMobile: [''],
      RefEmail: [''],
      OtherDetails: [''],
      EmpExSlno:[''],
      EmployeeName:[''],
    });

  }
  ngOnInit(): void {
    this.createForm();
    this.getLeaveTypes();
    let data = this.selectedRowData;
    if (data) {
     
      this.experiencefrom.patchValue({
        IsNarayanaEmp:  data.IsNarayanaEmp=="Yes"?1:0,
        EmpId: data.EmpId,
        EmpExSlno:data.EmpExSlno,
        EmployeeSlno:data.EmployeeSlno,
        EmployeeName:data.EmployeeName,
        Organisation: data.Organisation,
        Designation: data.Designation,
        FromDate: data.FromDate,
        ToDate: data.ToDate,
        Salary: data.Salary,
        Salaryunit: data.SalaryUnit,
        place: data.Place,
        RefName: data.RefName,
        RefPhoneNo: data.Refphoneno,
        RefMobile: data.Refmobileno,
        RefEmail: data.Refemail,
      });
    }
    this.getIsNarayanaEmp();
    this.getSalaryUnits();
    this.minDate = this.experiencefrom.controls['FromDate'];
    this.maxDate = this.experiencefrom.controls['ToDate'];
    if (this.minDate <= this.maxDate) {
      return;
    }

  }



  getSalaryUnits() {
    let SalaryUnits = [
      {
        id: 1, name: "PER YEAR"
      },
      {
        id: 2, name: "PER MONTH"
      }
    ]
    this.Salaryunit = SalaryUnits;
  }

  getIsNarayanaEmp() {
    let empTypes = [
      {
        id: 0, name: "NO"
      },
      {
        id: 1, name: "YES"
      }
    ]
    this.employeeType = empTypes;
  }
  get formControls() {
    return this.experiencefrom.controls;
  }
  OnSubmit() {
    if (this.experiencefrom.invalid) {
      this.isSubmitted = true;
    }
    let data = this.experiencefrom.value
    if (this.type == "Edit") {
      this.updateExperienceData(data);
    }
    else if (this.type == "Add") {
    let experienceDetails = new ExperienceDetail();
    experienceDetails.Designation = data.Designation;
    experienceDetails.FromDate = data.FromDate;
    experienceDetails.ToDate = data.ToDate;
    experienceDetails.IsNarayanaEmp = data.IsNarayanaEmp ;//== undefined ? data.IsNarayanaEmp : data.IsNarayanaEmp.id;
    experienceDetails.Organisation = data.Organisation;
    experienceDetails.Place = data.place;
    experienceDetails.RefName = data.RefName;
    experienceDetails.Refmobileno = data.RefMobile;
    experienceDetails.Refemail = data.RefEmail;
    experienceDetails.Refphoneno = data.RefPhoneNo;
    experienceDetails.Description = "";
    experienceDetails.Salary = data.Salary;
    experienceDetails.SalaryUnit = data.Salaryunit ;//== undefined ? data.Salaryunit : data.Salaryunit.id;
    experienceDetails.EmployeeSlno = this.employeeProfile.EmpSLNo;
    experienceDetails.UniqueNo = this.employeeProfile.UniqueNo;
    experienceDetails.Userslno = 1;
    this.insertExperieneData(experienceDetails);
    }
  }
  insertExperieneData(data: any) {
    this.employeeService.updateEmployeeExperienceDetails(data).subscribe((result: any) => {
      if (result) {
        this.activeModal.close(true);
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, experience details are successfully saved.',
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => {
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: 'Experience details are not Saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    });
    return;
  }

  updateExperienceData(data: any) {
    this.employeeService.updateEmployeeExperienceDetails(data).subscribe((result: any) => {
      if (result) {
        this.activeModal.close(true);
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Experience details are successfully saved.',
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
      else {
        this.activeModal.close(true);

        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: 'Experience details are not Saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    });
  }

  // get formControls(){
  //   return this.experiencefrom.controls;
  // }
  get f() { return this.experiencefrom.controls; }
  numberOnly(event: any): boolean {
    return commonMethods.isNumberKey(event);
  }
  getLeaveTypes() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.leaveTypeService.getAssignedLeaveTypes(employeeSlno).subscribe((data: any) => {
      this.leaveTypes = data;
      this.plLeaveData = data.find((s: any) => s.LeaveTypeId == LeaveType.PRIVILEGE_LEAVE);
      if (this.plLeaveData && this.type == this.leaveAction.add) {
        this.experiencefrom.controls['LeaveBalance'].patchValue(this.plLeaveData.LeaveBalance);
        this.experiencefrom.controls['EntitlementId'].patchValue(this.plLeaveData.EntitlementId);
      }
    });
  }
  dateComparison(params?: any) {
    let fromDate =  this.experiencefrom.controls['FromDate'];
    let toDate =  this.experiencefrom.controls['ToDate'];
    if (params.formItem.dataField == "ToDate") {
      toDate = params.value;
    }
    if (params.formItem.dataField == "FromDate") {
      fromDate = params.value;
    }
    if (toDate !== undefined && fromDate !== undefined && toDate < fromDate) {
      return null;
    }
    return { message: 'To date must be grater than from date' };
  }

  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}

