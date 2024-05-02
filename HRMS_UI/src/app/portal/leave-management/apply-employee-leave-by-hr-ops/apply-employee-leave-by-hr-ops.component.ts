import { DatePipe, formatDate } from '@angular/common';
import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, Validators, FormControl, FormArray } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { FlatpickrDirective } from 'angularx-flatpickr';
import { finalize } from 'rxjs/operators';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { LeaveTypeService, LeaveDayTypeService, BranchesService } from 'src/app/core/services/masters';
import { environment } from 'src/environments/environment';
import Swal from 'sweetalert2';
import * as CryptoJS from 'crypto-js';
import { FlatpickrDefaults } from 'angularx-flatpickr';
import { commonMethods } from 'src/app/core';
import { LeaveType } from 'src/app/core/enum/application-enums';
import { StorageService, EmployeeService } from 'src/app/core/services';

@Component({
  selector: 'app-apply-employee-leave-by-hr-ops',
  templateUrl: './apply-employee-leave-by-hr-ops.component.html',
  styleUrls: ['./apply-employee-leave-by-hr-ops.component.scss'],
  providers: [FlatpickrDefaults]
})
export class ApplyEmployeeLeaveByHrOpsComponent implements OnInit {
  @ViewChild(FlatpickrDirective, { static: false }) fromDate: FlatpickrDirective | undefined;
  @Input() selectedRowData: any;

  disableLeaveType: boolean = true;
  leaveTypeDisabled: any;
  avaialbeBalanceShow: any;
  leaveForm: any;
  leaveTypes: any;
  leaveDayTypes: any;
  isSubmitted: any;
  leaveemployeeProfile: any;
  minDate: any;
  maxDate: any;
  toMinDate: any;
  toMaxDate: any;
  selectedLeaveType: any;
  showDayType: any;
  toDateDayTypeHide: boolean = false;
  leaveFileUploadVisible: boolean = false;
  leaveTypeIds: any;
  specialLeaveTypes: any;
  leaveType: any;
  toDisableDate: any = '';
  isHROPS: any;
  showLeaveDetails: boolean;
  get f() { return this.leaveForm.controls; }
  fileUploads: FileUpload[];
  employeeProfile: any;

  constructor(
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    private readonly leaveTypeService: LeaveTypeService,
    private readonly leaveDayTypeService: LeaveDayTypeService,
    private readonly leaveManagementService: LeaveManagementService,
    private readonly storageService: StorageService,
    private readonly employeeInformationService: EmployeeService,
    private readonly datePipe: DatePipe,
    private branchService: BranchesService,) {
    this.showLeaveDetails = false;
    this.showDayType = false;
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.leaveForm = this.formBuilder.group({
      EmployeeSlno: [],
      LeaveFrom: ['', [Validators.required]],
      FromDateDayTypeId: ['1'],
      LeaveTo: ['', [Validators.required]],
      ToDateDayTypeId: ['1'],
      LeaveType: ['', [Validators.required]],
      Remarks: ['TOOK CASUAL LEAVE.', [Validators.required]],
      LeaveBalance: new FormControl(),
      LeaveTypeName: new FormControl(),
      SelectedEmployees: new FormControl([]),
      LeaveFiles: new FormControl(''),
      LeaveFileUploads: new FormArray([]),
      CompOffDate: new FormControl(''),
      EarlyLogoutTime: new FormControl(''),
      EmployeeName: new FormControl(),
      EmployeeId: new FormControl()
    });
    this.isSubmitted = false;
    this.fileUploads = [];
    this.getHrBranches();
    // sessionStorage.removeItem("LeaveTypeId");
  }


