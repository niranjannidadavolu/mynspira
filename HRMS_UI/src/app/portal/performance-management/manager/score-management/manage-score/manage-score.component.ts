import { Component, OnInit, ViewChild } from "@angular/core";
import { FrequencyInformationService, StorageService } from "src/app/core/services";
import { ActionEventArgs, GridComponent, RowDataBoundEventArgs, SelectionSettingsModel } from "@syncfusion/ej2-angular-grids";
import { finalize } from "rxjs/operators";
import { AssignKraService } from "src/app/core/services";
import Swal from "sweetalert2";
import { DataService } from "src/app/core/services/helper/data-service";
import { Router } from "@angular/router";

@Component({
  selector: "app-manage-score",
  templateUrl: "./manage-score.component.html",
  styleUrls: ["./manage-score.component.scss"],
})
export class ManageScoreComponent implements OnInit {
  @ViewChild("grid", { static: false }) public grid: GridComponent | undefined;
  breadCrumbItems: any;
  keyPerformanceIndices: any;
  initialPage: { pageSizes: boolean; pageCount: number };
  employeeProfile: any;
  searchCriteria: { LocationName: null; StartIndex: number; EndIndex: number };
  frequency: any;
  frequencies: any;
  aggregates: any;
  pageSettings: any;
  editSettings: any;
  groupSettings: any;
  filterSettings: any;
  addAssignKRAForm: any;
  kpiDataSourceDs: any;
  frequenciesDataSource: any;
  frequencyElem?: HTMLElement;
  selectedItems: any;
  list: any;
  updatedData: any;
  filterPlaceholder: string;
  employeesFields: { text: string; value: string };
  employeesWaterMark: string;
  popHeight: any;
  employees: any;
  selectedRecordscount!: number;
  reviewInformation: any;
  isLoaded: boolean | undefined;
  reviewForm: any;
  departmentId: any;
  designationId: any;
  frequencyInfo: any;
  mode: string;
  recordId: any;
  kraSlno: any;
  kpiSlno: any;
  frequencySlno: any;
  maxScore: any;
  employeeSlno: any;
  isDraft: any;
  selectedIndex: number[] = [];
  minThresholdValues: any;
  maxThresholdValues: any;
  hasValidationErrors!: boolean;
  public isValidScores: boolean = false;
  public scoreValidationRules?: object;
  public selectedRecord: object = {};
  // public selectionOptions?: SelectionSettingsModel;

  constructor(
    private readonly router: Router,
    private readonly storageService: StorageService,
    private readonly assignKraService: AssignKraService,
    private readonly dataService: DataService,
    public readonly frequencyInformationService: FrequencyInformationService
    
  ) {
    this.breadCrumbItems = [
      { label: "PMS" },
      { label: "View Employee KRA Information", active: true },
    ];
    this.employeeProfile = this.storageService.getParsedData("EmployeeProfile", 1);
    this.initialPage = { pageSizes: true, pageCount: 4 };
    this.pageSettings = {
      pageSize: 20,
      pageSizes: ["5", "10", "15", "20", "All"],
    };
    this.editSettings = {
      allowEditing: true,
      allowAdding: true,
      allowDeleting: true,
      showConfirmDialog: true,
     
    };
    this.mode = "CheckBox";
    // this.selectionOptions = { type: 'Multiple', persistSelection: true };
    this.groupSettings = { showDropArea: false, columns: ["KraName"] };
    this.searchCriteria = { LocationName: null, StartIndex: 0, EndIndex: 20 };
    this.filterSettings = { type: "Menu" };
    this.scoreValidationRules = { required: true };
    this.filterPlaceholder = "Search";
    this.employeesFields = { text: "EmployeeName", value: "EmployeeId" };
    this.employeesWaterMark = "Select Employees";
    this.popHeight = "350px";
    this.updatedData = [];
    this.departmentId;
    this.designationId;
    this.dataService.getReviewData().subscribe({
      next: (data: any) => {
        if (data) {
          this.reviewInformation = data;
        } else {
          this.router.navigate(["/portal/pms/manager/score-management"]);
        }
      },
      error: () => {},
      complete: () => {},
    });
    
  }
  
