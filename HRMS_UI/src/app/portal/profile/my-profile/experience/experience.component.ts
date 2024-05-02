import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { CustomRule } from 'devextreme/ui/validation_rules';
import { ExperienceDetail } from 'src/app/core/models/employee/experience-detail.model';
import { EmployeeService, StorageService } from 'src/app/core/services';
import Swal from 'sweetalert2';
import { ItemClickEvent } from 'devextreme/ui/list';
import { DxDataGridComponent } from 'devextreme-angular/ui/data-grid';
import { ValidationErrors } from '@angular/forms';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { CreateExprienceComponent } from './create-exprience/create-exprience.component';


@Component({
  selector: 'app-experience',
  templateUrl: './experience.component.html',
  styleUrls: ['./experience.component.scss']
})
export class ExperienceComponent implements OnInit {
  @ViewChild(DxDataGridComponent) grid!: DxDataGridComponent;

  @Input() employeeExperienceDetails: any;
  loggedInUser: any;
  processed: boolean;
  experienceDetails: any;
  salaryUnits: any[];
  employeeType: any[];

  profile: any;
  pattern: any = /^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$/i;
  maxDate: Date = new Date();
  currentRow: any;

  
  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  constructor(private readonly storageService: StorageService,
    private readonly employeeService: EmployeeService,
    private readonly modalService: NgbModal,) {
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.processed = false;
    this.profile = [];
    this.salaryUnits = [];
    this.employeeType = [];

    this.onEditorPrepared = this.onEditorPrepared.bind(this);
    this.dateComparison = this.dateComparison.bind(this);
  }

  ngOnInit(): void {
    this.getMyProfile();
    this.getSalaryUnits();
    this.getIsNarayanaEmp();

    
    
        this.filterSettings = { type: 'Menu' };
      this.pageSettings = { pageSize: 14 };
      this.loadingIndicator = { indicatorType: 'Shimmer' };
  }
  onEditorPrepared(e: any) {
    if (e.parentType == "dataRow") {
      this.currentRow = e.row;
      this.dateComparison();
    }
  }
  dateComparison(params?: any) {
    let fromDate = this.grid.instance.cellValue(this.currentRow.rowIndex, 'FromDate');
    let toDate = this.grid.instance.cellValue(this.currentRow.rowIndex, 'ToDate');
    if (params.formItem.dataField == "ToDate") {
      toDate = params.value;
    }
    if (params.formItem.dataField == "FromDate") {
      fromDate = params.value;
    }
    if (toDate !== undefined && fromDate !== undefined && toDate < fromDate) {
      return null;
    }
    return { message: 'To date must be grater than from date' };
  }

