import { Component, OnInit, Output, EventEmitter, Input } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Subscription } from 'rxjs';
import { EmpLeaveBalance } from 'src/app/core/models/leave-management/emp-leave-balance.model';
import { StorageService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { LeaveTypeService } from 'src/app/core/services/masters';
import { ApplyLeaveComponent } from 'src/app/portal/leave-management/apply-leave/apply-leave.component';

@Component({
  selector: 'app-leave-types-dashboard',
  templateUrl: './leave-types-dashboard.component.html',
  styleUrls: ['./leave-types-dashboard.component.scss']
})
export class LeaveTypesDashboardComponent implements OnInit {
  employeeProfile: any;
  empLeaveBalance: EmpLeaveBalance[] = [];
  subscriptionName: Subscription;
  viewDetailsShow: boolean = false;
  leaveTypes: any = [];
  @Output() countEmit =  new EventEmitter();
  @Input() holidays: any = [];

  constructor(private readonly leaveService: LeaveManagementService,
    private readonly storageService: StorageService,
    private modalService: NgbModal,
    private readonly leaveTypeService: LeaveTypeService,
    ) {
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.subscriptionName = new Subscription();
  }

  ngOnInit(): void {
    this.subscriptionName = this.leaveService.getUpdate().subscribe
      ((isApplyLeave: boolean) => { //message contains the data sent from service
        if (isApplyLeave) {
          this.getEmployeeLeaveBalance();
        }
      });
    this.getEmployeeLeaveBalance();
    this.getLeaveTypes();
  }

  LunchModal(content: any) {
    this.modalService.open(content);
  }

  getEmployeeLeaveBalance() {
    this.countEmit.emit(false);
    this.leaveService.getEmployeeLeaveBalance(this.employeeProfile.EmployeeSlno).subscribe((data: any) => {
      this.empLeaveBalance = data;
      if(data.length){
        this.countEmit.emit(true);
      }
    });
  }
  getLeaveTypes() {
    let employeeSlno = this.employeeProfile.EmployeeSlno;
    this.leaveTypeService.getAssignedLeaveTypes(employeeSlno).subscribe((data: any) => {
      this.leaveTypes = data;
    });
  }

  applyLeave(leaveData: any) {

    if(leaveData.AvailableLeaveBalance >0){
      const modalRef = this.modalService.open(ApplyLeaveComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
      let leaveType = this.leaveTypes.find((s:any) => s.LeaveTypeId == leaveData.LeaveTypeId);
      
      modalRef.componentInstance.leaveType = leaveType;
      modalRef.componentInstance.holidays = this.holidays;
    }

  }
  

  ngOnDestroy() { // It's a good practice to unsubscribe to ensure no memory leaks
    this.subscriptionName.unsubscribe();
    this.modalService.dismissAll();
  }
}
