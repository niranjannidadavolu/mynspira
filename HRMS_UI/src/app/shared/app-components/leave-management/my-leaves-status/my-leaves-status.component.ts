import { Component, Input, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { LeaveDetail } from 'src/app/core/models/leave-management/emp-leave-detail.model';
import { StorageService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-my-leaves-status',
  templateUrl: './my-leaves-status.component.html',
  styleUrls: ['./my-leaves-status.component.scss']
})
export class MyLeavesStatusComponent implements OnInit {
  statusId: number = 0;
  employeeProfile: any;
  gridData: any;
  subscriptionName: Subscription;

  constructor(private readonly leaveService: LeaveManagementService,
    private readonly storageService: StorageService,) {

    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.cancelLeave = this.cancelLeave.bind(this);
    this.subscriptionName = new Subscription();
  }

  ngOnInit(): void {
    this.subscriptionName = this.leaveService.getUpdate().subscribe
      ((isApplyLeave: boolean) => { //message contains the data sent from service
        if (isApplyLeave) {
          this.getLeaveDetails();
        }
      });
    this.getLeaveDetails();
  }

  cancelLeave(event: any) {
    this.cancelLeaveRequest(event.data);
  }

  getLeaveDetails() {
    this.leaveService.getMyLeaves(this.employeeProfile.EmployeeSlno, this.statusId,true).subscribe(data => {
      this.gridData = data;
    });
  }
  cancelLeaveRequest(data: any) {
    // let cancelLeave = new LeaveDetail();
    // cancelLeave.LeaveId = data.LeaveId;
    // cancelLeave.ManagerId = this.employeeProfile.EmployeeSlno;
    // cancelLeave.LeaveStatusId = 5;
    this.leaveService.cancelEmpLeave(data.LeaveId,this.employeeProfile.EmployeeSlno).subscribe(data => {
      if (data) {
        this.leaveService.sendUpdate(true);
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, your leaves are successfully cancelled.',
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: 'Your leaves are not cancelled.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    })
  }
}
