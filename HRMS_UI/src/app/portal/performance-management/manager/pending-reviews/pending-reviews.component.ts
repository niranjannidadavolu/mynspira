import { data } from 'jquery';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { finalize } from 'rxjs/operators';
import { EmployeePerformanceReviewService, StorageService } from 'src/app/core/services';
import { DataService } from 'src/app/core/services/helper/data-service';
import Swal from 'sweetalert2';

@Component({
  selector: "app-pending-reviews",
  templateUrl: "./pending-reviews.component.html",
  styleUrls: ["./pending-reviews.component.scss"],
})
export class PendingReviewsComponent implements OnInit {
  loadingIndicator: { indicatorType: string };
  filterSettings: { type: string };
  data: any;
  breadCrumbItems: any;
  appraiserForm: FormGroup;
  pendingReviews: any;
  nonSubmittedReviews: any;
  countryParams: any;
  editSettings: any;
  groupSettings: any;
  pageSettings: any;
  isLoaded: any;
  employeeProfile: any;

  constructor(
    private fb: FormBuilder,
    private readonly router: Router,
    private readonly employeePerformanceReviewService: EmployeePerformanceReviewService,
    private readonly storageService: StorageService,
    private readonly dataService: DataService
  ) {
    this.appraiserForm = this.fb.group({
      DepartmentSlno: new FormControl(),
      DesignationSlno: new FormControl(),
      EmployeeSlno: new FormControl(),
      KRAKPIList: new FormControl(),
    });
    this.filterSettings = { type: "Menu" };
    this.loadingIndicator = { indicatorType: "Shimmer" };
    this.breadCrumbItems = [
      { label: "PMS" },
      { label: "Appraiser Evaluation", active: true },
    ];
    this.editSettings = {
      allowEditing: true,
      allowAdding: true,
      allowDeleting: true,
    };
    this.groupSettings = { showDropArea: false, columns: ["KraName"] };
    this.pageSettings = {
      pageSize: 20,
      pageSizes: ["5", "10", "15", "20", "All"],
    };
    this.employeeProfile = this.storageService.getParsedData(
      "EmployeeProfile",
      1
    );
    this.getEmployeePendingReviewInformation(this.employeeProfile.EmployeeSlno);
    this.getEmployeeNonSubmittedInformation(this.employeeProfile.EmployeeSlno);
  }

  ngOnInit(): void {
    // this.getEmployeePendingReviewInformation(this.employeeProfile.employeeSlno);
  }

  getEmployeePendingReviewInformation(employeeSlno: any) {
    this.employeePerformanceReviewService
      .getAppraiserPendingReviewInformations(employeeSlno)
      .pipe(finalize(() => (this.isLoaded = false)))
      .subscribe(
        (data: any) => {
          this.pendingReviews = data;
          //console.log(data);
        },
        (error: any) => {
          this.isLoaded = false;
          Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Error while loading the Employee pending review information",
            footer: "Please contact Administrator.",
          });
        }
      );
  }

  getEmployeeNonSubmittedInformation(managerId: any) {
    
    this.employeePerformanceReviewService
      .getEmployeeNonSubmittedDetails(managerId)
      .pipe(finalize(() => (this.isLoaded = false)))
      .subscribe(
        (data: any) => {
          this.nonSubmittedReviews = data;
          //console.log(data);
        },
        (error: any) => {
          this.isLoaded = false;
          Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Error while loading the Employee pending review information",
            footer: "Please contact Administrator.",
          });
        }
      );
  }

  employeePendingReview(data: any) {
    this.dataService.setReviewData(data);
    this.router.navigate(["/portal/pms/manager/employee-pending-review"]);
  }

  alertEmployee() {}

  onActionComplete(args: any): void {}

  onSubmit() {}

  onDataBound(args: any): void {
    // clearTimeout(this.clrIntervalFun);
    // clearInterval(this.intervalFun);
    // this.dtTime = true;
  }
}
