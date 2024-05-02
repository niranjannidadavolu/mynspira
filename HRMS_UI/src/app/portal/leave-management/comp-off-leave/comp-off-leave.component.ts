import { DatePipe, formatDate } from '@angular/common';
import { Component, Input, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { DxDataGridComponent } from 'devextreme-angular';
import CustomStore from 'devextreme/data/custom_store';
import { finalize } from 'rxjs/operators';
import { LeaveType, OfficeType } from 'src/app/core/enum/application-enums';
import { EmployeeService, StorageService, UserInformationService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { LeaveTypeService, LeaveDayTypeService } from 'src/app/core/services/masters';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-comp-off-leave',
  templateUrl: './comp-off-leave.component.html',
  styleUrls: ['./comp-off-leave.component.scss']
})
export class CompOffLeaveComponent implements OnInit , OnDestroy{
  @ViewChild(DxDataGridComponent, { static: false }) dataGrid: DxDataGridComponent | undefined;

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
  // @Input() public compOffDatesList: any= [];

  get f() { return this.leaveForm.controls; }
  fromDisableDate: any = '';
  toDisableDate: any = '';
  comOffDisableDate: any = '';

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
    this.searchForm = new FormGroup({
      searchValue: new FormControl('')
    });

    this.leaveForm = this.formBuilder.group({
      EmployeeSlno: new FormControl(),
      ApplyingFor: new FormControl('1'),
      LeaveFrom: new FormControl(new Date(), [Validators.required]),
      FromDateDayTypeId: ['1'],
      LeaveTo: new FormControl(new Date(), [Validators.required]),
      ToDateDayTypeId: ['1'],
      LeaveType: new FormControl(''),
      Remarks: new FormControl('', [Validators.required]),
      LeaveTypeName: new FormControl(''),
      SelectedEmployees: new FormControl([]),
      LeaveFileUploads:new FormArray([]),
      CompOffDate: new FormControl(''),
      EarlyLogoutTime: new FormControl('')

    });
    this.fromDisableDate = formatDate(new Date(), 'dd-MMM-yyyy', 'en');
    this.toDisableDate = formatDate(new Date(), 'dd-MMM-yyyy', 'en');
    this.leaveForm.controls['EmployeeSlno'].patchValue(this.employeeProfile.EmployeeSlno);
    this.getLeaveTypes();
    //this.getUtilizedOnDuties();
  }

  ngOnInit(): void {
    this.allMode = 'allPages';
    this.checkBoxesMode = 'always';
  }

  getLeaveTypes() {
    
    this.leaveTypeService.getAssignedLeaveTypes(this.employeeProfile.EmployeeSlno).subscribe((data: any) => {
      this.leaveTypes = data;
      let leavetype = this.leaveTypes.find((x: any) => x.LeaveTypeId == LeaveType.COMPENSATORY_OFF_LEAVE);
      this.leaveForm.controls['LeaveType'].patchValue(leavetype);
      this.leaveForm.controls['CompOffDate'].patchValue(new Date(this.selectedRowData.AttendanceDate));
    this.comOffDisableDate = formatDate(this.selectedRowData.AttendanceDate, 'dd-MMM-yyyy', 'en');
    });
  }

  changeFromDate(event: any) {
    
    if (event.selectedDates !== undefined && event.selectedDates.length > 0) {
      let selectedFromDate = event.selectedDates[0];
      this.leaveForm.controls['LeaveTo'].patchValue('');
      this.toMinDate = selectedFromDate;
    }
  }
  
  //Sunday Disabled
  // disabledDay(date: any) {
  //       return (date.getDay() === 0 );
  //     }
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

  applyCompOffRequest() {    
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
