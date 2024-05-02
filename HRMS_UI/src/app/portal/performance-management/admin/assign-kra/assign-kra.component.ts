import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { finalize } from 'rxjs/operators';
import Swal from 'sweetalert2';
import { AssignKraService, EmployeeService, FrequencyInformationService, KpiInformationService, StorageService } from 'src/app/core/services';
import { DropDownList, FilteringEventArgs } from '@syncfusion/ej2-angular-dropdowns';
import { DataManager } from '@syncfusion/ej2-data';
import { GridComponent, RowDataBoundEventArgs } from '@syncfusion/ej2-angular-grids';
import { DepartmentInformationService } from 'src/app/core/services/perfomance-management/department-information.service';
import { DesignationInformationService } from 'src/app/core/services/perfomance-management/designation-information.service';
import { Query } from '@syncfusion/ej2-data';
import { EmitType } from '@syncfusion/ej2-base';

@Component({
  selector: 'app-assign-kra',
  templateUrl: './assign-kra.component.html',
  styleUrls: ['./assign-kra.component.scss'],
})
export class AssignKraComponent implements OnInit {

  @ViewChild('grid', { static: false }) public grid: GridComponent | undefined;
  breadCrumbItems: any;
  keyResultAreas: any;
  keyPerformanceIndices: any;
  childGrid: any;
  childGridColumns: any;
  isLoaded: any;
  initialPage: { pageSizes: boolean; pageCount: number; };
  employeeProfile: any;
  searchCriteria: { LocationName: null; StartIndex: number; EndIndex: number; };

  public editparams = {
    params: { popupHeight: '300px' },
    template: '#template',  // Use this template in view mode
    editTemplate: '#editTemplate'  // Use this template in edit mode
  };
  initial: boolean = true;
  frequency: any;
  countryParams: any;
  frequencies: any;
  aggregates: any;
  pageSettings: any;
  editSettings: any;
  groupSettings: any;
  toolbar: any;
  filterSettings: any;
  filterForm: FormGroup;
  kpiDataSourceDs: any;
  frequenciesDataSource: any;
  frequencyElem?: HTMLElement;
  frequencObj?: DropDownList;
  selectedItems: any;
  list: any;
  updatedData: any;
  AssignKRASaveData: any;
  departmentService: any;
  departments: any;

  mode: string;
  filterPlaceholder: string;
  departmentFields: { text: string; value: string; };
  desginationFields: { text: string; value: string; };
  employeesFields: { text: string; value: string; };
  departmentWaterMark: string;
  designationWaterMark: string;
  employeesWaterMark: string;
  popHeight: any;
  designations: any;
  selectedRecordscount!: number;
  showMessage: any;
  selectedDepartment: any;
  selectedDesignation: any;
  selectedIndex: number[] = [];
  isSubmitted: boolean;



