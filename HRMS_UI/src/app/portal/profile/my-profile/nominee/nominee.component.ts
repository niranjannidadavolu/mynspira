import { formatDate } from "@angular/common";
import { Component, OnInit } from "@angular/core";
import { commonMethods } from "src/app/core/common/common.static";
import { EmployeeFamilyDetails } from "src/app/core/models/employee/employee-family-details";
import { EmployeeService, StorageService } from "src/app/core/services";
import Swal from "sweetalert2";
@Component({
  selector: "app-nominee",
  templateUrl: "./nominee.component.html",
  styleUrls: ["./nominee.component.scss"],
})
export class NomineeComponent implements OnInit {
  processed: boolean;
  loggedInUser: any;
  familyMembers: any;
  bloodRelationData: any;
  profile: any;
  Details: any;
  ESINo?: any;
  Doj?: any;
  PFNo?: any;
  Years: any;
  constructor(
    private readonly storageService: StorageService,
    private readonly employeeService: EmployeeService
  ) {
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.processed = false;
  }

  ngOnInit(): void {
    this.getMyProfile();
    this.getFamilyBloodRelationDetails();
  }

  //Family Details
  onEditorPreparing(e: any) {
    if (e.dataField === "RelationName" && e.parentType === "dataRow") {
      e.editorOptions.maxLength = 150;
      e.editorOptions.readonly = true;
    }
    if (e.dataField === "Description" && e.parentType === "dataRow") {
      e.editorOptions.maxLength = 800;
    }
    if (e.dataField === "Isdependent" && e.parentType === "dataRow") {
      e.editorOptions.maxLength = 3;
    }
  }

  onToolbarPreparingGT(e: any) {
    let toolbarItems = e.toolbarOptions.items;
    let addRowButton = toolbarItems.find((x: any) => x.name === "addRowButton");
    addRowButton.options.text = "Add New Nominee ";
    addRowButton.showText = "always";
  }
  onToolbarPreparingPF(e: any) {
    let toolbarItems = e.toolbarOptions.items;
    let addRowButton = toolbarItems.find((x: any) => x.name === "addRowButton");
    addRowButton.options.text = "Add New Nominee";
    addRowButton.showText = "always";
  }
  onToolbarPreparingESI(e: any) {
    let toolbarItems = e.toolbarOptions.items;
    let addRowButton = toolbarItems.find((x: any) => x.name === "addRowButton");
    addRowButton.options.text = "Add New Nominee";
    addRowButton.showText = "always";
  }

  getMyProfile() {
    this.processed = false;
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.employeeService.getMyprofile(employeeSlno).subscribe((data) => {

      if (data) {
        if (data.GrossSalary <= 21000) {
          this.ESINo = data.ESINo;
        }
        this.Doj = data.Doj;
        let currentDate = formatDate(new Date(), 'MM-dd-yyyy', 'en');
        let DateOfJoin = formatDate(this.Doj, 'MM-dd-yyyy', 'en');
        this.Years = this.calculateYears(new Date(DateOfJoin), new Date(currentDate));
        this.PFNo = data.PFUANNo;
        this.processed = true;
        this.profile = data;
        this.Details = data;
        this.familyMembers = data.EmployeeFamilyDetails;

      }
    });
  }
  calculateYears(startDate: Date, endDate: Date): number {
    const diffInMs = endDate.getTime() - startDate.getTime()
    const diffInYears = diffInMs / (1000 * 3600 * 24 * 365.25);
    return Math.floor(diffInYears);
  }
  getFamilyBloodRelationDetails() {
    this.employeeService.getFamilyBloodRelationDetails().subscribe((data) => {
      // this.bloodRelationData = data;
      this.bloodRelationData = [
        { BrelSlno: 1, BrelName: "FATHER" },
        { BrelSlno: 2, BrelName: "MOTHER" },
        // { BrelSlno: 3, BrelName: "BROTHER" },
        // { BrelSlno: 4, BrelName: "SISTER" },
        { BrelSlno: 5, BrelName: "SPOUSE" },
        { BrelSlno: 6, BrelName: "SON" },
        { BrelSlno: 7, BrelName: "DAUGHTER" },
        // { BrelSlno: 12, BrelName: "COUSIN" },
        // { BrelSlno: 14, BrelName: "FRIEND" },
        // { BrelSlno: 15, BrelName: "IN-LAWS" },
      ];
    });
  }

  eventAction(event: any, eventName: string) {
    let data = event.data;
    if (eventName == "update") {
      this.updateFamilyMembers(data);
    } else if (eventName == "new") {
      this.saveEmployeeFamilyDetails(data);
    }
  }

  updateFamilyMembers(data: any) {
    this.employeeService
      .updateEmployeeFamilyDetails(data)
      .subscribe((result: any) => {
        if (result) {
          Swal.fire({
            title: "Well done !",
            text: "Aww yeah, Family details are successfully saved.",
            icon: "success",
            confirmButtonColor: "rgb(54, 69, 116)",
            confirmButtonText: "Ok",
          }).then(() => {
            this.getMyProfile();
          });
        } else {
          Swal.fire({
            title: "Oops...! Something went Wrong !",
            text: "Family details are not saved.",
            icon: "warning",
            confirmButtonColor: "rgb(54, 69, 116)",
            confirmButtonText: "Ok",
          }).then(() => { });
          this.getMyProfile();
        }
      });
  }

  saveEmployeeFamilyDetails(data: any) {
    let employeeFamilyDetails = new EmployeeFamilyDetails();
    employeeFamilyDetails.BrelSlno = data.BrelSlno;
    employeeFamilyDetails.EmployeeSlno = this.profile.EmpSLNo;
    employeeFamilyDetails.Uniqueno = this.profile.UniqueNo;
    employeeFamilyDetails.Userslno = 1;
    employeeFamilyDetails.Isdependent = 0;
    employeeFamilyDetails.RelationName = data.RelationName;
    employeeFamilyDetails.Description = data.Description;
    employeeFamilyDetails.BloodRelation = data.BloodRelation;
    employeeFamilyDetails.RelationDOB = data.RelationDOB;

    this.employeeService
      .updateEmployeeFamilyDetails(employeeFamilyDetails)
      .subscribe((result: any) => {
        if (result) {
          Swal.fire({
            title: "Well done !",
            text: "Aww yeah, family details are successfully saved.",
            icon: "success",
            confirmButtonColor: "rgb(54, 69, 116)",
            confirmButtonText: "Ok",
          }).then(() => {
            this.getMyProfile();
          });
        } else {
          Swal.fire({
            title: "Oops...! Something went Wrong !",
            text: "Family details are not saved Saved.",
            icon: "warning",
            confirmButtonColor: "rgb(54, 69, 116)",
            confirmButtonText: "Ok",
          }).then(() => { });
          this.getMyProfile();
        }
      });
  }

  deleteSelectedFamilyMember(event: any) {
    let rowData = event.data;
    let empFamSlno = rowData.EmpFamSlno;
    this.employeeService
      .deleteSelectedFamilyMember(empFamSlno)
      .subscribe((data: any) => {
        if (data) {
          Swal.fire({
            title: "Well done !",
            text: "Aww yeah, Family member is successfully deleted.",
            icon: "success",
            confirmButtonColor: "rgb(54, 69, 116)",
            confirmButtonText: "Ok",
          }).then((result) => {
            this.getMyProfile();
          });
        } else {
          Swal.fire({
            title: "Oops...! Something went Wrong !",
            text: "Family member is not deleted.",
            icon: "warning",
            confirmButtonColor: "rgb(54, 69, 116)",
            confirmButtonText: "Ok",
          });
        }
      });
  }
}
