import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { GridComponent } from '@syncfusion/ej2-angular-grids';
import { finalize } from 'rxjs/operators';
import { EmployeePerformanceReviewService, StorageService } from 'src/app/core/services';
import { DataService } from 'src/app/core/services/helper/data-service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-final-review',
  templateUrl: './final-review.component.html',
  styleUrls: ['./final-review.component.scss']
})
export class FinalReviewComponent implements OnInit {
  @ViewChild("grid", { static: false }) public grid: GridComponent | undefined;
  breadCrumbItems: any;
  isLoaded: boolean;
  employeeProfile: any;
  finalReview: any;
  filterSettings: { type: string };
  pageSettings: { pageSize: number; pageSizes: string[] };

  constructor(
    private readonly router: Router,
    private readonly employeePerformanceReviewService: EmployeePerformanceReviewService,
    private readonly storageService: StorageService,
    private readonly dataService: DataService,
  ) { 
    this.isLoaded = false;
    this.breadCrumbItems = [
      { label: 'PMS' },
      { label: 'Final Review', active: true }
    ];
    this.filterSettings = { type: "Menu" };
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
    this.getEmployeeFinalReviewInformations(this.employeeProfile.EmployeeSlno);
  }

  getEmployeeFinalReviewInformations(employeeSlno: any) {
    this.employeePerformanceReviewService
      .getEmployeeFinalReviewInformations(employeeSlno)
      .pipe(finalize(() => (this.isLoaded = false)))
      .subscribe(
        (data: any) => {
          this.finalReview = data;
        },
        (error: any) => {
          this.isLoaded = false;
          Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Error while loading the Employee final review informations",
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
    this.router.navigate(["portal/pms/view-review"]);
  }
}