  onEditorPreparing(data: any,type:any) {
    const modalRef = this.modalService.open(CreateExprienceComponent, {size: 'lg',  centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = data;
    modalRef.componentInstance.type = type;

    modalRef.result.then((result) => {
      this.getMyProfile();
    }).catch((result) => {
      this.getMyProfile();
    });
    // if (e.dataField === 'EmpId' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 15;
    // }
    // if (e.dataField === 'Organisation' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 150;
    // }
    // if (e.dataField === 'Designation' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 150;
    // }
    // if (e.dataField === 'Salary' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 13;
    // }
    // if (e.dataField === 'Place' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 150;
    // }
    // if (e.dataField === 'RefName' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 30;
    // }
    // if (e.dataField === 'Refmobileno' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 10;
    // }
    // if (e.dataField === 'Refphoneno' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 10;
    // }
    // if (e.dataField === 'Refemail' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 100;
    // }
    // if (e.dataField === 'Description' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 800;
    // }
  }

  eventAction(event: any, type: string) {
    let data = event.data;
    if (type == 'RowUpdated') {
      this.updateExperienceData(data);
    }
    else if (type == 'RowInserting') {
      let experienceDetails = new ExperienceDetail();
      experienceDetails.Designation = data.Designation;
      experienceDetails.FromDate = data.FromDate;
      experienceDetails.ToDate = data.ToDate;
      experienceDetails.IsNarayanaEmp = data.IsNarayanaEmp;
      experienceDetails.Organisation = data.Organisation;
      experienceDetails.Place = data.Place;
      experienceDetails.RefName = data.RefName;
      experienceDetails.Refmobileno = data.Refmobileno;
      experienceDetails.Refemail = data.Refemail;
      experienceDetails.Refphoneno = data.Refphoneno;
      experienceDetails.Description = data.Description;
      experienceDetails.Salary = data.Salary;
      experienceDetails.SalaryUnit = data.SalaryUnit;
      experienceDetails.EmployeeSlno = this.profile.EmpSLNo;
      experienceDetails.UniqueNo = this.profile.UniqueNo;
      experienceDetails.Userslno = 1;
      this.insertExperieneData(experienceDetails);
    }
  }

  getSalaryUnits() {
    let salaryUnits = [
      {
        id: 1, name: "PER YEAR"
      },
      {
        id: 2, name: "PER MONTH"
      }
    ]
    this.salaryUnits = salaryUnits;
  }

  getIsNarayanaEmp() {
    let empTypes = [
      {
        id: 0, name: "NO"
      },
      {
        id: 1, name: "YES"
      }
    ]
    this.employeeType = empTypes;
  }
  //Exceperience Details 
  getMyProfile() {
    this.processed = false;
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.employeeService.getMyprofile(employeeSlno).subscribe(data => {
      if (data) {
        this.processed = true;
        this.profile = data;
        this.experienceDetails = data.EmployeeExperienceDetails;
      }
    });
  }
  applyExperince(leaveData?: any) {
    const modalRef = this.modalService.open(CreateExprienceComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    // modalRef.componentInstance.selectedRowData = leaveData;
     modalRef.componentInstance.type = "Add";
    modalRef.result.then(() => {
     this.getMyProfile();
    },
      (reason) => {
        // let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
      });
  }
  
  
  insertExperieneData(data: any) {
    this.employeeService.updateEmployeeExperienceDetails(data).subscribe((result: any) => {
      if (result) {
        this.getMyProfile();
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, experience details are successfully saved.',
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => {
          // this.getMyProfile();
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: 'Experience details are not Saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => { });
        this.getMyProfile();
      }
    });
  }

  updateExperienceData(data: any) {
    this.employeeService.updateEmployeeExperienceDetails(data).subscribe((result: any) => {
      if (result) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Experience details are successfully saved.',
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => {
          this.getMyProfile();
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: 'Experience details are not Saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => { });
        this.getMyProfile();
      }
    });
  }

  onToolbarPreparingExperience(e: any) {
    let toolbarItems = e.toolbarOptions.items;
    let addRowButton = toolbarItems.find((x: any) => x.name === "addRowButton");
    addRowButton.options.text = "Add new experience details";
    addRowButton.showText = "always";
  }

  deleteExceperienceDetails(event: any) {
    let empExSlno = event.EmpExSlno;
    Swal.fire({
      title:  `Are you sure want to delete? \n ( ${empExSlno})`,
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        this.employeeService.deleteExceperienceDetails(empExSlno).subscribe(res => {
          if (res) {
           this.getMyProfile();

            Swal.fire({
              title: 'Well done !',
              text: 'Aww yeah, row data was deleted successfully',
              icon: 'success',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
          else {
            Swal.fire({
              title: 'Oops...! Something went Wrong !',
              text: 'row data was not deleted.',
              icon: 'warning',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
        })
      }
    })
   
    // this.employeeService.deleteExceperienceDetails(empExSlno).subscribe((data: any) => {
    //   if (data) {
    //     Swal.fire({
    //       title: 'Well done !',
    //       text: 'Aww yeah, Exceperience details are successfully deleted.',
    //       icon: 'success',
    //       confirmButtonColor: 'rgb(54, 69, 116)',
    //       confirmButtonText: 'Ok'
    //     }).then((result) => {
    //       this.getMyProfile();
    //     });
    //   }
    //   else {
    //     Swal.fire({
    //       title: 'Oops...! Something went Wrong !',
    //       text: 'Exceperience are not deleted.',
    //       icon: 'warning',
    //       confirmButtonColor: 'rgb(54, 69, 116)',
    //       confirmButtonText: 'Ok'
    //     });
    //   }
    // });
  }

  saveEmployeeExperienceDetails(event: any, eventType: string) {
    let data = event.data;
    this.employeeService.updateEmployeeExperienceDetails(data).subscribe((result: any) => {
      if (result) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Experience details are successfully saved.',
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => {
          this.getMyProfile();
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: 'Experience details are not saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => { });
        this.getMyProfile();
      }
    });
  }
}
