import { Component, OnInit } from '@angular/core';
import { toJSDate } from '@ng-bootstrap/ng-bootstrap/datepicker/ngb-calendar';
import { EmployeeService, InvestmentService, StorageService } from 'src/app/core/services';
import { EmployeeFamilyDetails } from 'src/app/core/models/employee/employee-family-details'
import Swal from 'sweetalert2';
import { PancardVerficationComponent } from 'src/app/shared/app-components/pancard-verfication/pancard-verfication.component';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-my-profile',
  templateUrl: './my-profile.component.html',
  styleUrls: ['./my-profile.component.scss']
})

export class MyProfileComponent implements OnInit {
  breadCrumbItems!: Array<{}>;
  loggedInUser: any;
  profile: any;
  searchTerm: any;
  familyMembers: any[];
  experienceDetails: any[];
  educationDetails: any[];
  bloodRelationData: any[];
  educationData: { key: string, value: string }[];
  courseNames: { key: string, value: string }[];
  isFamilySubmitted: boolean;
  isExperienceSubmitted: boolean;
  isEducationSubmitted: boolean;
  isLoaded: boolean;

  selectValue = ['Illustrator', 'Photoshop', 'CSS', 'HTML', 'Javascript', 'Python', 'PHP'];
  processed: boolean | undefined;
  taxDetails: any;
  constructor(private readonly storageService: StorageService,
    private readonly modalService: NgbModal,
    private readonly employeeService: EmployeeService,
    private readonly investmentService: InvestmentService) {
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.profile = JSON.parse(this.storageService.get('EmployeeProfile', 1));
    this.familyMembers = [];
    this.experienceDetails = [];
    this.educationDetails = [];
    this.isFamilySubmitted = false;
    this.isExperienceSubmitted = false;
    this.isEducationSubmitted = false;
    this.isLoaded = false;
    this.bloodRelationData = [];
    this.educationData = [];
    this.courseNames = [];
  }

  ngOnInit(): void {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'My Profile', active: true }
    ];
    this.getMyProfile();
    this.getMyTaxCalculations();
  }

  getMyProfile() {
    this.processed = false;
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.employeeService.getMyprofile(employeeSlno).subscribe(data => {
      this.processed = true;
      this.profile = data;
      this.familyMembers = this.profile.EmployeeFamilyDetails;
      this.experienceDetails = this.profile.EmployeeExperienceDetails;
      this.educationDetails = this.profile.EmployeeEducationDetails;
    });
  }
  getMyTaxCalculations() {
    let loggedInUserData = this.storageService.get("LoggedInUser", 1);
    if (loggedInUserData) {
      let loggedInUser = JSON.parse(loggedInUserData);
      this.investmentService.getIncomeTaxPaymentDetails(loggedInUser.EmployeeSlno).subscribe((data: any) => {
        this.taxDetails = data;
      })
    }
  }

  //Family Details
  onEditorPreparing(e: any) {
    if (e.dataField === 'BloodRelation' && e.parentType === 'dataRow') {
      e.editorOptions.readonly = true;
    }
  }

  onToolbarPreparing(e: any) {
    let toolbarItems = e.toolbarOptions.items;
    let addRowButton = toolbarItems.find((x: any) => x.name === "addRowButton");
    addRowButton.options.text = "Add new Family member";
    addRowButton.showText = "always";
  } 
  

  getFamilyBloodRelationDetails() {
    this.employeeService.getFamilyBloodRelationDetails().subscribe(data => {
      this.bloodRelationData = data;
    })
  }

  saveFamilyMembers(data: any) {
    
    this.employeeService.updateEmployeeFamilyDetails(data.data).subscribe((result: any) => {
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
          text: 'Family details are not Saved.',
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
          text: 'Aww yeah, Family Member Is Successfully Deleted.',
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
          text: 'Family Member Is Not Deleted.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    });
  }

  saveEmployeeFamilyDetails(event: any)
  {   
    let data=event.changes[0].data;
    this.employeeService.updateEmployeeFamilyDetails(data).subscribe((result: any) => {
      if (result) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Family details are saved successfully saved.',
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

  

  //Exceperience Details 
  updateExperienceData(data: any) {
    this.employeeService.updateEmployeeExperienceDetails(data.data).subscribe((result: any) => {
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
    addRowButton.options.text = "Add new Experience details";
    addRowButton.showText = "always";
  }

  deleteExceperienceDetails(event: any) {   
    let rowData = event.data;    
    let empExSlno = rowData.EmpExSlno;    
    this.employeeService.deleteExceperienceDetails(empExSlno).subscribe((data: any) => {
      if (data) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Exceperience details are successfully deleted.',
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
          text: 'Exceperience are not deleted.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    });
  }

  saveEmployeeExperienceDetails(event: any)
  {   
    let data=event.changes[0].data;
    this.employeeService.updateEmployeeExperienceDetails(data).subscribe((result: any) => {
      if (result) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Experience details are saved successfully saved.',
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
          text: 'Experience details are not saved Saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => { });
        this.getMyProfile();
      }
    });
  }


  //Education Details  
  getEducationDetails() {
    this.employeeService.getEducationDetails().subscribe(data => {
      this.educationData = data;
    })
  }

  getEducationCourseDetails() {
    this.employeeService.getEducationCourseDetails().subscribe(data => {
      
      this.courseNames = data;
    })
  }

  saveEducationData(data: any) {
    this.employeeService.updateEmployeeEducationDetails(data.data).subscribe((result: any) => {
      if (result) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Education details are successfully saved.',
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
          text: 'Education details are not saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => { });
        this.getMyProfile();
      }
    });
  }  

  deleteEducationDetails(event: any) {   
    let rowData = event.data;    
    let Empeduslno = rowData.Empeduslno ;    
    this.employeeService.deleteEducationDetails(Empeduslno).subscribe((data: any) => {
      if (data) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Education details are successfully deleted.',
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
          text: 'Education details are not deleted.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    });
  }

  onToolbarPreparingEducation(e: any) {
    let toolbarItems = e.toolbarOptions.items;
    let addRowButton = toolbarItems.find((x: any) => x.name === "addRowButton");
    addRowButton.options.text = "Add new Education details";
    addRowButton.showText = "always";
  }

  saveEmployeeEducationDetails(event: any)
  {   
    let data=event.changes[0].data;
    this.employeeService.updateEmployeeEducationDetails(data).subscribe((result: any) => {
      if (result) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Education details are saved successfully saved.',
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
          text: 'Education details are not saved Saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => { });
        this.getMyProfile();
      }
    });
  }


  pancard(pancard: boolean) {
    const modalRef = this.modalService.open(PancardVerficationComponent, { size: 'lg', centered: true, backdropClass: 'customBackdrop' });

    // modalRef.componentInstance.peofileInfo = obj;
    modalRef.result.then(() => {
      this.getMyProfile();
    });
  }

}
