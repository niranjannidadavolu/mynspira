import { DatePipe } from '@angular/common';
import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { CalendarComponent, FocusEventArgs, PreventableEventArgs, RenderDayCellEventArgs } from '@syncfusion/ej2-angular-calendars';
import { finalize } from 'rxjs/operators';
import { LeaveType } from 'src/app/core/enum/application-enums';
import { StorageService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { LeaveTypeService, LeaveDayTypeService } from 'src/app/core/services/masters';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-apply-session-break-leave',
  templateUrl: './apply-session-break-leave.component.html',
  styleUrls: ['./apply-session-break-leave.component.scss']
})
export class ApplySessionBreakLeaveComponent implements OnInit {
  @ViewChild('fromDate')
  public fromDateControl?: CalendarComponent;
  @ViewChild('toDate')
  public toDateControl?: CalendarComponent;

  @Input() public selectedRowData: any;
  @Input() public selectedLeave: any;
  @Input() public fromDate: any;
  @Input() public toDate: any;
  @Input() public leaveType: any;
  @Input() holidays: any = [];

  leaveForm: FormGroup;
  employeeProfile: any;
  isSubmitted: boolean;
  leaveTypes: any;
  minDate: any;
  maxDate: any;
  toMinDate: any;

  get f() { return this.leaveForm.controls; }

  constructor(
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    private readonly leaveTypeService: LeaveTypeService,
    private readonly leaveDayTypeService: LeaveDayTypeService,
    private readonly leaveManagementService: LeaveManagementService,
    private readonly storageService: StorageService,
    private readonly datePipe: DatePipe
  ) {
    this.employeeProfile = this.storageService.getParsedData("EmployeeProfile", 1);
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
    this.getLeaveTypes();


    this.isSubmitted = false;
  }

  ngOnInit(): void {
    debugger;
    this.leaveForm.controls['EmployeeSlno'].patchValue(this.employeeProfile.EmployeeSlno);
    this.leaveForm.controls['LeaveType'].patchValue(this.leaveType);
    this.leaveForm.controls['LeaveTypeName'].patchValue(this.leaveType.LeaveTypeName);
    this.leaveForm.controls['LeaveBalance'].patchValue(this.leaveType.LeaveBalance);
  }

  onRenderCell(args: RenderDayCellEventArgs): void {
    if (args && args.date) {
      let currentDate = new Date(args.date).getDate();
      let currentMonth = new Date(args.date).getMonth();
      let currentYear = new Date(args.date).getFullYear();
      this.holidays.forEach(function (item: any) {
        let holidayDate = new Date(item.HolidayDate).getDate();
        let holidayMonth = new Date(item.HolidayDate).getMonth();
        let holidayYear = new Date(item.HolidayDate).getFullYear();
        if (currentDate === holidayDate && currentMonth == holidayMonth && currentYear === holidayYear) {
          args.isDisabled = true;
        }
      });
    }
  }

  onFromDateFocus(args: FocusEventArgs): void {
    //(this.fromDateControl as any).show();
  }

  onToDateFocus(args: FocusEventArgs): void {
    //(this.toDateControl as any).show();
  }


  getLeaveTypes() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.leaveTypeService.getAssignedLeaveTypes(employeeSlno).subscribe((data: any) => {
      let today;
      this.leaveTypes = data;
      this.leaveType = data.find((item: { LeaveTypeId: any; }) => item.LeaveTypeId === LeaveType.SESSION_BREAK);
      if (this.leaveType) {
        today = new Date();
        this.leaveForm.controls['LeaveBalance'].patchValue(this.leaveType.LeaveBalance);
        this.leaveForm.controls['LeaveType'].patchValue(this.leaveType);
        debugger;
        this.minDate = new Date(today.setDate(today.getDate() - this.leaveType.ApplyBeforeDays));
        this.maxDate = new Date(2024, 11, 31);
      }
    });
  }

  changeFromDate($event: any) {
    debugger;
    if ($event.value !== undefined) {
      this.leaveForm.controls['LeaveTo'].patchValue('');
      this.toMinDate = $event.value;
    }
  }

  applyLeaveRequest() {
    this.isSubmitted = true;

    //this.leaveForm.controls['LeaveTypeName'].patchValue('');
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
      return;
    }
    let leaveRequest = this.leaveForm.value;
    this.leaveManagementService.applyLeave(leaveRequest).pipe(finalize(() => this.isSubmitted = false))
      .subscribe({
        next: (item: any) => {
          if (item) {
            if (item.Response) {
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
        },
        error: () => { },
        complete: () => { }
      });
  }
}
