import { Component, OnInit, ViewChild } from '@angular/core';
import { FormGroup, FormBuilder, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { GridComponent } from '@syncfusion/ej2-angular-grids';
import { finalize } from 'rxjs/operators';
import { ReviewerType } from 'src/app/core/enum/application-enums';
import { EmployeePerformanceReviewService, StorageService } from 'src/app/core/services';
import { DataService } from 'src/app/core/services/helper/data-service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-view-review-detail',
  templateUrl: './view-review-detail.component.html',
  styleUrls: ['./view-review-detail.component.scss']
})
export class ViewReviewDetailComponent implements OnInit {
  @ViewChild("grid", { static: false }) public grid: GridComponent | undefined;
  breadCrumbItems: any;
  isLoaded: any;
  employeeProfile: any;
  aggregates: any;
  pageSettings: any;
  editSettings: any;
  groupSettings: any;
  filterSettings: any;
  mode: string;
  reviewData: any;
  reviewForm: FormGroup;
  kraInformation: any;

  constructor(
    private readonly router: Router,
    private readonly formBuilder: FormBuilder,
    private readonly employeePerformanceReviewService: EmployeePerformanceReviewService,
    private readonly storageService: StorageService,
    private readonly dataService: DataService
  ) {
    this.dataService.getReviewData().subscribe((data) => {
      this.reviewData = data;
      if (!this.reviewData) {
        this.router.navigate(["portal/pms/employee/my-reviews"]);
      }
    });
    this.breadCrumbItems = [
      { label: "PMS" },
      { label: "Appraiser Evaluation", active: true },
    ];

    this.employeeProfile = this.storageService.getParsedData("EmployeeProfile", 1);

    this.editSettings = {
      allowEditing: true,
      allowAdding: true,
      allowDeleting: true,
    };
    this.pageSettings = { pageSize: 5 };
    this.groupSettings = { showDropArea: false, columns: ["KraName"] };
    this.filterSettings = { type: "Menu" };
    this.mode = "CheckBox";
    this.reviewForm = this.formBuilder.group({
      EmployeeSlno: new FormControl(),
      EmployeeName: new FormControl(),
      EmployeeId: new FormControl(),
      IsDraft: new FormControl(),
      IsSubmitted: new FormControl(),
      ReviewId: new FormControl(),
      ReviewNumber: new FormControl(),
      EmployeeComments: new FormControl(''),
      AppraiserComments: new FormControl(''),
      ReviewerComments: new FormControl(''),
    });
  }

  getEmployeeReviewInformation(kraInformationId: any) {

    this.employeePerformanceReviewService
      .getEmployeeReviewInformation(kraInformationId)
      .pipe(finalize(() => (this.isLoaded = false)))
      .subscribe(
        (data: any) => {
          debugger;
          this.kraInformation = data;
          this.reviewForm.patchValue({
            EmployeeSlno: data.EmployeeSlno,
            EmployeeName: data.EmployeeName,
            EmployeeId: data.EmployeeId,
            IsDraft: data.IsDraft,
            IsSubmitted: data.IsSubmitted,
            EmployeeComments: data.EmployeeComments,
            ReviewId: data.ReviewId,
            ReviewNumber: data.ReviewNumber,
            AppraiserComments: data.AppraiserComments,
            ReviewerComments: data.ReviewerComments,
          });
          //this.keyPerformanceIndices = data;
        },
        (error: any) => {
          this.isLoaded = false;
          Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Error while loading the Employee review information",
            footer: "Please contact Administrator.",
          });
        }
      );
  }
  ngOnInit(): void {
    if (this.reviewData) {
      this.getEmployeeReviewInformation(this.reviewData.ReviewId);
    }
  }

  onActionComplete(args: any): void {
    if (args && args.requestType === "save") {
      debugger;
      if (this.grid) {
        this.grid.endEdit();
        let foundIndex = this.kraInformation.EmployeeReviewDetails.findIndex((x: any) => x.KpiSlno === args.data.KpiSlno && x.KraSlno === args.data.KraSlno);
        if (foundIndex !== -1) {
          this.kraInformation.EmployeeReviewDetails[foundIndex] = args.data;
        }
        //this.validateAggregates(args);
        //this.updatedData.push(args.data);

      }
    }
  }

  submitReview() {
    debugger;
    if (this.reviewForm.valid) {
      let sum: number = 0;
      this.kraInformation.EmployeeReviewDetails.forEach((a: any) => sum += a.AppriserScore);
      this.kraInformation.AppriserScore = sum;
      this.kraInformation.IsDraft = false;
      this.kraInformation.IsSubmitted = true;
      this.kraInformation.IsAppriserReviewer = true;
      this.employeePerformanceReviewService.saveEmployeePerformanceReview(this.kraInformation, ReviewerType.Appriser).subscribe((data: any) => {
        if (data) {

        }
      });
    }
  }

  saveReview() {
    debugger;
    if (this.reviewForm.valid) {
      let sum: number = 0;
      this.kraInformation.EmployeeReviewDetails.forEach((a: any) => sum += parseFloat(a.AppriserScore));
      this.kraInformation.AppriserScore = sum;
      this.kraInformation.IsDraft = true;
      this.kraInformation.IsSubmitted = false;
      this.employeePerformanceReviewService.saveEmployeePerformanceReview(this.kraInformation, ReviewerType.Appriser).subscribe((data: any) => {
        if (data) {

        }
      });
    }
  }

  cancelReview() {
    this.router.navigate(["portal/pms/employee/my-reviews"])
  }

}
