import { Component, Input, OnInit } from '@angular/core';
import { EmployeeService, StorageService } from 'src/app/core/services';
@Component({
  selector: 'app-employee-assets',
  templateUrl: './employee-assets.component.html',
  styleUrls: ['./employee-assets.component.scss']
})
export class EmployeeAssetsComponent implements OnInit {
  employeeAssetDetails: any = [];
  loggedInUser: any;
  pageSettings!: Object;
  filterSettings:any;
  loadingIndicator:any;
  constructor(private readonly employeeService: EmployeeService,
    private readonly storageService: StorageService
  ) {
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
  }
  ngOnInit(): void {
    this.pageSettings = { pageCount: 14 };
    this.filterSettings = { type: 'Menu' };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
    this.getMyProfile();
  }
  getMyProfile() {
    //  this.processed = false;
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.employeeService.getMyprofile(employeeSlno).subscribe(data => {
      // if (data) {
      //   this.processed = true;
      //   this.profile = data;
      this.employeeAssetDetails = data.EmployeeAssetDetails;
      // }
    });
  }
}
