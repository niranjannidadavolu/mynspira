import { Component, OnInit, ViewChild } from '@angular/core';
import { EditSettingsModel, GridComponent, ToolbarItems } from '@syncfusion/ej2-angular-grids';
import { ChangeEventArgs } from '@syncfusion/ej2-angular-inputs';
import { EmployeeFamilyDetails } from 'src/app/core/models/employee/employee-family-details';
import { EmployeeService, StorageService } from 'src/app/core/services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-family',
  templateUrl: './family.component.html',
  styleUrls: ['./family.component.scss']
})
export class FamilyComponent implements OnInit {
  @ViewChild('grid') public grid?: GridComponent;
  processed: boolean;
  loggedInUser: any;
  familyMembers: any;
  bloodRelationData: any;
  profile: any;
  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;

  editSettings?: EditSettingsModel;
  toolbar?: ToolbarItems[];
  orderIDRules?: object;
  customerIDRules?: object;
  freightIDRules?: object;
  formatoptions:any;
  daterule:any;
  changeData:any=[];
  constructor(
    private readonly storageService: StorageService,
    private readonly employeeService: EmployeeService) {
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.processed = false;
      this.getMyProfile();
    this.getFamilyBloodRelationDetails();
  }

  ngOnInit(): void {
  

    
    this.formatoptions = { type: 'date', format: 'dd-MMM-yyyy' }
    this.daterule = { required: true };
        this.filterSettings = { type: 'Menu' };
      this.pageSettings = { pageSize: 14 };
      this.loadingIndicator = { indicatorType: 'Shimmer' };
      this.editSettings = { allowEditing: true, allowAdding: true, allowDeleting: true, mode: 'Normal' };
      this.toolbar = ['Add', 'Edit', 'Delete', 'Update', 'Cancel'];
      this.orderIDRules = { required: true };
      this.customerIDRules = { required: true, minLength: 5 };
      this.freightIDRules={required: true, min: 1, max:1000 }
  }
  onDropdownChange(event: any): void {
    //console.log("event",event.itemData);
   this.changeData=event.itemData;
    if(this.changeData.length >0)
    {
      this.bloodRelationData = this.changeData.BrelSlno;
       //itemData.BrelSlno = this.bloodRelationData.BrelSlno;
     //  itemData.BloodRelation = this.bloodRelationData.BloodRelation;
    }
    // const selectedIndexes = this.grid?.getSelectedRowIndexes();
    // if (selectedIndexes && selectedIndexes.length > 0) {
    //   //console.log('Selected Row Indexes:', selectedIndexes);
    //   let firstSelectedIndex = selectedIndexes[0];
   
   
    // }
  }
  //Family Details
  onEditorPreparing(e: any) {
    if (e.dataField === 'RelationName' && e.parentType === 'dataRow') {
      e.editorOptions.maxLength = 150;
      e.editorOptions.readonly = true;  
    }   
    if (e.dataField === 'Description' && e.parentType === 'dataRow') {
      e.editorOptions.maxLength = 800;
    }  
    if (e.dataField === 'Isdependent' && e.parentType === 'dataRow') {
      e.editorOptions.maxLength = 3;
    }  
  }

  onToolbarPreparing(e: any) {
    let toolbarItems = e.toolbarOptions.items;
    let addRowButton = toolbarItems.find((x: any) => x.name === "addRowButton");
    addRowButton.options.text = "Add new family member";
    addRowButton.showText = "always";
  }


  getMyProfile() {
    this.processed = false;
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.employeeService.getMyprofile(employeeSlno).subscribe(data => {
      if (data) {
        this.processed = true;
        this.profile = data;
        this.familyMembers = data.EmployeeFamilyDetails;
      }
    });
  }


  getFamilyBloodRelationDetails() {
    this.employeeService.getFamilyBloodRelationDetails().subscribe(data => {
      // this.bloodRelationData = data.map((x: any) => ({
      //   BloodRelation:x.BrelName,
      //   BrelSlno:x.BrelSlno
      // }));
     this.bloodRelationData = data;

    })
  }
  onActionBegin(event:any)
  {
    event.data.BrelSlno=this.changeData.BrelSlno
    if(event.data.Userslno>0)
    {
      this.eventAction(event,"new")
    }
    else{
      this.eventAction(event.data,"update")
    }
  }

  eventAction(data: any, eventName: string) {    
    if (eventName == "update") {
      this.updateFamilyMembers(data);
    }
    else if (eventName == "new") {
      this.saveEmployeeFamilyDetails(data);
    }
  }

  updateFamilyMembers(data: any) {
    this.employeeService.updateEmployeeFamilyDetails(data).subscribe((result: any) => {
      if (result) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Family details are successfully saved.',
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
          text: 'Family details are not saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => { });
        this.getMyProfile();
      }
    });
  }

  saveEmployeeFamilyDetails(data: any) {
    let employeeFamilyDetails = new EmployeeFamilyDetails();
    employeeFamilyDetails.BrelSlno = data.data.BrelSlno;
    employeeFamilyDetails.EmployeeSlno = this.profile.EmpSLNo;
    employeeFamilyDetails.Uniqueno = this.profile.UniqueNo;
    employeeFamilyDetails.Userslno = 1;
    employeeFamilyDetails.Isdependent = 0;
    employeeFamilyDetails.RelationName = data.data.RelationName;
    employeeFamilyDetails.Description =data.data.Description;
    employeeFamilyDetails.BloodRelation = data.data.BloodRelation;
    employeeFamilyDetails.RelationDOB =data.data.RelationDOB;

    this.employeeService.updateEmployeeFamilyDetails(employeeFamilyDetails).subscribe((result: any) => {
      if (result) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, family details are successfully saved.',
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
          text: 'Family details are not saved Saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => { });
        this.getMyProfile();
      }
    });
  }

  deleteSelectedFamilyMember(event: any) {
    let rowData = event.data;
    let empFamSlno = rowData.EmpFamSlno;
    this.employeeService.deleteSelectedFamilyMember(empFamSlno).subscribe((data: any) => {
      if (data) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Family member is successfully deleted.',
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then((result) => {
          this.getMyProfile();
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: 'Family member is not deleted.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    });
  }
}