  ngOnInit(): void {
    //this.getLeaveEmployeeProfile();
    this.getHrBranches();

  }
  onEmployeeIdChange() {
    let data = this.leaveForm.value;
    let employeeId = data.EmployeeId;
    this.employeeInformationService.getEmployeeProfile(employeeId).subscribe((data: any) => {
      this.showLeaveDetails = true;
      this.leaveForm.controls['EmployeeName'].patchValue(data.EmployeeName);
      this.leaveForm.controls['EmployeeSlno'].patchValue(data.EmployeeSlno);
      this.leaveemployeeProfile = data;
      this.selectedRowData = data;
      this.getLeaveTypes();
      this.getLeaveDayTypes();
      let k = this.activeModal;
      if (this.fromDate) {
        this.fromDate.clickOpens = true;
      }
    });
  }
  toggleFromDate() {
    if (this.fromDate) {
      this.fromDate.clickOpens = true;
    }
  }
  getLeaveEmployeeProfile() {
    let employeeslno = this.selectedRowData.EmployeeSlno;
    this.employeeInformationService.getEmployeeMinimumProfile(employeeslno)
      .subscribe((data: any) => {
        this.leaveForm.controls['EmployeeSlno'].patchValue(this.selectedRowData.EmployeeSlno);
        this.leaveemployeeProfile = data;
      });
  }
  getLeaveTypes() {
    let employeeSlno = this.selectedRowData.EmployeeSlno;
    this.leaveTypeService.getAssignedLeaveTypes(employeeSlno).subscribe((data: any) => {
      // this.leaveTypes = data;
      this.leaveTypes = data.filter((item: any) => item.ShowToManager);
      this.leaveTypeIds = data.map((item: any) => item.LeaveTypeId);
    });
  }

  getLeaveDayTypes() {
    this.leaveDayTypeService.getLeaveDayTypes().subscribe((data: any) => {
      this.leaveDayTypes = data;
    })
  }
  // disabledDay(date: any) {
  //   // <---**on this point date is undefined**
  //   return (date.getDay() == 0);
  // }

  disableHolidays(date: any) {
    let rdatedData = '';
    let leaveTypeId = '';
    let holidayDates: any = [];
    let encryptedData = sessionStorage.getItem("HoliDays");
    let leaveTypeIdEncrypt = sessionStorage.getItem("LeaveTypeId");

    if (encryptedData !== null || encryptedData != undefined) {
      rdatedData = CryptoJS.AES.decrypt(encryptedData, environment.SecretKey).toString(CryptoJS.enc.Utf8);
      holidayDates = JSON.parse(rdatedData);
      if (leaveTypeIdEncrypt !== null || leaveTypeIdEncrypt != undefined) {
        leaveTypeId = CryptoJS.AES.decrypt(leaveTypeIdEncrypt, environment.SecretKey).toString(CryptoJS.enc.Utf8);
        if (leaveTypeId.toString() == LeaveType.ON_DUTY.toString()) {
          holidayDates = [];
          // holidayDates = holidayDates.filter((x: any) => x.HolidayName !== DisableWeekdays.SUNDAY);
          // holidayDates = holidayDates.filter((x: any) => x.HolidayName !== DisableWeekdays.MONDAY);  
        }
      }
    }
    // let hDates = holidayDates.map((x: any) => new Date(x.HolidayDate));
    let isHoliday = holidayDates.some((x: any) => formatDate(x.HolidayDate, 'MM-dd-yyyy', 'en') === formatDate(date, 'MM-dd-yyyy', 'en'));
    return isHoliday;
  }


  changeFromDate(event: any) {
    let todate = new Date(event.selectedDates[0]);
    if (event.selectedDates !== undefined && event.selectedDates.length > 0) {
      let selectedFromDate = event.selectedDates[0];
      this.leaveForm.controls['LeaveTo'].patchValue('');
      this.toMinDate = selectedFromDate;
    }

    // switch (this.leaveType.LeaveTypeId) {
    //   case LeaveType.PATERNITY_LEAVE:
    //     todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
    //     this.leaveForm.controls['LeaveTo'].patchValue(todate);
    //     this.maxDate = new Date(new Date().getFullYear(), 11, 25);
    //     this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');

    //     break;

    //   case LeaveType.MATERNITY_LEAVE:
    //     todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
    //     this.maxDate = new Date(new Date().getFullYear(), 11, 25);
    //     // }
    //     this.leaveForm.controls['LeaveTo'].patchValue(todate);
    //     this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');

    //     break;
    //   case LeaveType.MARRIAGE_LEAVE:
    //     todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
    //     this.leaveForm.controls['LeaveTo'].patchValue(todate);
    //     this.maxDate = new Date(new Date().getFullYear(), 11, 25);
    //     this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');

    //     break;
    //   case LeaveType.SPECIAL_CASUAL_LEAVE:
    //     todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
    //     this.leaveForm.controls['LeaveTo'].patchValue(todate);
    //     this.maxDate = new Date(new Date().getFullYear(), 11, 25);
    //     this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');

    //     break;
    //   case LeaveType.BEREAVEMENT_LEAVE:
    //     todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
    //     this.leaveForm.controls['LeaveTo'].patchValue(todate);
    //     this.maxDate = new Date(new Date().getFullYear(), 11, 25);
    //     this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');

    //     break;
    //   case LeaveType.SPECIAL_SICK_LEAVE:
    //     todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
    //     this.leaveForm.controls['LeaveTo'].patchValue(todate);
    //     this.maxDate = new Date(new Date().getFullYear(), 11, 25);
    //     this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');

    //     break;
    //   // case LeaveType.BEREAVEMENT_LEAVE:
    //   //   todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
    //   //   this.leaveForm.controls['LeaveTo'].patchValue(todate);
    //   //   this.maxDate = "";
    //   //   this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');

    //   //   break;
    // }
    this.leaveFileUploadEnable(event.selectedDates[0], this.leaveForm.controls['LeaveTo'].value);
  }

