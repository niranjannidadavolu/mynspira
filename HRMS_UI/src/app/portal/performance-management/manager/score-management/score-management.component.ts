import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { finalize } from 'rxjs/operators';
import { StorageService } from 'src/app/core/services';
import { DataService } from 'src/app/core/services/helper/data-service';
import { ManagerPerformanceEvaluationService } from 'src/app/core/services/perfomance-management/manager-performance-evaluation.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-score-management',
  templateUrl: './score-management.component.html',
  styleUrls: ['./score-management.component.scss']
})
export class ScoreManagementComponent implements OnInit {
  breadCrumbItems: any;
  filterSettings: any;
  loggedInUser: any;
  isLoaded: any;
  assignedDepartments: any;
  employeeProfile: any;
  data: any;
  groupSettings: any;

  constructor(
    private router: Router,
    private readonly storageService: StorageService,
    private readonly managerPerformanceEvaluationService: ManagerPerformanceEvaluationService,
    private readonly dataService: DataService
  ) { 
    this.breadCrumbItems = [
      { label: 'PMS' },
      { label: 'Score Management', active: true }
    ];
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.filterSettings = { type: 'Menu' };
    this.groupSettings = { showDropArea: false, columns: ["DesignationName"] };
  }

  ngOnInit(): void {
    this.loadAssignedDepartments();
  }

  loadAssignedDepartments() {
    let employeeSlno = 0;
    employeeSlno = this.employeeProfile.EmployeeSlno;
    this.managerPerformanceEvaluationService.GetAssignedDepartmentInformations(employeeSlno)
      .pipe(finalize(() => this.isLoaded = false))
      .subscribe((data: any) => {
        this.assignedDepartments = data;
      },
        (error: any) => {
          this.isLoaded = false;
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Error while loading the mapped reviews.',
            footer: 'Please contact Administrator.'
          });
        });
  }

  viewKraInformation(data: any) {
    this.dataService.setReviewData(data);   
    this.router.navigate(['/portal/pms/manager/score-management/manage-score']);
  }
}