  constructor(
    private fb: FormBuilder,
    private kpiInformationService: KpiInformationService,
    private readonly storageService: StorageService,
    private readonly frequencyService: FrequencyInformationService,
    private readonly departmentInformationService: DepartmentInformationService,
    private readonly designationInformationService: DesignationInformationService,
    private readonly employeeInformationService: EmployeeService,
    private readonly assignKraService: AssignKraService
  ) {
    this.isSubmitted = false;
    this.breadCrumbItems = [
      { label: 'PMS' },
      { label: 'Assign KRA', active: true }
    ];

    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.initialPage = { pageSizes: true, pageCount: 4 };
    this.pageSettings = { pageSize: 20, pageSizes: ['5', '10', '15', '20', 'All'] };
    this.editSettings = { allowEditing: true, allowAdding: true, allowDeleting: true };
    this.groupSettings = { showDropArea: false, columns: ['KraName'] };
    this.searchCriteria = { LocationName: null, StartIndex: 0, EndIndex: 20 }
    this.toolbar = ['Add', 'Edit', 'Delete', 'Update', 'Cancel'];
    this.filterSettings = { type: 'Menu' };
    this.filterForm = this.fb.group({
      DepartmentSlno: new FormControl(),
      DesignationSlno: new FormControl(),
      EmployeeSlno: new FormControl(),
      KRAKPIList: new FormControl()
    });
    this.mode = 'CheckBox';
    this.filterPlaceholder = 'Search';
    // map the groupBy field with category column
    this.departmentFields = { text: 'DepartmentName', value: 'DepartmentSlno' };
    this.desginationFields = { text: 'DesignationName', value: 'DesignationSlno' };

    this.employeesFields = { text: 'EmployeeName', value: 'EmployeeSlno' };
    // set the placeholder to the MultiSelect input
    this.departmentWaterMark = 'Select Departments';
    this.designationWaterMark = 'Select Designations';
    this.employeesWaterMark = 'Select Employees';
    this.popHeight = '350px';
    this.updatedData = [];
    //this.loadAllFrequencies();
    this.loadAllDepartments();
    //this.loadAllDesignation();
    //this.loadAllEmployees();

    //this.loadFrequencyParams();




  }
  onDepatmentChange($event: any) {

    let selectedDepartment = $event.value;
    if (selectedDepartment && selectedDepartment > 0) {
      this.selectedDepartment = $event.value;
      this.getDesignationsByDepartment(selectedDepartment);
      //this.getEmployees(this.selectedDepartment, this.selectedDesignation);
    }
  }
  getDesignationsByDepartment(departmentSlno: any) {
    this.designationInformationService.getDesignationsByDepartment(departmentSlno)
      .pipe(finalize(() => this.isLoaded = false))
      .subscribe((data: any) => {
        // 
        this.designations = data;

      },
        (error: any) => {
          this.isLoaded = false;
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Error while loading the Designations',
            footer: 'Please contact Administrator.'
          });
        });
  }

  onDesgnationChange($event: any) {

    let selectedDesignation = $event.value;
    if (selectedDesignation && selectedDesignation > 0) {
      this.selectedDesignation = $event.value;
      this.getAssignedKpiInformations(this.selectedDepartment, this.selectedDesignation);
    }
  }
  
  onDepartmentFiltering: EmitType<FilteringEventArgs> = (e: FilteringEventArgs) => {
    let query: Query = new Query();
    query = (e.text !== '') ? query.where('DepartmentName', 'contains', e.text, true) : query;
    e.updateData(this.departments, query);
  };

  onDesinationFiltering: EmitType<FilteringEventArgs> = (e: FilteringEventArgs) => {
    let query: Query = new Query();
    query = (e.text !== '') ? query.where('DesignationName', 'contains', e.text, true) : query;
    e.updateData(this.designations, query);
  };

 
  loadAllDepartments() {
    this.departmentInformationService.GetDepartmentInformations()
      .pipe(finalize(() => this.isLoaded = false))
      .subscribe((data: any) => {
        //
        this.departments = data;
      },
        (error: any) => {
          this.isLoaded = false;
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Error while loading the Departments',
            footer: 'Please contact Administrator.'
          });
        });
  }

  getAssignedKpiInformations(departmentId: any, designationId: any) {

    this.assignKraService.getAssignedKpiInformations(departmentId, designationId)
      .pipe(finalize(() => this.isLoaded = false))
      .subscribe((data: any) => {

        this.keyResultAreas = data.Item1;
        this.keyPerformanceIndices = data.Item2;
        //console.log(data.Item1);
        // this.childGrid = {
        //   dataSource: this.keyPerformanceIndices,
        //   queryString: 'KraSlno',
        //   allowPaging: true,
        //   pageSettings: { pageSize: 6, pageCount: 5 },
        //   columns: [
        //     {
        //       type: 'checkbox',
        //       width: '50'
        //     },
        //     { field: 'KpiName', headerText: 'Key Performance Parameter', width: 120, textAlign: 'Left', },
        //     { field: 'FrequencyName', headerText: 'Frequency', width: 120 },
        //     { field: 'Measurement', headerText: 'Measurement', width: 120 },
        //     { field: 'ThresholdValues', headerText: 'Threshold Values', width: 120 },
        //     { field: 'kpiDescription', headerText: 'Description', width: 120 }
        //   ]
        // };
      },
        (error: any) => {
          this.isLoaded = false;
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Error while loading the Key Performance Indices',
            footer: 'Please contact Administrator.'
          });
        });
  }
  rowSelected(args: any) {

    if (args) {
      
      let index = this.updatedData.findIndex((item: any) => item.KraSlno === args.data.KraSlno);
      if (index === -1) {
        args.data.DepartmentSlno = this.selectedDepartment;
        args.data.DesignationSlno = this.selectedDesignation;
        this.updatedData.push(args.data);
      }
    }
    
    // var childAll = args.row.nextElementSibling.querySelectorAll('.e-grid');
    // for (var i = 0; i < childAll.length; i++) {
    //   var child = childAll[i].ej2_instances[0];
    //   child.selectionModule.checkSelectAll();
    // }
  }

  rowDeselect(args: any) {

    if (args) {
      let index = this.updatedData.findIndex((item: any) => item.KraSlno === args.data.KraSlno);
      if (index !== -1) {
        this.updatedData.splice(index, 1);
      }
    }
  }
  rowDataBound(args: RowDataBoundEventArgs): void {
    if (args && args.data) {
      let rowIndex = (args.row as Element).getAttribute('aria-rowindex') as string;
      let rowData: any;
      rowData = args.data;
      let mapStatus = rowData.Mapped;
      if (mapStatus) {
        let rowIndex1 = parseInt(rowIndex);
        let index = this.selectedIndex.findIndex((item: any) => item === rowIndex1);
        if (index === -1) {
          rowIndex1 = rowIndex1 - 1;
          this.selectedIndex.push(rowIndex1);
        }
      }
    }
  }

  dataBound(): void {
    
    if (this.selectedIndex.length) {
      if (this.grid) {
        this.grid.selectRows(this.selectedIndex);
        this.selectedIndex = [];
      }
    }
  }
  ngOnInit(): void {
  }

  onActionComplete(args: any): void {

    
  }
  getFrequencyValue(FrequencyName: any) {
    let index1 = this.frequencies.find((item: any) => item.FrequencyName === FrequencyName);
    if (index1) {
      return index1.FrequencySlno;
    }
    return 0;
  }

  onSubmit() {

    
    if (this.grid) {
      var selectedRecords = this.grid.getSelectedRecords();
      selectedRecords.forEach((element: any) => {
        element.DepartmentSlno = this.selectedDepartment;
        element.DesignationSlno = this.selectedDesignation;
        element.CreatedBy = this.employeeProfile.EmployeeSlno;
        element.StatusId = 1;
      });
      if (this.updatedData && this.updatedData.length > 0) {
        this.assignKraService.assignKraInformation(selectedRecords).subscribe((data: any) => {
          if (data) {
            Swal.fire({
              title: "Well done !",
              text: "Aww yeah, You Have successfully Saved Kra Information",
              icon: "success",
              confirmButtonColor: "rgb(54, 69, 116)",
              confirmButtonText: "Ok",
            }).then(() => {
              this.isSubmitted = false;
              this.departments = [];
              this.designations = [];
              this.keyResultAreas = [];
              this.selectedDepartment = null;
              this.selectedDesignation = null;
              this.loadAllDepartments();
            });
          } else {
            Swal.fire({
              title: "Oops...! Something went Wrong !",
              text: "Record is not Saved.",
              icon: "warning",
              confirmButtonColor: "rgb(54, 69, 116)",
              confirmButtonText: "Ok",
            }).then(() => {
              this.isSubmitted = false;
            });
          }
        });
      }
    }
  }
}