  get leaveFiles(): FormArray {
    let formArr = this.leaveForm.controls['LeaveFileUploads'] as FormArray;
    return formArr;
  }
  onFileChange(event: any) {
    if (event && event.length > 0) { // event.value.length
      for (let index = 0; index < event.length; index++) {
        const item = event[index];
        const reader = new FileReader();
        let file = new FileUpload();
        reader.readAsDataURL(item);
        reader.onload = () => {
          if (reader != null && reader.result != null) {

            file.fileName = item.name;;
            file.fileSize = item.size;
            file.fileType = item.type;
            file.lastModifiedTime = item.lastModified;
            file.lastModifiedDate = item.lastModifiedDate;
            file.fileAsBase64 = reader.result.toString();
          }
          let fileModel = {
            FileName_Original: '',
            FilePath: '',
            FileToUpload: file
          }
          this.leaveFiles.push(new FormControl(fileModel));
        }
      }
      this.leaveForm.controls['LeaveFiles'].patchValue('file uploaded');
    }
  }
  removeFile(index: any) {
    this.leaveFiles.removeAt(index);
    if (!this.leaveFiles.controls.length) {
      this.leaveForm.controls['LeaveFiles'].setValidators([Validators.required])
      this.leaveForm.controls['LeaveFiles'].updateValueAndValidity();
      this.leaveForm.controls['LeaveFiles'].patchValue('');
    }
  }

  changeToDate(event: any) {
    if (event.selectedDates !== undefined && event.selectedDates.length > 0) {
      let fromDate = this.datePipe.transform(this.leaveForm.controls['LeaveFrom'].value, "dd-MMM-yyyy");
      let toDate = this.datePipe.transform(event.selectedDates[0], "dd-MMM-yyyy");
      if (fromDate == toDate) {
        this.toDateDayTypeHide = true;
        this.leaveForm.patchValue({
          ToDateDayTypeId: this.leaveForm.controls["FromDateDayTypeId"].value
        });
      }
      else {
        this.toDateDayTypeHide = false;
      }
      this.leaveFileUploadEnable(this.leaveForm.controls['LeaveFrom'].value, event.selectedDates[0])
    }
  }

  clearFile() {
    this.leaveFileUploadVisible = false;
    this.leaveForm.controls['LeaveFiles'].clearValidators();
    this.leaveForm.controls['LeaveFiles'].updateValueAndValidity();
    this.leaveForm.controls['LeaveFiles'].patchValue('');
    this.leaveFiles.clear();
  }
  leaveFileUploadEnable(fromDate: Date, toDate: Date) {
    let totalSickLeaves = commonMethods.calculateDateDiff(fromDate, toDate);
    if (fromDate && toDate && this.leaveType.IsDocumentRequired) {
      // || this.leaveForm.controls['LeaveType'].value.LeaveTypeId == LeaveType.MARRIAGE_LEAVE || this.leaveForm.controls['LeaveType'].value.LeaveTypeId == LeaveType.SPECIAL_CASUAL_LEAVE || this.leaveForm.controls['LeaveType'].value.LeaveTypeId == LeaveType.SPECIAL_SICK_LEAVE
      if ((this.leaveForm.controls['LeaveType'].value.LeaveTypeId == LeaveType.SICK_LEAVE && totalSickLeaves >= 4) || (this.leaveForm.controls['LeaveType'].value.LeaveTypeId !== LeaveType.SICK_LEAVE)) {
        this.leaveFileUploadVisible = true;
        this.leaveForm.controls['LeaveFiles'].setValidators([Validators.required])
        this.leaveForm.controls['LeaveFiles'].updateValueAndValidity();
      }
      else {
        this.clearFile();
      }
    }
    else {
      this.clearFile();
    }
  }

