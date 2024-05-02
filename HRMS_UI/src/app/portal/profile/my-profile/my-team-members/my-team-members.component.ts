import { Component, DebugElement, Input, OnInit } from '@angular/core';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { finalize } from 'rxjs/operators';
import { EmployeeService, StorageService } from 'src/app/core/services';
import { ApplyEmployeeLeaveComponent } from 'src/app/portal/leave-management/apply-employee-leave/apply-employee-leave.component';
import Swal from 'sweetalert2';
import { EmployeeProfileInfoComponent } from '../employee-profile-info/employee-profile-info.component';
@Component({
  selector: 'app-my-team-members',
  templateUrl: './my-team-members.component.html',
  styleUrls: ['./my-team-members.component.scss']
})
export class MyTeamMembersComponent implements OnInit {
  processed: any;
  loggedInUser: any;
  teamMembers: any;
  // showFilterRow: boolean;
  // showHeaderFilter: boolean;
  // applyFilterTypes: any;
  // currentFilter: string;
  @Input() refreshData: boolean = false;
  isSubmitted = false;
  filterSettings:any;
  pageSettings:any;
  loadingIndicator:any;
  constructor(
    private readonly storageService: StorageService,
    private readonly employeeService: EmployeeService,
    private readonly modalService: NgbModal,
    private readonly employeeInformationService: EmployeeService,
  ) {
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
  }
  ngOnInit(): void {
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 14 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
    this.getMyTeamMembers();
  }
  getMyTeamMembers() {    
    this.processed = false;
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    let searchCritera =
    {
      ManagerId: employeeSlno,
      IncludeSelf: 2
    }
    this.employeeService.getMyTeamMembers(searchCritera).subscribe(data => {
      this.teamMembers = data.Items;
    });
  }
  applyEmployeeLeave(employeeleaveData: any, isManager?: boolean) {
    let leave = employeeleaveData;
    let employeeslno =leave.key;
    const modalRef = this.modalService.open(ApplyEmployeeLeaveComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = employeeleaveData;
    modalRef.result.then(() => {
      this.refreshData = true;
    },
    (reason) => {
      let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }
  openEmployeeProfileInfarmation(employeeData: any) {
    const modalRef = this.modalService.open(EmployeeProfileInfoComponent, { size: 'xl', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.employeeProfileData = employeeData;
    modalRef.result.then(() => {
    },
    (reason) => {
      let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }
  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
}
ngOnDestroy() { // It's a good practice to unsubscribe to ensure no memory leaks
  this.modalService.dismissAll();
}
}
