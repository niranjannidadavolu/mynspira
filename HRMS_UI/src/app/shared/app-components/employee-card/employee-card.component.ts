import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { JSON_MIME_TYPE } from 'ngx-drag-drop/lib/dnd-utils';
import { Subscription } from 'rxjs';
import { EmployeeService, InvestmentService, StorageService } from 'src/app/core/services';
import { EmployeeEmailVerifyComponent } from '../employee-email-verify/employee-email-verify.component';
import { EmployeePersonalEmailVerifyComponent } from '../employee-personal-email-verify/employee-personal-email-verify.component';

@Component({
  selector: 'app-employee-card',
  templateUrl: './employee-card.component.html',
  styleUrls: ['./employee-card.component.scss']
})
export class EmployeeCardComponent implements OnInit, OnDestroy {

  profile: any;
  taxDetails: any;
  @Input() showTaxCalculations: boolean;
  subscriptionName: Subscription;
  canRefreshProfileData: boolean;

  constructor(
    private readonly storageService: StorageService,
    private readonly employeeService: EmployeeService,
    private readonly investmentService: InvestmentService,
    private readonly modalService: NgbModal,
  ) {
    this.showTaxCalculations = false;
    this.canRefreshProfileData = true;
    this.getMyProfile();
    this.getMyTaxCalculations();
    this.subscriptionName = new Subscription();

  }

  ngOnInit(): void {
    this.subscriptionName = this.employeeService.getUpdate().subscribe
      ((isApplyLeave: boolean) => { //message contains the data sent from service
        if (isApplyLeave) {
          this.canRefreshProfileData = true;
          this.getMyProfile();
        }
      });
  }

  getMyProfile() {
    let loggedInUserData = this.storageService.get("LoggedInUser", 1);
    if (loggedInUserData) {
      let loggedInUser = JSON.parse(loggedInUserData);
      let employeeSlno = loggedInUser.EmployeeSlno;
      this.profile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
      if (this.canRefreshProfileData) {
        this.employeeService.getEmployeeMinimumProfile(employeeSlno).subscribe(data => {
          this.profile = data;
          this.storageService.save("EmployeeProfile", JSON.stringify(data), 1);
          this.canRefreshProfileData = false;
        });
      }
    }
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

  refreshTaxCalculations(): void {
    this.getMyTaxCalculations();
  }
  editWorkEmail() {
    const modalRef = this.modalService.open(EmployeeEmailVerifyComponent, { size: 'lg', centered: true, backdropClass: 'customBackdrop' });
    let obj = {
      profile: this.profile,
    }
    modalRef.componentInstance.peofileInfo = obj;
    modalRef.result.then(() => {
      this.canRefreshProfileData = true;
      this.getMyProfile();
    });
  }
  editPersonalEmail() {
    const modalRef = this.modalService.open(EmployeePersonalEmailVerifyComponent, { size: 'lg', centered: true, backdropClass: 'customBackdrop' });
    let obj = {
      profile: this.profile,
    }
    modalRef.componentInstance.peofileInfo = obj;
    modalRef.result.then(() => {
      this.canRefreshProfileData = true;
      this.getMyProfile();
    });
  }
  ngOnDestroy(): void {
    this.modalService.dismissAll();
  }
}