  applyLeaveRequest() {
    let employees: any = [];
    employees.push(this.selectedRowData.EmployeeSlno);
    this.isSubmitted = true;
    this.leaveForm.controls['LeaveTypeName'].patchValue('');
    this.leaveForm.controls['SelectedEmployees'].patchValue(employees);

    if (this.leaveForm.invalid) {
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        html: 'There were some errors in the Leave Form.  Please correct the same.',
        footer: 'Please correct the erross.'
      });
    }
    else {
      if (this.toDateDayTypeHide) {
        this.leaveForm.patchValue({
          ToDateDayTypeId: this.leaveForm.controls["FromDateDayTypeId"].value
        });
      }

      let leaveRequest = this.leaveForm.value;
      this.leaveManagementService.applyLeave(leaveRequest).pipe(finalize(() => this.isSubmitted = false))
        .subscribe((item: any) => {
          if (item) {
            if (item.Response) {
              this.applyLeaveSuccessMsg();
            }
            else {
              Swal.fire({
                title: 'Oops...! Something went Wrong !',
                html: '<p class="text-danger" >' + item.Message + '</p>',
                icon: 'error',
                confirmButtonColor: 'rgb(54, 69, 116)',
                confirmButtonText: 'Ok'
              });
            }
          }
          else {
            Swal.fire({
              title: 'Oops...! Something went Wrong !',
              html: 'Your leaves are not applied.',
              icon: 'error',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
        });
    }
  }

  applyLeaveSuccessMsg() {
    this.leaveManagementService.sendUpdate(true);
    this.activeModal.dismiss('Saved Successfully');
    Swal.fire({
      title: 'Well done !',
      html: 'Aww yeah, your leaves are successfully applied.',
      icon: 'success',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    });
    return;
  }

  onLeaveTypeChange(event: any) {
    
    this.leaveType = event;
    this.leaveForm.controls['LeaveBalance'].patchValue(this.leaveType.LeaveBalance);
    this.showDayType = this.leaveType.CanApplyHalfDay;
    this.leaveForm.controls['LeaveTo'].patchValue('');
    this.leaveForm.controls['LeaveFrom'].patchValue('');
    if (this.leaveType) {
      this.leaveForm.controls['LeaveBalance'].patchValue(this.leaveType.LeaveBalance);
      this.leaveForm.controls['LeaveType'].patchValue(this.leaveType);
      this.disableLeaveType = true;
      this.showDayType = this.leaveType.CanApplyHalfDay;
      let today = new Date();
      let toMaxday = new Date();
      this.storageService.save("LeaveTypeId", JSON.stringify(this.leaveType.LeaveTypeId), 1);

      // switch (this.leaveType.LeaveTypeId) {
      //   case LeaveType.PRIVILEGE_LEAVE:
      //     let plMin = new Date(today.setDate(today.getDate() - this.leaveType.ApplyBeforeDays));
      //     this.minDate = plMin;
      //     this.toMinDate = this.minDate;
      //     this.maxDate = new Date(new Date().getFullYear(), 11, 25);

      //     break;
      //   case LeaveType.CASUAL_LEAVE:
      //     this.minDate = today;
      //     this.toMinDate = today;
      //     let min = new Date(today.setDate(today.getDate() - this.leaveType.ApplyBeforeDays));
      //     if (min > new Date(this.leaveemployeeProfile.PayrollMonthFrom)) {
      //       this.minDate = min;
      //       this.toMinDate = this.minDate;
      //       this.maxDate = new Date(new Date().getFullYear(), 11, 25);
      //       if (this.leaveemployeeProfile.OfficeTypeSlno == OfficeType.COLLEGES || this.leaveemployeeProfile.OfficeTypeSlno == OfficeType.SCHOOLS) {
      //         this.minDate = new Date(this.leaveemployeeProfile.PayrollMonthFrom);
      //         this.toMinDate = this.minDate;
      //         this.maxDate = new Date(this.leaveemployeeProfile.PayrollMonthTo);
      //       }
      //     } else {
      //       this.minDate = new Date(this.leaveemployeeProfile.PayrollMonthFrom);
      //       this.toMinDate = this.minDate;
      //     }

      //     this.leaveForm.controls['LeaveFileUploads'].patchValue([]);
      //     break;
      //   case LeaveType.SICK_LEAVE:
      //     this.minDate = new Date(this.leaveemployeeProfile.PayrollMonthFrom);
      //     this.toMinDate = this.minDate;
      //     this.maxDate = today;
      //     this.leaveForm.controls['LeaveFileUploads'].patchValue([]);

      //     break;
      //   case LeaveType.MATERNITY_LEAVE:
      //   case LeaveType.PATERNITY_LEAVE:
      //   case LeaveType.COVID_LEAVE:
      //   case LeaveType.BEREAVEMENT_LEAVE:
      //   case LeaveType.SPECIAL_CASUAL_LEAVE:
      //   case LeaveType.MARRIAGE_LEAVE:
      //   case LeaveType.SPECIAL_SICK_LEAVE:
      //     this.minDate = new Date(this.leaveemployeeProfile.PayrollMonthFrom);
      //     this.toMinDate = this.minDate;
      //     this.maxDate = new Date(new Date().getFullYear(), 11, 25);
      //     this.leaveForm.controls['LeaveFiles'].setValidators([Validators.required])
      //     this.leaveForm.controls['LeaveFiles'].updateValueAndValidity();
      //     break;
      //   case LeaveType.ON_DUTY:
      //     today = new Date();
      //     let mind = new Date(today.setDate(today.getDate() - this.leaveType.ApplyBeforeDays));
      //     if (mind > new Date(this.leaveemployeeProfile.PayrollMonthFrom)) {
      //       this.minDate = mind
      //     } else {
      //       this.minDate = new Date(this.leaveemployeeProfile.PayrollMonthFrom);
      //     }
      //     this.toMinDate = this.minDate;
      //     // this.maxDate = toMaxday.setDate(toMaxday.getDate() + this.leaveType.ApplicableTo);
      //     let maxDate = new Date(toMaxday.setDate(toMaxday.getDate() + this.leaveType.ApplicableTo));
      //     if (maxDate < new Date(this.leaveemployeeProfile.PayrollMonthTo)) {
      //       this.maxDate = maxDate
      //     } else {
      //       this.maxDate = new Date(this.leaveemployeeProfile.PayrollMonthTo);
      //     }
      //     break;
      //   case LeaveType.SUMMER_VACATION:
      //     today = new Date();
      //     let minDate = new Date(this.leaveemployeeProfile.PayrollMonthFrom);
      //     if (minDate > new Date(this.leaveType.DateValidFrom)) {
      //       this.minDate = minDate
      //     } else {
      //       this.minDate = new Date(this.leaveType.DateValidFrom);
      //     }
      //     this.toMinDate = this.minDate;
      //     this.maxDate = new Date(this.leaveType.DateValidUntil);
      //     break;
      //   case LeaveType.WINTER_VACATION:
      //     today = new Date();
      //     let minD = new Date(this.leaveemployeeProfile.PayrollMonthFrom);
      //     if (minD > new Date(this.leaveType.DateValidFrom)) {
      //       this.minDate = minD
      //     } else {
      //       this.minDate = new Date(this.leaveType.DateValidFrom);
      //     }
      //     this.toMinDate = this.minDate;
      //     this.maxDate = new Date(this.leaveType.DateValidUntil);
      //     break;

      // }
    }
    this.leaveForm.patchValue({
      LeaveFrom: '',
      LeaveTo: ''
    });
    this.clearFile();

  }
  getHrBranches() {
    
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.branchService.getHrBranches(employeeSlno).subscribe((res) => {
      if (res && res.length > 0) {
        this.isHROPS = true;
      }
      else {
        this.isHROPS = false;
      }
      // this.branches = res;
      // this.selectAllForDropdownItems(this.branches);
    })
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    sessionStorage.removeItem("LeaveTypeId");
    this.activeModal.dismiss();
  }
}
