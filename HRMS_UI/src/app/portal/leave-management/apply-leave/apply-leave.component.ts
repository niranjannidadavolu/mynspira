import { DatePipe, formatDate } from '@angular/common';
import { AfterViewInit, Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormControl, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { finalize } from 'rxjs/operators';
import { commonMethods } from 'src/app/core/common/common.static';
import { LeaveType } from 'src/app/core/enum/application-enums';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { StorageService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { LeaveDayTypeService, LeaveTypeService } from 'src/app/core/services/masters';
import Swal from 'sweetalert2';
import { environment } from 'src/environments/environment';
import * as CryptoJS from 'crypto-js';
import { FlatpickrDefaults } from 'angularx-flatpickr';

@Component({
  selector: 'app-apply-leave',
  templateUrl: './apply-leave.component.html',
  styleUrls: ['./apply-leave.component.scss'],
  providers: [FlatpickrDefaults]
})
export class ApplyLeaveComponent implements OnInit, OnDestroy, AfterViewInit {
  @Input() public leaveType: any;
  @Input() holidays: any = [];

  disableLeaveType: boolean = true;
  leaveTypeDisabled: any;
  avaialbeBalanceShow: any;
  leaveForm: any;
  leaveTypes: any;
  leaveDayTypes: any;
  isSubmitted: any;
  employeeProfile: any;
  minDate: any;
  maxDate: any;
  toMinDate: any;
  toMaxDate: any;
  defaultMinDate: any;
  defaultMaxDate: any;
  selectedLeaveType: any;
  showDayType: any;
  toDateDayTypeHide: boolean = false;
  leaveFileUploadVisible: boolean = false;
  leaveTypeIds = LeaveType;
  specialLeaveTypes: any;
  selectedReason: any;
  toDisableDate: any = '';
  get f() { return this.leaveForm.controls; }
  fileUploads: FileUpload[];
  constructor(
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    private readonly leaveTypeService: LeaveTypeService,
    private readonly leaveDayTypeService: LeaveDayTypeService,
    private readonly leaveManagementService: LeaveManagementService,
    private readonly storageService: StorageService,
    private readonly datePipe: DatePipe) {
    this.showDayType = false;

    this.leaveForm = this.formBuilder.group({
      EmployeeSlno: [],
      LeaveFrom: ['', [Validators.required]],
      FromDateDayTypeId: ['1'],
      LeaveTo: ['', [Validators.required]],
      ToDateDayTypeId: ['1'],
      LeaveType: ['', [Validators.required]],
      Remarks: ['', [Validators.required, Validators.pattern(/[\S]/g)]],
      LeaveBalance: new FormControl(),
      LeaveTypeName: new FormControl(),
      SelectedEmployees: new FormControl([]),
      LeaveFiles: new FormControl(''),
      LeaveFileUploads: new FormArray([]),
      CompOffDate: new FormControl(''),
      EarlyLogoutTime: new FormControl(''),
      LeaveTypeReason: new FormControl('')
    });

    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.leaveForm.controls['EmployeeSlno'].patchValue(this.employeeProfile.EmployeeSlno);
    this.isSubmitted = false;
    this.fileUploads = [];
  }
  ngAfterViewInit(): void {
    debugger;
    this.getLeaveTypes();
    this.getLeaveDayTypes();
    let k = this.activeModal;
    console.log('leave type ' + JSON.stringify(this.leaveType));
  }

  ngOnInit(): void {
    debugger;
    this.getLeaveTypes();
    this.getLeaveDayTypes();
    let k = this.activeModal;
    console.log('leave type ' + JSON.stringify(this.leaveType));
  }
  getLeaveTypes() {
    debugger;
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.leaveTypeService.getAssignedLeaveTypes(employeeSlno).subscribe((data: any) => {
      this.leaveTypes = data;
      this.leaveTypes = this.leaveTypes.filter((item: any) => item.ShowInDashboard);
      this.leaveType = data.find((item: { LeaveTypeId: any; }) => item.LeaveTypeId === this.leaveType.LeaveTypeId);
      console.log(this.leaveType);
      debugger;
      if (this.leaveType) {
        if (this.leaveType.LeaveTypeReasons && this.leaveType.LeaveTypeReasons.length) {
          this.leaveForm.controls['LeaveTypeReason'].setValidators(Validators.required);
          this.leaveForm.controls['LeaveTypeReason'].updateValueAndValidity();
        }
        this.leaveForm.controls['LeaveBalance'].patchValue(this.leaveType.LeaveBalance);
        this.leaveForm.controls['LeaveType'].patchValue(this.leaveType);
        this.disableLeaveType = true;
        this.showDayType = this.leaveType.CanApplyHalfDay;
        let today = new Date();

        switch (this.leaveType.LeaveTypeId) {
          case LeaveType.PRIVILEGE_LEAVE:
            let plMin = new Date(today.setDate(today.getDate() - this.leaveType.ApplyBeforeDays));
            this.minDate = plMin;
            this.toMinDate = this.minDate;
            //this.maxDate = new Date(this.employeeProfile.PayrollMonthTo);

            break;
          case LeaveType.CASUAL_LEAVE:
            this.minDate = today;
            this.toMinDate = today;
            let min = new Date(today.setDate(today.getDate() - this.leaveType.ApplyBeforeDays));
            if (min > new Date(this.employeeProfile.PayrollMonthFrom)) {
              this.minDate = min;
              this.toMinDate = this.minDate;
              //this.maxDate = new Date(this.employeeProfile.PayrollMonthTo);
            } else {
              this.minDate = new Date(this.employeeProfile.PayrollMonthFrom);
              this.toMinDate = this.minDate;
            }

            this.leaveForm.controls['LeaveFileUploads'].patchValue([]);
            break;
          case LeaveType.SICK_LEAVE:
            debugger;
            this.minDate = new Date(this.employeeProfile.PayrollMonthFrom);
            this.toMinDate = this.minDate;
            this.maxDate = today;
            this.leaveForm.controls['LeaveFileUploads'].patchValue([]);
            break;
          case LeaveType.MATERNITY_LEAVE:
          case LeaveType.PATERNITY_LEAVE:
          case LeaveType.COVID_LEAVE:
          case LeaveType.BEREAVEMENT_LEAVE:
          case LeaveType.SPECIAL_CASUAL_LEAVE:
          case LeaveType.MARRIAGE_LEAVE:
          case LeaveType.SPECIAL_SICK_LEAVE:
            this.minDate = new Date(this.employeeProfile.PayrollMonthFrom);
            this.toMinDate = this.minDate;
            //this.maxDate = new Date(this.employeeProfile.PayrollMonthTo);
            this.leaveForm.controls['LeaveFiles'].setValidators([Validators.required])
            this.leaveForm.controls['LeaveFiles'].updateValueAndValidity();
            this.leaveForm.controls['LeaveType'].patchValue(this.leaveType);
            break;
          case LeaveType.SESSION_BREAK:
            this.minDate = today;
            this.toMinDate = today;
            let minS = new Date(today.setDate(today.getDate() - this.leaveType.ApplyBeforeDays));
            this.toMinDate = minS;
            this.leaveForm.controls['LeaveFileUploads'].patchValue([]);
            break;
        }
      }
    });
  }
  getLeaveDayTypes() {
    this.leaveDayTypeService.getLeaveDayTypes().subscribe((data: any) => {
      this.leaveDayTypes = data;
    })
  }
  disableHolidays(date: any) {
    let rdatedData = '';
    let holidayDates = [];
    let encryptedData = sessionStorage.getItem("HoliDays");
    if (encryptedData !== null || encryptedData != undefined) {
      rdatedData = CryptoJS.AES.decrypt(encryptedData, environment.SecretKey).toString(CryptoJS.enc.Utf8);
      holidayDates = JSON.parse(rdatedData);
    }
    let isHoliday = holidayDates.some((x: any) => formatDate(x.HolidayDate, 'MM-dd-yyyy', 'en') === formatDate(date, 'MM-dd-yyyy', 'en'));
    return isHoliday;
  }
  changeFromDate(event: any) {
    debugger;
    let selectedFromDate;
    let date: any;
    let todate: any;
    let today = new Date();
    if (event.selectedDates !== undefined && event.selectedDates.length > 0) {
      todate = new Date(event.selectedDates[0]);
      selectedFromDate = event.selectedDates[0];
      this.leaveForm.controls['LeaveTo'].patchValue('');
      this.toMinDate = selectedFromDate;
    }

    switch (this.leaveType.LeaveTypeId) {
      case LeaveType.SICK_LEAVE:
        debugger;
        this.toMinDate = selectedFromDate
        //this.minDate = new Date(this.employeeProfile.PayrollMonthFrom);
        //this.toMinDate = this.minDate;
        this.maxDate = today;
        this.leaveForm.controls['LeaveFileUploads'].patchValue([]);
        break;
      case LeaveType.PATERNITY_LEAVE:
        todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
        this.leaveForm.controls['LeaveTo'].patchValue(todate);
        this.maxDate = new Date(this.employeeProfile.PayrollMonthTo);
        this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');
        break;
      case LeaveType.MATERNITY_LEAVE:
        todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
        this.maxDate = new Date(this.employeeProfile.PayrollMonthTo);
        this.leaveForm.controls['LeaveTo'].patchValue(todate);
        this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');
        break;
      case LeaveType.MARRIAGE_LEAVE:
        todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
        this.leaveForm.controls['LeaveTo'].patchValue(todate);
        this.maxDate = new Date(this.employeeProfile.PayrollMonthTo);
        this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');
        break;
      case LeaveType.SPECIAL_CASUAL_LEAVE:
        todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
        this.leaveForm.controls['LeaveTo'].patchValue(todate);
        this.maxDate = new Date(this.employeeProfile.PayrollMonthTo);
        this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');
        break;
      case LeaveType.BEREAVEMENT_LEAVE:
        todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
        this.leaveForm.controls['LeaveTo'].patchValue(todate);
        this.maxDate = new Date(this.employeeProfile.PayrollMonthTo);
        this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');
        break;
      case LeaveType.SPECIAL_SICK_LEAVE:
        todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
        this.leaveForm.controls['LeaveTo'].patchValue(todate);
        this.maxDate = new Date(this.employeeProfile.PayrollMonthTo);
        this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');
        break;
      case LeaveType.SESSION_BREAK:

        this.toMinDate = todate;
        this.leaveForm.controls['LeaveFileUploads'].patchValue([]);
        break;
    }
    this.leaveFileUploadEnable(event.selectedDates[0], this.leaveForm.controls['LeaveTo'].value);
  }

  get leaveFiles(): FormArray {
    let formArr = this.leaveForm.controls['LeaveFileUploads'] as FormArray;
    return formArr;
  }
  onDxFileChange(event: any) {

    const reader = new FileReader();
    if (event.value.length && event.value.length > 0) {
      reader.readAsDataURL(event.value[0]);
      reader.onload = () => {
        if (reader != null && reader.result != null) {
        }
      }
    }
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
      if (totalSickLeaves >= this.leaveType.NeedCertificate) {
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
    this.isSubmitted = true;

    this.leaveForm.controls['LeaveTypeName'].patchValue('');
    if (this.leaveType?.LeaveTypeReasons?.length <= 0) {
      this.leaveForm.controls['LeaveTypeReason'].setValue(null);
    }
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
  ngOnDestroy(): void {
    this.activeModal.dismiss();
  }
}
