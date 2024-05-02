import { DatePipe, formatDate } from '@angular/common';
import { Component, Input, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { DxDataGridComponent } from 'devextreme-angular';
import { finalize } from 'rxjs/operators';
import { LeaveType } from 'src/app/core/enum/application-enums';
import { EmployeeService, StorageService, UserInformationService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { LeaveTypeService, LeaveDayTypeService } from 'src/app/core/services/masters';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-early-logout-time',
  templateUrl: './early-logout-time.component.html',
  styleUrls: ['./early-logout-time.component.scss']
})
export class EarlyLogoutTimeComponent implements OnInit , OnDestroy{
  @Input() public selectedRowData: any;
  isSubmitted: boolean;
  leaveForm: any;
  employeeProfile: any;
  fromDisableDate: any = '';
  toDisableDate: any = '';

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
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.leaveForm = this.formBuilder.group({
      EmployeeSlno: new FormControl(),
      ApplyingFor: new FormControl('1'),
      LeaveFrom: new FormControl('', [Validators.required]),
      FromDateDayTypeId: ['3'],
      LeaveTo: new FormControl('', [Validators.required]),
      ToDateDayTypeId: ['3'],
      LeaveType: new FormControl(''),
      Remarks: new FormControl('', [Validators.required]),
      LeaveTypeName: new FormControl(''),
      SelectedEmployees: new FormControl([]),
      LeaveFileUploads: new FormArray([]),
      CompOffDate: new FormControl(''),
      EarlyLogoutTimeDisplay: new FormControl(''),
      EarlyLogoutTime: new FormControl('')
    });
    this.leaveForm.controls['EmployeeSlno'].patchValue(this.employeeProfile.EmployeeSlno);
    this.getLeaveTypes();
  }

  ngOnInit(): void {
    let earlyLogoutDate = this.datePipe.transform(this.selectedRowData.AttendanceDate, 'dd-MMM-yyyy');
    this.leaveForm.controls['LeaveFrom'].patchValue(earlyLogoutDate);
    this.leaveForm.controls['LeaveTo'].patchValue(earlyLogoutDate);
    this.fromDisableDate = formatDate(this.selectedRowData.AttendanceDate, 'dd-MMM-yyyy', 'en');
    this.toDisableDate = formatDate(this.selectedRowData.AttendanceDate, 'dd-MMM-yyyy', 'en');

  }

  getLeaveTypes() {
    this.leaveTypeService.getAssignedLeaveTypes(this.employeeProfile.EmployeeSlno).subscribe((data: any) => {
      let leavetype = data.find((x: any) => x.LeaveTypeId == LeaveType.EARLY_LOGOUT_TIME);
      this.leaveForm.controls['LeaveType'].patchValue(leavetype);
      let minutes = this.convertH2M(this.selectedRowData.TotalTime);
      let totalMinutes = 540;
      let earlyLogOffTime = this.toHoursAndMinutes(totalMinutes - minutes);
      this.leaveForm.controls['EarlyLogoutTimeDisplay'].patchValue(earlyLogOffTime);
      this.leaveForm.controls['EarlyLogoutTime'].patchValue(earlyLogOffTime);//totalMinutes-minutes
    });
  }
  convertH2M(timeInHour: any) {
    var timeParts = timeInHour.split(":");
    return Number(timeParts[0]) * 60 + Number(timeParts[1]);
  }
  toHoursAndMinutes(totalMinutes: any) {
    const hours = Math.floor(totalMinutes / 60);
    const minutes = totalMinutes % 60;
    let minutesval = '0' + Math.abs(minutes);
    let hoursval = '0' + Math.abs(hours);
    return hoursval.slice(-2) + ':' + minutesval.slice(-2);
  }


  applyEarlyLogOutRequest() {
    this.isSubmitted = true;
    let leaveRequest = this.leaveForm.value;
    this.leaveManagementService.applyLeave(leaveRequest).pipe(finalize(() => this.isSubmitted = false))
      .subscribe((item: any) => {
        if (item) {
          if (item.Response) {
            this.isSubmitted = false;
            this.applyLeaveSuccessMsg();
          }
          else {
            this.isSubmitted = false;
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
          this.isSubmitted = false;
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
