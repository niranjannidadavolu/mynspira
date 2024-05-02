import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { filter } from 'rxjs/operators';
import { commonMethods } from 'src/app/core';
import { EducationDetail } from 'src/app/core/models/employee/education-detail.model';
import { EmployeeService, StorageService } from 'src/app/core/services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-create-education-details',
  templateUrl: './create-education-details.component.html',
  styleUrls: ['./create-education-details.component.scss']
})
export class CreateEducationDetailsComponent implements OnInit {

  isSubmitted: boolean = false;
  educationFrom!: FormGroup;
  LeaveBalance: any;
  @Input() public selectedRowData: any;
  @Input() public type: any = null;
  courseNames: any;
  employeeProfile: any;
  filterCourseNames!: any;
  additionalQualification: any;
  profile: any;
  educationData: any;
  constructor(
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    private readonly storageService: StorageService,
    private readonly employeeService: EmployeeService,
  ) {

    this.employeeProfile = JSON.parse(this.storageService.get('EmployeeProfile', 1));
    this.getEducationDetails();
    this.getEducationCourseDetails();
    this.getAdditionalQualification();
    // this.filterCourseNames = this.filterCourseNamess.bind(this);
  }
  createForm() {
    this.educationFrom = this.formBuilder.group({
      EmployeeSlno: [this.employeeProfile.EmployeeSlno],
      EducationSlno: ['', [Validators.required]],
      EducourseSlno: ['', [Validators.required]],
      HtNo: ['', [Validators.required]],
      CollegeName: ['', [Validators.required]],
      UniversityBoard: ['', [Validators.required]],
      UniversityBoardName: [''],
      Specialization: [''],
      YearOfPassing: ['', [Validators.required]],
      Percentage: ['', [Validators.required]],
      Marksobtained: ['', [Validators.required]],
      Addquaslno: ['',],
      Reasonforgap: ['',],
      ExtraActivities: [''],
      Empeduslno: ['']
    });

  }
  ngOnInit(): void {
    this.createForm();
    let data = this.selectedRowData;
    //console.log("sekecte ", data);

    if (data) {
      this.educationFrom.patchValue({
        EmployeeSlno: data.EmployeeSlno,
        EducationSlno: data.EducationSlno,
        EducourseSlno: data.EducourseSlno,
        //  EducourseSlno: data.EducationCourse,
        HtNo: data.HtNo,
        CollegeName: data.CollegeName,
        UniversityBoard: data.UniversityBoardName,
        UniversityBoardName: data.UniversityBoardName,
        Specialization: data.Specialization,
        YearOfPassing: data.YearOfPassing,
        Percentage: data.Percentage,
        Marksobtained: data.Marksobtained,
        Reasonforgap: data.Reasonforgap,
        ExtraActivities: data.ExtraActivities,
        Addquaslno: data.AddEduSlno,
      });
    }


  }
  valueChanged(data: any) {
    this.educationFrom.controls['EducourseSlno'].reset('');
    let d = data;
    this.filterCourseNamess(data);

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
      //console.log("this.additionalQualification", this.additionalQualification);

    })
  }

  setStateValue(rowData: any, value: any): void {
    rowData.EducourseSlno = null;
    (<any>this).defaultSetCellValue(rowData, value);
  }

  filterCourseNamess(options: any) {

    this.filterCourseNames = this.courseNames.filter((x: any) => options.EducationSlno == x.EducationSlno);
    //console.log("filterCourseNames", this.filterCourseNames)
  }


  getEducationCourseDetails() {
    let slno = 1;
    this.employeeService.getEducationCourseDetails().subscribe(data => {
      this.courseNames = data;
      //console.log("courseNames", this.courseNames);

    })
  }

  get f() { return this.educationFrom.controls; }
  numberOnly(event: any): boolean {
    return commonMethods.isNumberKey(event);
  }

  OnSubmit() {

    if (this.educationFrom.invalid) {
      this.isSubmitted = true;
    }
    let data = this.educationFrom.value
    if (this.type == "Edit") {
      this.updateEducationData(data);
    }
    else if (this.type == "Add") {
      let educationDetail = new EducationDetail();
      educationDetail.CollegeName = data.CollegeName;
      educationDetail.Addquaslno = data.Addquaslno;
      educationDetail.EducationSlno = data.EducationSlno;
      educationDetail.EducourseSlno = data.EducourseSlno;
      educationDetail.EmployeeSlno = this.employeeProfile.EmpSLNo;
      //educationDetail.Empeduslno=2;
      educationDetail.ExtraActivities = data.ExtraActivities;
      educationDetail.HtNo = data.HtNo;
      educationDetail.Marksobtained = data.Marksobtained;
      educationDetail.Percentage = data.Percentage;
      educationDetail.Reasonforgap = data.Reasonforgap;
      educationDetail.Specialization = data.Specialization;
      educationDetail.Uniqueno = this.employeeProfile.UniqueNo;
      educationDetail.UserSlno = 1;
      educationDetail.UniversityBoard = data.UniversityBoard;
      educationDetail.UniversityBoardName = data.UniversityBoardName;
      educationDetail.YearOfPassing = data.YearOfPassing;
      this.saveEmployeeEducationDetails(educationDetail);
    }
  }
  updateEducationData(data: any) {
    this.employeeService.updateEmployeeEducationDetails(data).subscribe((result: any) => {
      if (result) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, education details are successfully saved.',
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
          text: 'Education details are not saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => { });
        //this.getMyProfile();
      }
      return;
    });
  }
  saveEmployeeEducationDetails(event: any) {
    let data = event;
    this.employeeService.updateEmployeeEducationDetails(data).subscribe((result: any) => {
      if (result) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Education details are saved successfully saved.',
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
          text: 'Education details are not saved Saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => { });
        // this.getMyProfile();
      }
      return;
    });
  }
}
