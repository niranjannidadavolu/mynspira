import { DatePipe, formatDate } from '@angular/common';
import { Component, Input, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { DxDataGridComponent } from 'devextreme-angular';
import { finalize } from 'rxjs/operators';
import { LeaveType, OfficeType } from 'src/app/core/enum/application-enums';
import { EmployeeService, StorageService, UserInformationService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { LeaveTypeService, LeaveDayTypeService } from 'src/app/core/services/masters';
import { environment } from 'src/environments/environment';
import Swal from 'sweetalert2';
import * as CryptoJS from 'crypto-js';
import { DisableWeekdays } from 'src/app/core/constants/leave-status.constant';
import { FlatpickrDefaults } from 'angularx-flatpickr';

@Component({
  selector: 'app-apply-on-duty',
  templateUrl: './apply-on-duty.component.html',
  styleUrls: ['./apply-on-duty.component.scss'],
  providers: [FlatpickrDefaults]
})
export class ApplyOnDutyComponent implements OnInit, OnDestroy {
  // @ViewChild(DxDataGridComponent, { static: false }) dataGrid: DxDataGridComponent | undefined;

  @Input() public selectedRowData: any;
  @Input() public selectedLeave: any;
  @Input() public fromDate: any;
  @Input() public toDate: any;
  @Input() public leaveType: any;
  // @Input() public isApprovalLeaveHide: any;
  minDate: any;
  maxDate: any;
  toMinDate: any;
  toMaxDate: any;
  defaultMinDate: any;
  defaultMaxDate: any;
  selectedLeaveType: any;
  showDayType: any;
  isSubmitted: boolean;
  leaveForm: any;
  leaveTypes: any;
  employeeProfile: any;
  teamMembers: any;
  searchForm: FormGroup;
  team: any;
  allMode: any;
  checkBoxesMode: any;
  selectedType: any;
  leaveTypeIds = LeaveType;
  toDateDayTypeHide: boolean = false;
  @Input() holidays: any = [];
  toDisableDate: any;

  get f() { return this.leaveForm.controls; }

  constructor(
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    private datePipe: DatePipe,
    private readonly leaveTypeService: LeaveTypeService,
    private readonly leaveDayTypeService: LeaveDayTypeService,
    private readonly leaveManagementService: LeaveManagementService,
    private readonly employeeInformationService: EmployeeService,
    private readonly userInformationService: UserInformationService,
    private readonly storageService: StorageService) {

    this.isSubmitted = false;

    this.showDayType = false;
    let today = new Date();
    this.minDate = today;
    this.toMinDate = today;

    this.minDate.setDate(new Date().getDate() - 2);
    this.toMinDate.setDate(new Date().getDate() - 2);
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    // if(this.leaveType.LeaveTypeId == LeaveType.ON_DUTY && (this.employeeProfile.OfficeTypeSlno == OfficeType.COLLEGES || this.employeeProfile.OfficeTypeSlno == OfficeType.SCHOOLS)){
    //   this.minDate.setDate(new Date().getDate() - 1);
    //   this.maxDate.setDate(new Date());
    // }
    this.searchForm = new FormGroup({
      searchValue: new FormControl('')
    });

    this.leaveForm = this.formBuilder.group({
      EmployeeSlno: new FormControl(),
      ApplyingFor: new FormControl('1'),
      LeaveFrom: new FormControl('', [Validators.required]),
      FromDateDayTypeId: ['1'],
      LeaveTo: new FormControl('', [Validators.required]),
      ToDateDayTypeId: ['1'],
      LeaveType: new FormControl(''),
      Remarks: new FormControl('', [Validators.required]),
      LeaveBalance: new FormControl(),
      LeaveTypeName: new FormControl(),
      SelectedEmployees: new FormControl(),
      LeaveFileUploads: new FormArray([]),
      CompOffDate: new FormControl(''),
      EarlyLogoutTime: new FormControl('')
    });
    this.leaveForm.controls['EmployeeSlno'].patchValue(this.employeeProfile.EmployeeSlno);
    // this.leaveForm.controls['LeaveType'].patchValue(this.leaveType);
    // this.getLeaveTypes();
    //this.getUtilizedOnDuties();
  }

  ngOnInit(): void {
    this.allMode = 'allPages';
    this.checkBoxesMode = 'always';
    this.getLeaveTypes();
  }

  getLeaveTypes() {

    this.leaveTypeService.getAssignedLeaveTypes(this.employeeProfile.EmployeeSlno).subscribe((data: any) => {
      let minD: any;
      let todate: any;
      
      this.leaveTypes = data;
      this.leaveForm.controls['LeaveType'].patchValue(this.leaveType);
      this.leaveForm.controls['LeaveBalance'].patchValue(this.leaveType.LeaveBalance);
      this.minDate = new Date(this.employeeProfile.PayrollMonthFrom);
      this.toMinDate = this.minDate;
      let today = new Date();
      let toMaxday = new Date();
      // let leavetype = this.leaveTypes.find((x: any) => x.LeaveTypeId == LeaveType.ON_DUTY);
      switch (this.leaveType.LeaveTypeId) {
        case LeaveType.ON_DUTY:
          today = new Date();
          let min = new Date(today.setDate(today.getDate() - this.leaveType.ApplyBeforeDays));
          if (min > new Date(this.employeeProfile.PayrollMonthFrom)) {
            this.minDate = min
          } else {
            this.minDate = new Date(this.employeeProfile.PayrollMonthFrom);
          }
          this.toMinDate = this.minDate;
          let max = new Date(toMaxday.setDate(toMaxday.getDate() + this.leaveType.ApplicableTo));
          if (max < new Date(this.employeeProfile.PayrollMonthTo)) {
            this.maxDate = max
          } else {
            this.maxDate = new Date(this.employeeProfile.PayrollMonthTo);
          }
          break;
        case LeaveType.SUMMER_VACATION:
          today = new Date();
          let minDate = new Date(this.employeeProfile.PayrollMonthFrom);
          if (minDate > new Date(this.leaveType.DateValidFrom)) {
            this.minDate = minDate
          } else {
            this.minDate = new Date(this.leaveType.DateValidFrom);
          }
          this.toMinDate = this.minDate;
          this.maxDate = new Date(this.leaveType.DateValidUntil);
          break;
        case LeaveType.WINTER_VACATION:
          today = new Date();
          minD = new Date(this.employeeProfile.PayrollMonthFrom);
          if (minD > new Date(this.leaveType.DateValidFrom)) {
            this.minDate = minD
          } else {
            this.minDate = new Date(this.leaveType.DateValidFrom);
          }
          this.toMinDate = this.minDate;
          this.maxDate = new Date(this.leaveType.DateValidUntil);
          break;
        case LeaveType.PATERNITY_LEAVE:
        case LeaveType.MATERNITY_LEAVE:
        case LeaveType.MARRIAGE_LEAVE:
        case LeaveType.BEREAVEMENT_LEAVE:
          todate.setDate(todate.getDate() + this.leaveType.MaxConcecutiveDays - 1);
        this.leaveForm.controls['LeaveTo'].patchValue(todate);
        this.maxDate = new Date(this.employeeProfile.PayrollMonthTo);
        this.toDisableDate = formatDate(todate, 'dd-MMM-yyyy', 'en');
          break;
      };

    });
  }

  changeFromDate(event: any) {

    if (event.selectedDates !== undefined && event.selectedDates.length > 0) {
      let fromDate = this.datePipe.transform(this.leaveForm.controls['LeaveFrom'].value, "dd-MMM-yyyy");
      let toDate = this.datePipe.transform(event.selectedDates[0], "dd-MMM-yyyy");

      let selectedFromDate = event.selectedDates[0];
      this.leaveForm.controls['LeaveTo'].patchValue('');
      this.toMinDate = selectedFromDate;
      if (fromDate == toDate) {
        this.toDateDayTypeHide = true;
      }
      else {
        this.toDateDayTypeHide = false;
      }
    }
  }

  //Sunday Disabled
  // disabledDay(date: any) {
  //   return (date.getDay() === 0);
  // }
  disableHolidays(date: any) {
    let rdatedData = '';
    let holidayDates: any = [];
    // let encryptedData = sessionStorage.getItem("HoliDays");
    // if (encryptedData !== null || encryptedData != undefined) {
    //   rdatedData = CryptoJS.AES.decrypt(encryptedData, environment.SecretKey).toString(CryptoJS.enc.Utf8);
    //   holidayDates = JSON.parse(rdatedData);
    //   holidayDates = holidayDates.filter((x: any) => x.HolidayName !== DisableWeekdays.SUNDAY);
    //   holidayDates = holidayDates.filter((x: any) => x.HolidayName !== DisableWeekdays.MONDAY);
    // }
    let isHoliday = holidayDates.some((x: any) => formatDate(x.HolidayDate, 'MM-dd-yyyy', 'en') === formatDate(date, 'MM-dd-yyyy', 'en'));
    return isHoliday;
  }
  changeApplyingFor($event: any) {
    switch ($event.target.value) {
      case "1":
        this.selectedType = 1;
        this.teamMembers = [];
        break;
      case "2":
        this.selectedType = 2;
        this.getMyTeamMembers();
        break;
      case "3":
        this.selectedType = 3;
        this.getMyTeamMembers();
        break;
    };
  }

  getMyTeamMembers() {
    let applyingFor = this.selectedType;
    let searchCritera =
    {
      ManagerId: this.employeeProfile.EmployeeSlno,
      IncludeSelf: applyingFor
    }
    return this.employeeInformationService.getMyTeamMembers(searchCritera)
      .toPromise()
      .then((data: any) => {
        this.teamMembers = data.Items;
      });
  }
  onchageFromDayType(e: any) {
    let fromDate = this.datePipe.transform(this.leaveForm.controls['LeaveFrom'].value, "dd-MMM-yyyy");
    let toDate = this.datePipe.transform(this.leaveForm.controls['LeaveTo'].value, "dd-MMM-yyyy");
    if (fromDate == toDate && (fromDate != null || toDate != null)) {
      this.leaveForm.patchValue({
        ToDateDayTypeId: e.target.value
      });
    }
  }
  changeToDate(event: any) {
    if (event.selectedDates !== undefined && event.selectedDates.length > 0) {
      let fromDate = this.datePipe.transform(this.leaveForm.controls['LeaveFrom'].value, "dd-MMM-yyyy");
      let toDate = this.datePipe.transform(event.selectedDates[0], "dd-MMM-yyyy");
      if (fromDate == toDate) {
        this.leaveForm.patchValue({
          ToDateDayTypeId: this.leaveForm.controls["FromDateDayTypeId"].value
        });
        this.toDateDayTypeHide = true;
      }
      else {
        this.leaveForm.patchValue({
          ToDateDayTypeId: this.leaveForm.controls["FromDateDayTypeId"].value
        });
        this.toDateDayTypeHide = false;
      }
      // this.leaveFileUploadEnable(this.leaveForm.controls['LeaveFrom'].value, event.selectedDates[0])
    }
  }
  applyOnDutyRequest() {

    // let holiday = this.holidays.find((s: any) => this.datePipe.transform(s.HolidayDate, "dd-MMM-yyyy") == this.datePipe.transform(this.leaveForm.value.LeaveFrom, "dd-MMM-yyyy") || this.datePipe.transform(s.HolidayDate, "dd-MMM-yyyy") == this.datePipe.transform(this.leaveForm.value.LeaveTo, "dd-MMM-yyyy"));
    // if (holiday) {
    //   Swal.fire({
    //     title: 'There are some holiday(s) in the selected dates.',
    //     html: '<p class="text-danger" >' + holiday.HolidayName + '</p>',
    //     icon: 'info',
    //     confirmButtonColor: 'rgb(54, 69, 116)',
    //     confirmButtonText: 'Ok'
    //   });
    //   return;
    // }
    this.isSubmitted = true;
    // var selectedRows;
    // if (this.dataGrid) {
    //   selectedRows = this.dataGrid.instance.getSelectedRowsData();
    //   var data = selectedRows.map(x => x.EmployeeSlno);
    this.leaveForm.controls['SelectedEmployees'].patchValue([]);
    // }
    // if (this.selectedType !== 1 && selectedRows) {
    //   let leaveRequest = this.leaveForm.value;
    //   this.leaveManagementService.applyLeave(leaveRequest).pipe(finalize(() => this.isSubmitted = false))
    //     .subscribe((item: any) => {
    //       if (item) {
    //         if (item.Response) {
    //           this.isSubmitted = false;
    //           this.applyLeaveSuccessMsg();
    //         }
    //         else {
    //           this.isSubmitted = false;
    //           Swal.fire({
    //             title: 'Oops...! Something went Wrong !',
    //             html: '<p class="text-danger" >' + item.Message + '</p>',
    //             icon: 'error',
    //             confirmButtonColor: 'rgb(54, 69, 116)',
    //             confirmButtonText: 'Ok'
    //           });
    //         }
    //       }
    //       else {
    //         this.isSubmitted = false;
    //         Swal.fire({
    //           title: 'Oops...! Something went Wrong !',
    //           html: 'Your leaves are not applied.',
    //           icon: 'error',
    //           confirmButtonColor: 'rgb(54, 69, 116)',
    //           confirmButtonText: 'Ok'
    //         });
    //       }
    //     });
    // }
    // else if (this.selectedType === 1) {
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
    // }
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
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
