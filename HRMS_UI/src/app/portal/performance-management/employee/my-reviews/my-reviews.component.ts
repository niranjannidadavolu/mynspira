import { Component, OnInit, ViewChild } from "@angular/core";
import { FormBuilder } from "@angular/forms";
import { Router } from "@angular/router";
import { GridComponent } from "@syncfusion/ej2-angular-grids";
import { finalize } from "rxjs/operators";
import {
  EmployeePerformanceReviewService,
  StorageService,
} from "src/app/core/services";
import { DataService } from "src/app/core/services/helper/data-service";
import Swal from "sweetalert2";

@Component({
  selector: "app-my-reviews",
  templateUrl: "./my-reviews.component.html",
  styleUrls: ["./my-reviews.component.scss"],
})
export class MyReviewsComponent implements OnInit {
  @ViewChild("grid", { static: false }) public grid: GridComponent | undefined;
  filterSettings: { type: string };
  loadingIndicator: { indicatorType: string };
  breadCrumbItems: (
    | { label: string; active?: undefined }
    | { label: string; active: boolean }
  )[];
  editSettings: {
    allowEditing: boolean;
    allowAdding: boolean;
    allowDeleting: boolean;
  };
  groupSettings: { showDropArea: boolean; columns: string[] };
  pageSettings: { pageSize: number; pageSizes: string[] };
  employeeProfile: any;
  isLoaded: boolean;
  employeeReviews: any;

  constructor(
    private fb: FormBuilder,
    private readonly router: Router,
    private readonly employeePerformanceReviewService: EmployeePerformanceReviewService,
    private readonly storageService: StorageService,
    private readonly dataService: DataService
  ) {
    this.isLoaded = false;
    this.filterSettings = { type: "Menu" };
    this.loadingIndicator = { indicatorType: "Shimmer" };
    this.breadCrumbItems = [
      { label: "PMS" },
      { label: "My Reviews", active: true },
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
  }

  ngOnInit(): void {
    this.getEmployeeReviewInformations(this.employeeProfile.EmployeeSlno);
  }

  getEmployeeReviewInformations(employeeSlno: any) {
    this.employeePerformanceReviewService
      .getEmployeeReviewInformations(employeeSlno)
      .pipe(finalize(() => (this.isLoaded = false)))
      .subscribe(
        (data: any) => {
          this.employeeReviews = data;
        },
        (error: any) => {
          this.isLoaded = false;
          Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Error while loading the Employee review informations",
            footer: "Please contact Administrator.",
          });
        }
      );
  }
  dataBound(args: any) {
    if (this.grid) {
      this.grid.autoFitColumns();
    }
  }
  gotoEmployeeReview(data: any) {
    this.dataService.setReviewData(data);
    this.router.navigate(["portal/pms/employee/submit-review"]);
  }

  viewReviewDetails(data: any) {
    this.dataService.setReviewData(data);
    this.router.navigate(["portal/pms/view-review"]);
  }

  revokeReviewDetails(data: any) {
    Swal.fire({
      title: "Are you sure, you want to Revoke the Sumitted Review?",
      text: "You won't be able to revert this!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, revoke it!"
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: "Deleted!",
          text: "Your review has been revoked.",
          icon: "success"
        });
      }
    });
  }
}