  ngOnInit(): void {
    this.getAssignedKpiInformationsOfDesignation(this.reviewInformation);
  }

  // checkScoresEntered(): boolean {
  //   const records = this.grid.dataSource as YourDataModel[]; // Replace YourDataModel with your actual data model interface
  //   return records.some(record => record.MaxScore !== null && record.MaxScore !== undefined);
  // }

  // updateButtonState(): void {
  //   this.isValidScores = this.hasValidationErrors;
  // }

  public onActionBegin(args: any): void {
    debugger;
    if (args.requestType === 'save') {
        let MaxScore = args.data.MaxScore;
        let minThresholdValues = args.data.MinThresholdValues;
        let maxThresholdValues = args.data.MaxThresholdValues;

          if (MaxScore < minThresholdValues || MaxScore > maxThresholdValues) {
            Swal.fire({
              title: "Oops...! Something went Wrong !",
              text: "Max score should be in between range of Minimum and Maximum Threshold values.",
              icon: "warning",
              confirmButtonColor: "rgb(54, 69, 116)",
              confirmButtonText: "Ok",
            }).then(() => {
            });
            args.cancel = true;
          }

          if (MaxScore > minThresholdValues || MaxScore < maxThresholdValues) {
            this.isValidScores = this.hasValidationErrors = true;
          }
    }
  }
 
  load() {
    (this.grid as GridComponent).element.addEventListener("mouseup", (e) => {
      if ((e.target as HTMLElement).classList.contains("e-rowcell")) {
        if ((this.grid as GridComponent).isEdit)
          (this.grid as GridComponent).endEdit();
        let index: number = parseInt(
          (e.target as HTMLElement).getAttribute("Index") as string
        );
        (this.grid as GridComponent).selectRow(index);
        (this.grid as GridComponent).startEdit();
      }
    });
  }

  getAssignedKpiInformationsOfDesignation(data: any) {
    if (this.reviewInformation) {
      this.assignKraService
        .getAssignedKpiInformationsOfDesignation(
          this.reviewInformation.DesignationSlno
        )
        .pipe(finalize(() => (this.isLoaded = false)))
        .subscribe(
          (data: any) => {
            this.keyPerformanceIndices = data.Item2;
          },
          (error: any) => {
            this.isLoaded = false;
            Swal.fire({
              icon: "error",
              title: "Oops...",
              text: "Error while loading the Employee KRA KPP information",
              footer: "Please contact Administrator.",
            });
          }
        );
    }
  }

  getAllFrequencies() {
    this.frequencyInformationService.getFrequencies().subscribe((data: any) => {
      if (data) {
        this.frequencyInfo = data;
      }
    });
  }

  onActionComplete(args: any): void {
    debugger;
    if (args && args.requestType === "save") {
      if (this.grid) {
        this.grid.endEdit();
        let foundIndex = this.keyPerformanceIndices.findIndex(
          (x: any) =>
            x.KpiSlno === args.data.KpiSlno && x.KraSlno === args.data.KraSlno
        );

        if (foundIndex !== -1) {
          this.keyPerformanceIndices[foundIndex] = args.data;
        }
      }
    }
  }

  rowSelected(args: any) {
    if (args) {
      let index = this.updatedData.findIndex(
        (item: any) => item.KraSlno === args.data.KraSlno || item.KpiSlno === args.data.KpiSlno);
      if (index === -1) {
        args.data.DepartmentSlno = this.departmentId;
        args.data.DesignationSlno = this.designationId;
        args.data.EmployeeSlno = this.reviewInformation.EmployeeSlno;
        this.kraSlno = args.data.KraSlno;
        this.frequencySlno = args.data.FrequencySlno;
        this.kpiSlno = args.data.KpiSlno;
        this.maxScore = args.data.MaxScore;
        this.minThresholdValues = args.data.MinThresholdValues;
        this.maxThresholdValues = args.data.MaxThresholdValues;
        this.updatedData.push(args.data);
      }
    }
  }

