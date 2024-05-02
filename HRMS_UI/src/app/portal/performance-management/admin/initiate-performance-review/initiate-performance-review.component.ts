import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { EditSettingsModel, GroupSettingsModel } from '@syncfusion/ej2-angular-grids';
import { finalize } from 'rxjs/operators';
import { KraInformationService } from 'src/app/core/services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-initiate-performance-review',
  templateUrl: './initiate-performance-review.component.html',
  styleUrls: ['./initiate-performance-review.component.scss']
})
export class InitiatePerformanceReviewComponent implements OnInit {

  breadCrumbItems: any;
  public data?: object[];
  public editSettings?: EditSettingsModel;
  public toolbar?: string[];
  public groupOptions?: GroupSettingsModel;
  pendingReviews: any;
  finalReviews: any;
  isLoaded: boolean;

  constructor(
    private readonly router: Router,
    private readonly kraInformationService: KraInformationService
  ) {
    this.isLoaded = false;
    this.getAllPendingInitiationReviews();
    this.getAllFinalInitiationReviews();
  }

  ngOnInit(): void {
  }

  getAllPendingInitiationReviews() {
    this.kraInformationService.getAllPendingInitiationReviews()
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

  getAllFinalInitiationReviews() {
    this.kraInformationService.getAllFinalInitiationReviews()
      .pipe(finalize(() => (this.isLoaded = false)))
      .subscribe(
        (data: any) => {
          this.finalReviews = data;
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

}
