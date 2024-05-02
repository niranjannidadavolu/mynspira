import { FormGroup, Validators } from '@angular/forms';
import { FormBuilder } from '@angular/forms';
import { Component, OnInit } from '@angular/core';
import { finalize } from 'rxjs/operators';
import { EmployeeService, StorageService } from 'src/app/core/services';
import { ReportTypeService } from 'src/app/core/services/masters/report-type.service';
@Component({
  selector: 'app-team-attendance',
  templateUrl: './team-attendance.component.html',
  styleUrls: ['./team-attendance.component.scss']
})
export class TeamAttendanceComponent implements OnInit {
  loggedInUser: any;
  processed: boolean | undefined;
  attendance: any = [];
  reportForList: any = [];
  reportFor: any = 1;
  teamAttendanceForm: FormGroup;
  minDate: any;
  maxDate: any;
  pageSettings: any;
  filterSettings: any;
  loadingIndicator: any;
  constructor(
    private readonly employeeService: EmployeeService,
    private readonly reportTypeService: ReportTypeService,
    private readonly storageService: StorageService,
    private readonly fb: FormBuilder
  ) {
    let value = this.storageService.get("LoggedInUser", 1);
    if (value) {
      this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    }
    this.teamAttendanceForm = this.fb.group({
      ReportingManagerSlno: [this.loggedInUser.EmployeeSlno],
      StartDate: [null],
      EndDate: [null],
      ReportFor: ['', Validators.required]
    })
  }
  ngOnInit(): void {
    this.pageSettings = { pageCount: 14 };
    this.filterSettings = { type: 'Menu' };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
    this.getEmployeeTimeSheet();
    this.GetAttendanceReportTypes();
  }
  // disabledDay(date: any) {
  //   return (date.getDay() == 0);
  // }
  get f() { return this.teamAttendanceForm.controls; }
  onReportTypeChange(event: any) {
    if (event.target.value.toString() == "8") {
      this.teamAttendanceForm.controls['StartDate'].setValidators([Validators.required])
      this.teamAttendanceForm.controls['StartDate'].updateValueAndValidity();
      this.teamAttendanceForm.controls['EndDate'].setValidators([Validators.required])
      this.teamAttendanceForm.controls['EndDate'].updateValueAndValidity();
    } else {
      this.teamAttendanceForm.controls['StartDate'].clearValidators();
      this.teamAttendanceForm.controls['StartDate'].updateValueAndValidity();
      this.teamAttendanceForm.controls['EndDate'].clearValidators();
      this.teamAttendanceForm.controls['EndDate'].updateValueAndValidity();
    }
  }
  onDateChange(event: any) {
    this.teamAttendanceForm.controls['EndDate'].patchValue(event.selectedDates[0]);
  }
  getEmployeeTimeSheet() {
    if (this.teamAttendanceForm.invalid) {
      return;
    }
    this.employeeService.getTeamAttendance(this.teamAttendanceForm.value)
      .pipe(finalize(() => this.processed = true))
      .subscribe(data => {
        if (data) {
          this.attendance = data;
        }
      });
  }
  GetAttendanceReportTypes() {
    this.reportTypeService.GetAttendanceReportTypes().subscribe((data: any) => {
      if (data) {
        this.reportForList = data;
      }
    });
  }
  onCellPrepared(e: any) {
    if (e.rowType === "data" && (e.column.dataField === "First_Half" || e.column.dataField === "Second_Half")) {
      if (e.data.First_Half !== 'ABSENT') {
        if (e.data.Holiday_Type === 1) {
          e.cellElement.style.color = 'blue';
        }
        else {
          if (e.data.First_Half === 'ON DUTY') {
            e.cellElement.style.color = '#00cc00';
          }
        }
      }
      else {
        e.cellElement.style.color = 'red';
      }
      if (e.data.Second_Half !== 'ABSENT') {
        if (e.data.Holiday_Type === 1) {
          e.cellElement.style.color = 'blue';
        }
        else {
          if (e.data.Second_Half === 'ON DUTY') {
            e.cellElement.style.color = '#00cc00';
          }
        }
      }
      else {
        e.cellElement.style.color = 'red';
      }
    }
  }
}