  rowDeselect(args: any) {
    if (args) {
      let index = this.updatedData.findIndex(
        (item: any) => item.KraSlno === args.data.KraSlno || item.KpiSlno === args.data.KpiSlno);
      if (index !== -1) {
        this.updatedData.splice(index, 1);
      }
    }
  }

  rowDataBound(args: RowDataBoundEventArgs): void {
    if (args && args.data) {
      let rowIndex = (args.row as Element).getAttribute("aria-rowindex") as string;
      let rowData: any;
      rowData = args.data;
      let mapStatus = rowData.Mapped;
      if (mapStatus) {
        let rowIndex1 = parseInt(rowIndex);
        let index = this.selectedIndex.findIndex(
          (item: any) => item === rowIndex1
        );
        if (index === -1) {
          rowIndex1 = rowIndex1 - 1;
          this.selectedIndex.push(rowIndex1);
        }
      }
    }
  }

  dataBound(): void {
    debugger;
    if (this.selectedIndex.length) {
      if (this.grid) {
        this.grid.selectRows(this.selectedIndex);
        this.selectedIndex = [];
      }
    }
  }

  submitReview() {
    let isDraft = false;
    if (this.grid) {
      var selectedRecords = this.grid.getSelectedRecords();
      selectedRecords.forEach((element: any) => {
        element.RecordId = this.reviewInformation.RecordId;
        element.KraSlno = this.kraSlno;
        element.KpiSlno = this.kpiSlno;
        element.FrequencySlno = this.frequencySlno;
        element.MaxScore = this.maxScore;
        element.DepartmentSlno = this.reviewInformation.DepartmentSlno;
        element.DesignationSlno = this.reviewInformation.DesignationSlno;
        element.EmployeeSlno = this.reviewInformation.EmployeeSlno;
        element.isDraft = false;
        element.CreatedBy = this.employeeProfile.EmployeeSlno;
        element.StatusId = 1;
      });
      if (this.updatedData && this.updatedData.length > 0) {
        this.assignKraService
          .assignKraKpiInformationToEmployee(selectedRecords)
          .subscribe((data: any) => {
            if (data) {
              Swal.fire({
                title: "Well done !",
                text: "Aww yeah, You Have successfully Saved Kra Information",
                icon: "success",
                confirmButtonColor: "rgb(54, 69, 116)",
                confirmButtonText: "Ok",
              }).then(() => {
                this.departmentId = [];
                this.designationId = [];
                this.keyPerformanceIndices = [];
                this.employeeSlno = null;
              });
            } else {
              Swal.fire({
                title: "Oops...! Something went Wrong !",
                text: "Record is not Saved.",
                icon: "warning",
                confirmButtonColor: "rgb(54, 69, 116)",
                confirmButtonText: "Ok",
              }).then(() => {
              });
            }
          });
      }
    }
  }

  saveReview() {
    let isDraft = true;
    this.departmentId = this.reviewInformation.departmentSlno;
    this.designationId = this.reviewInformation.DesignationSlno;
    let departmentSlno = this.departmentId;
    let designationSlno = this.designationId;
    let createdBy = this.employeeProfile.EmployeeSlno;
    let keyPerformanceIndices = this.keyPerformanceIndices;
    this.assignKraService
      .assignKraKpiInformation(
        departmentSlno,
        designationSlno,
        createdBy,
        isDraft,
        keyPerformanceIndices
      )
      .subscribe((data: any) => {
        if (data) {
          Swal.fire({
            title: "Well done !",
            text: "Aww yeah, Scores have been mapped Successfully.",
            icon: "success",
            confirmButtonColor: "rgb(54, 69, 116)",
            confirmButtonText: "Ok",
          });
        } else {
          Swal.fire({
            title: "Oops...! Something went Wrong !",
            text: "Scores are not mapped.",
            icon: "warning",
            confirmButtonColor: "rgb(54, 69, 116)",
            confirmButtonText: "Ok",
          });
        }
      });
  }
}
