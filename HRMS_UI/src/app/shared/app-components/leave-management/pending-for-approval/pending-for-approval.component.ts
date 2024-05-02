import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Subscription } from 'rxjs';
import { StorageService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';

@Component({
  selector: 'app-pending-for-approval',
  templateUrl: './pending-for-approval.component.html',
  styleUrls: ['./pending-for-approval.component.scss']
})
export class PendingForApprovalComponent implements OnInit {

  
  employeeProfile: any;
  gridData: any;
  pendingLeaves: any;
  subscriptionName: Subscription;

  constructor(
    private readonly leaveService: LeaveManagementService,
    private readonly storageService: StorageService,
    private router: Router, private modalService: NgbModal) {
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.subscriptionName = new Subscription();}


  ngOnInit(): void {
    this.subscriptionName = this.leaveService.getUpdate().subscribe
    ((isApplyLeave: boolean) => { //message contains the data sent from service
      if (isApplyLeave) {
        this.getApprovalLeaveDetails();
      }
    });
    this.getApprovalLeaveDetails();
  }

  getApprovalLeaveDetails() {
    this.leaveService.getPendingLeaves(this.employeeProfile.EmployeeSlno).subscribe((data: any) => {
      this.pendingLeaves = data;
    });
  }

  approveLeave(row: any) {
    
  }

}
