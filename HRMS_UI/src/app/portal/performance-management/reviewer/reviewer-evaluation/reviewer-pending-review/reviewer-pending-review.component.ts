import { Component, OnInit, ViewChild } from "@angular/core";
import { EmployeePerformanceReviewService,StorageService } from "src/app/core/services";
import { GridComponent } from "@syncfusion/ej2-angular-grids";
import { FormBuilder, FormControl, FormGroup, Validators } from "@angular/forms";
import { finalize } from "rxjs/operators";
import Swal from "sweetalert2";
import { DataService } from "src/app/core/services/helper/data-service";
import { ReviewerType } from "src/app/core/enum/application-enums";
import { Router } from "@angular/router";

@Component({
  selector: 'app-reviewer-pending-review',
  templateUrl: './reviewer-pending-review.component.html',
  styleUrls: ['./reviewer-pending-review.component.scss']
})
export class ReviewerPendingReviewComponent implements OnInit {
  @ViewChild("grid", { static: false }) public grid: GridComponent | undefined;
  breadCrumbItems: any;
  isLoaded: any;
  employeeProfile: any;
  aggregates: any;
  pageSettings: any;
  editSettings: any;
  groupSettings: any;
  filterSettings: any;
  reviewData: any;
  reviewForm: FormGroup;
  columns: any
  kraInformation: any;
  public reviewValidationRules?: object;
  errorRowIndex: any;
  errorColumnField: any;
  hasValidationErrors: any;
  public isValidScores: boolean = false;
  employeeScoreValidationRule: { customRules: { name: string; validator: (args: any) => boolean; errorMessage: string; }[]; };
  queryCellInfo(args: any): void {
   
    if (args.column.field === 'EmployeeScore') {
      const rowIndex = args.rowIndex;
      const data = args.data as any;
      const age = data['MaxScore'];
      const employeeScore = data['EmployeeScore'];
    if (employeeScore > age) {
        args.cell.classList.add('validation-error'); 
        args.cell.title = 'Employee Score must be less than or equal to Max Score.'; 
        this.errorRowIndex = rowIndex;
        this.errorColumnField = args.column.field;
        this.hasValidationErrors = true;
        if (this.errorRowIndex !== null && this.errorColumnField !== null && this.grid) {
          this.grid.selectCell({ rowIndex: this.errorRowIndex });
        }
      }
    }
  }
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
        this.router.navigate(["portal/pms/reviewer/reviewer-evaluation"]);
      }
    });
    this.breadCrumbItems = [
      { label: "PMS" },
      { label: "Reviewer Evaluation", active: true },
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
    this.employeeScoreValidationRule = {
      customRules: [{
        name: 'customValidation',
        validator: (args: any) => {
       
          const data = args.value;
          const otherCellValue = args.data['MaxScore'];
          return data <= otherCellValue;
        },
        errorMessage: 'Reviewer Score must be less than or equal to the Max Score Value.'
      }]
    };
    this.groupSettings = { showDropArea: false, columns: ["KraName"] };
    this.filterSettings = { type: "Menu" };
    this.reviewValidationRules = { required: true };
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
      ReviewerComments: new FormControl('',[Validators.required, Validators.maxLength(1000)]),
    });
  }

  ngOnInit(): void {
    if (this.reviewData) {
      this.getEmployeeReviewInformation(this.reviewData.ReviewId);
    }
  }

  load() {
   
    (this.grid as GridComponent).element.addEventListener('mouseup', (e) => {
      if ((e.target as HTMLElement).classList.contains("e-rowcell")) {
        if ((this.grid as GridComponent).isEdit)
          (this.grid as GridComponent).endEdit();
        let index: number = parseInt(((e.target as HTMLElement).getAttribute("Index") as string));
        (this.grid as GridComponent).selectRow(index);
        (this.grid as GridComponent).startEdit();
      };
    });
  }
  public onActionBegin(args: any): void {
  
    if (args.requestType === 'save') {
      let ReviewerScore = args.data.ReviewerScore;
      let MaxScore = args.data.MaxScore;
      if (ReviewerScore > MaxScore || ReviewerScore < 0) {
        this.updateButtonState();
        Swal.fire({
          title: "Oops...! Something went Wrong !",
          text: "Reviewer Score must be Less than or equal to the Maximum Score.",
          icon: "warning",
          confirmButtonColor: "rgb(54, 69, 116)",
          confirmButtonText: "Ok",
        }).then(() => {
        });
        args.cancel = true;
      }
    }


  }
  updateButtonState(): void {
   
    this.isValidScores = this.hasValidationErrors;
  }
  getEmployeeReviewInformation(kraInformationId: any) {
   
    this.employeePerformanceReviewService
      .getEmployeeReviewInformation(kraInformationId)
      .pipe(finalize(() => (this.isLoaded = false)))
      .subscribe(
        (data: any) => {
          console.log(data);
          
          this.kraInformation = data;
          this.reviewForm.patchValue({
            EmployeeSlno: data.EmployeeSlno,
            EmployeeName: data.EmployeeName,
            EmployeeId: data.EmployeeId,
            IsDraft: data.IsDraft,
            IsSubmitted: data.IsSubmitted,
            EmployeeComments: data.EmployeeComments,
            AppraiserComments: data.AppraiserComments,
            ReviewerComments: data.ReviewerComments,
            ReviewId: data.ReviewId,
            ReviewNumber: data.ReviewNumber
          });
        
        },
        (error: any) => {
          this.isLoaded = false;
          Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Error while loading the Employee reviewer review information",
            footer: "Please contact Administrator.",
          });
        }
      );
  }

  onActionComplete(args: any): void {
    if (args.requestType === 'save' && this.grid) {
      this.grid.endEdit(); 

      
      const foundIndex = this.kraInformation.EmployeeReviewDetails.findIndex((x: any) => x.KpiSlno === args.data.KpiSlno && x.KraSlno === args.data.KraSlno);

      if (foundIndex !== -1) {
      
        if (args.data.EmployeeScore >= 0) {
       
          this.kraInformation.EmployeeReviewDetails[foundIndex] = { ...args.data };
          this.validateGridData();

         
          this.isValidScores = !this.hasValidationErrors;
        } else {
          
          console.log("Negative scores are not allowed.");
        }
      }
    }
  }
  validateGridData(): void {
    this.hasValidationErrors = false;
    const data = this.grid?.dataSource as any[];
    if (data) {
      data.forEach((item, index) => {
        const ReviewerScore = item['ReviewerScore'];
        const maxScore = item['MaxScore'];

        if (ReviewerScore < 0 || ReviewerScore > maxScore) {
          this.hasValidationErrors = true;
          this.errorRowIndex = index;
          this.errorColumnField = 'ReviewerScore';
          return;
        }
      });
    }
  }

  submitReview() {
   
    if (this.reviewForm.valid) {
      let sum: number = 0;
      this.kraInformation.ReviewerComments = this.reviewForm.value.ReviewerComments;
      this.kraInformation.EmployeeReviewDetails.forEach((a: any) => sum += a.ReviewerScore);
      this.kraInformation.ReviewerScore = sum;
      this.kraInformation.ReviewerComments;
      this.kraInformation.IsDraft = false;
      this.kraInformation.IsSubmitted = true;
      this.kraInformation.IsAppraiserReviewed = true;
      this.kraInformation.IsReviewerReviewed = true;
      this.employeePerformanceReviewService.saveEmployeePerformanceReview(this.kraInformation, ReviewerType.Reviewer).subscribe((data: any) => {
        if (data) {
          Swal.fire({
            title: 'Well done !',
            text: 'Aww yeah, your has been successfully Submitted.',
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        } else {
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            text: 'your Review did not Submitted.',
            icon: 'warning',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
      });
    }
  }

  saveReview() {
    if (this.reviewForm.valid) {
      let sum: number = 0;
      this.kraInformation.ReviewerComments = this.reviewForm.value.ReviewerComments;
      this.kraInformation.EmployeeReviewDetails.forEach((a: any) => sum += parseFloat(a.ReviewerScore));
      this.kraInformation.ReviewerScore = sum;
      this.kraInformation.IsDraft = false;
      this.kraInformation.IsSubmitted = true;
      this.kraInformation.IsAppraiserReviewed = true;
      this.employeePerformanceReviewService.saveEmployeePerformanceReview(this.kraInformation, ReviewerType.Reviewer).subscribe((data: any) => {
        if (data) {
          Swal.fire({
            title: 'Well done !',
            text: 'Aww yeah, your has been successfully Saved.',
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        } else {
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            text: 'your Review did not Saved.',
            icon: 'warning',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
      });
    }
  }

  cancelReview() {
    this.router.navigate(["portal/pms/reviewer/reviewer-evaluation"])
  }

}
