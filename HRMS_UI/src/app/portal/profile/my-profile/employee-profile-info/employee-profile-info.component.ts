import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { EmployeeService, StorageService } from 'src/app/core/services';
@Component({
  selector: 'app-employee-profile-info',
  templateUrl: './employee-profile-info.component.html',
  styleUrls: ['./employee-profile-info.component.css']
})
export class EmployeeProfileInfoComponent implements OnInit, OnDestroy {
  @Input() employeeProfileData: any;
  teamMembers: any;
  processed: any;
  profile : any  ;
  pageSettings:any;
  filterSettings:any;
  loadingIndicator:any;
  constructor(public activeModal: NgbActiveModal,
    private readonly employeeService: EmployeeService,) {
  }
  ngOnInit(): void {
    this.pageSettings = { pageCount: 14 };
    this.filterSettings = { type: 'Menu' };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
    this.getMyProfile();
    this.getMyTeamMembers();
  }
  getMyProfile() {
      let employeeSlno = this.employeeProfileData.EmployeeSlno;
        this.employeeService.getMyprofile(employeeSlno).subscribe(data => {
          if(this.profile === undefined){
          this.profile = data;
          this.profile.EmployeeExperienceDetails
          }
        });
    }
    getMyTeamMembers() {    
      this.processed = false;
      let employeeSlno =  this.employeeProfileData.EmployeeSlno;
      let searchCritera =
      {
        ManagerId: employeeSlno,
        IncludeSelf: 2
      }
      this.employeeService.getMyTeamMembers(searchCritera).subscribe(data => {
        this.teamMembers = data.Items;
      });
    }
    ngOnDestroy(): void {
      //Called once, before the instance is destroyed.
      //Add 'implements OnDestroy' to the class.
      this.activeModal.dismiss();
    }
}
