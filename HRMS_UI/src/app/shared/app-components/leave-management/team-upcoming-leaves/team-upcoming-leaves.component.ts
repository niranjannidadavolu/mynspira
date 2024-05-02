import { Component, OnInit } from '@angular/core';
import { StorageService } from 'src/app/core/services';
import { LeaveManagementService } from 'src/app/core/services/leave-management';

@Component({
  selector: 'app-team-upcoming-leaves',
  templateUrl: './team-upcoming-leaves.component.html',
  styleUrls: ['./team-upcoming-leaves.component.scss']
})
export class TeamUpcomingLeavesComponent implements OnInit {
  employeeProfile: any;
  gridData: any;

  constructor(private readonly leaveService: LeaveManagementService,
    private readonly storageService: StorageService,) {
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));

  }

  ngOnInit(): void {
    this.getUpComingLeaves();

  }

  getUpComingLeaves() {
    this.leaveService.getUpComingLeaves(this.employeeProfile.EmployeeSlno).pipe().subscribe(data => {
      this.gridData = data;
    });
  }
}
