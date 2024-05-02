import { Component, OnInit } from '@angular/core';
import { EmployeeService, StorageService } from 'src/app/core/services';
import Swal from 'sweetalert2';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { CreateEducationDetailsComponent } from './create-education-details/create-education-details.component';

@Component({
  selector: 'app-education',
  templateUrl: './education.component.html',
  styleUrls: ['./education.component.scss']
})
export class EducationComponent implements OnInit {
  processed: boolean;
  profile: any;
  loggedInUser: any;
  courseNames: any;
  additionalQualification: any;
  educationData: { key: string, value: string }[];
  educationDetails: any[];
  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  public editparams = {
    params: { popupHeight: '300px' },
    template: '#template',  // Use this template in view mode
    editTemplate: '#editTemplate'  // Use this template in edit mode
  };

  constructor(private readonly storageService: StorageService,
    private readonly employeeService: EmployeeService,
    private readonly modalService: NgbModal) {
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.processed = false;
    this.educationDetails = [];
    this.educationData = [];
    this.getMyProfile();
    this.getEducationDetails();
    // this.getEducationCourseDetails();
    //this.getAdditionalQualification();
    //this.filterCourseNames = this.filterCourseNames.bind(this);
  }

  ngOnInit(): void {
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 14 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
  }

  openModalPopup(data: any, mode: any) {
    const modalRef = this.modalService.open(CreateEducationDetailsComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = data;
    modalRef.componentInstance.type = mode;
    modalRef.result.then(() => {
      this.getMyProfile();
    },
      (reason) => {
        // let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
      });
  }
  addEducationDetails() {
    this.openModalPopup(null, 'Add');
  }
  editEducationDetails(data: any, mode: any) {
    this.openModalPopup(data, mode);
    // const modalRef = this.modalService.open(CreateEducationDetailsComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    // modalRef.componentInstance.selectedRowData = event;
    //   modalRef.componentInstance.type = type;
    //  modalRef.result.then(() => {
    //   this.getMyProfile();
    //  },
    //    (reason) => {
    //      // let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    //    });
    // if (e.dataField === 'HtNo' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 30;
    // } 
    // if (e.dataField === 'CollegeName' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 150;
    // } 
    // if (e.dataField === 'UniversityBoard' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 1;
    // } 
    // if (e.dataField === 'UniversityBoardName' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 150;
    // } 
    // if (e.dataField === 'Specialization' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 30;
    // } 
    // if (e.dataField === 'YearOfPassing' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 4;
    // } 
    // if (e.dataField === 'Percentage' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 6;
    // } 
    // if (e.dataField === 'Marksobtained' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 4;
    // } 
    // if (e.dataField === 'Reasonforgap' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 100;
    // } 
    // if (e.dataField === 'ExtraActivities' && e.parentType === 'dataRow') {
    //   e.editorOptions.maxLength = 100;
    // } 
  }

  deleteEducationDetails(data: any) {
    Swal.fire({
      title: 'Do you want to save the changes?',
      showDenyButton: true,
      showCancelButton: true,
      confirmButtonText: 'Yes',
      denyButtonText: 'No',
      customClass: {
        actions: 'my-actions',
        confirmButton: 'order-2',
        denyButton: 'order-3',
      },
    }).then((result) => {
      if (result.isConfirmed) {
        let Empeduslno = data.Empeduslno;
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
      } else if (result.isDenied) {
        Swal.fire('Delete not intiated as the user rejected the changes.')
      }
    });
  }

  // valueChanged(data: any) {
  //   let d = data.value;
  // }
  getMyProfile() {
    this.processed = false;
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.employeeService.getMyprofile(employeeSlno).subscribe(data => {
      this.processed = true;
      this.profile = data;
      this.educationDetails = this.profile.EmployeeEducationDetails;
    });
  }

  //Education Details  
  getEducationDetails() {
    this.employeeService.getEducationDetails().subscribe(data => {
      
      this.educationData = data;
    })
  }

  getAdditionalQualification() {
    this.employeeService.getAdditionalQualification().subscribe(data => {
      this.additionalQualification = data;
    })
  }

  // setStateValue(rowData: any, value: any): void {
  //   rowData.EducourseSlno = null;
  //   (<any>this).defaultSetCellValue(rowData, value);
  // }

  // filterCourseNames(options: any) {
  //   return {
  //     store: this.courseNames,
  //     filter: options.data ? ['EducationSlno', '=', options.data.EducationSlno] : null,
  //   };
  // }

  // getEducationCourseDetails() {
  //   let slno = 1;
  //   this.employeeService.getEducationCourseDetails().subscribe(data => {
  //     this.courseNames = data;
  //   })
  // }

  // applyExperince(data: any) {
  //   const modalRef = this.modalService.open(CreateEducationDetailsComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
  //   modalRef.componentInstance.selectedRowData = data;
  //   modalRef.componentInstance.type = "Add";
  //   modalRef.result.then(() => {
  //     this.getMyProfile();
  //   },
  //     (reason) => {
  //       // let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
  //     });
  // }
  // eventAction(event: any, type: string) {
  //   let data = event.data;
  //   if (type == 'RowUpdated') {
  //     this.updateEducationData(data);
  //   }
  //   else if (type == 'RowInserting') {
  //     let educationDetail = new EducationDetail();
  //     educationDetail.CollegeName = data.CollegeName;
  //     educationDetail.Addquaslno = data.AddEduSlno;
  //     educationDetail.EducationSlno = data.EducationSlno;
  //     educationDetail.EducourseSlno = data.EducourseSlno;
  //     educationDetail.EmployeeSlno = this.profile.EmpSLNo;
  //     //educationDetail.Empeduslno=2;
  //     educationDetail.ExtraActivities = data.ExtraActivities;
  //     educationDetail.HtNo = data.HtNo;
  //     educationDetail.Marksobtained = data.Marksobtained;
  //     educationDetail.Percentage = data.Percentage;
  //     educationDetail.Reasonforgap = data.Reasonforgap;
  //     educationDetail.Specialization = data.Specialization;
  //     educationDetail.Uniqueno = this.profile.UniqueNo;
  //     educationDetail.UserSlno = 1;
  //     educationDetail.UniversityBoard = data.UniversityBoard;
  //     educationDetail.UniversityBoardName = data.UniversityBoardName;
  //     educationDetail.YearOfPassing = data.YearOfPassing;
  //     this.saveEmployeeEducationDetails(educationDetail);
  //   }
  // }

  // updateEducationData(data: any) {
  //   this.employeeService.updateEmployeeEducationDetails(data).subscribe((result: any) => {
  //     if (result) {
  //       Swal.fire({
  //         title: 'Well done !',
  //         text: 'Aww yeah, education details are successfully saved.',
  //         icon: 'success',
  //         confirmButtonColor: 'rgb(54, 69, 116)',
  //         confirmButtonText: 'Ok'
  //       }).then(() => {
  //         this.getMyProfile();
  //       });
  //     }
  //     else {
  //       Swal.fire({
  //         title: 'Oops...! Something went Wrong !',
  //         text: 'Education details are not saved.',
  //         icon: 'warning',
  //         confirmButtonColor: 'rgb(54, 69, 116)',
  //         confirmButtonText: 'Ok'
  //       }).then(() => { });
  //       this.getMyProfile();
  //     }
  //   });
  // }



  // onToolbarPreparingEducation(e: any) {
  //   let toolbarItems = e.toolbarOptions.items;
  //   let addRowButton = toolbarItems.find((x: any) => x.name === "addRowButton");
  //   addRowButton.options.text = "Add new education details";
  //   addRowButton.showText = "always";
  // }

  // saveEmployeeEducationDetails(event: any) {
  //   let data = event;
  //   this.employeeService.updateEmployeeEducationDetails(data).subscribe((result: any) => {
  //     if (result) {
  //       Swal.fire({
  //         title: 'Well done !',
  //         text: 'Aww yeah, Education details are saved successfully saved.',
  //         icon: 'success',
  //         confirmButtonColor: 'rgb(54, 69, 116)',
  //         confirmButtonText: 'Ok'
  //       }).then(() => {
  //         this.getMyProfile();
  //       });
  //     }
  //     else {
  //       Swal.fire({
  //         title: 'Oops...! Something went Wrong !',
  //         text: 'Education details are not saved Saved.',
  //         icon: 'warning',
  //         confirmButtonColor: 'rgb(54, 69, 116)',
  //         confirmButtonText: 'Ok'
  //       }).then(() => { });
  //       this.getMyProfile();
  //     }
  //   });
  // }
}
