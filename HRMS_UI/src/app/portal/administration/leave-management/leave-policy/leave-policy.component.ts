import { Component, Input, OnInit, Pipe, PipeTransform } from '@angular/core';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Subscription } from 'rxjs';
import { LeavePolicyInformation } from 'src/app/core/models/leave-management/leave-policy-information';
import { StorageService } from 'src/app/core/services';
import { LeavePolicyService } from 'src/app/core/services/administration/leave-policy.service';
import Swal from 'sweetalert2';
import { LeavePopupComponent } from './leave-popup/leave-popup.component';

@Component({
  selector: 'app-leave-policy',
  templateUrl: './leave-policy.component.html',
  styleUrls: ['./leave-policy.component.scss']
})
export class LeavePolicyComponent implements OnInit {
  showFilterRow: boolean;
  currentFilter: boolean;
  leavePolicyInformation: any;
  employeeProfile: any;
  gridData: any;
  subscriptionName: Subscription;
  leavePolicyServices: any;
  @Input() refreshData: boolean = false;
  constructor(private readonly leavePolicyService: LeavePolicyService,
     private readonly storageService: StorageService,
      private readonly modalService: NgbModal
      ) {
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.subscriptionName = new Subscription();
    this.showFilterRow = true;
    this.currentFilter = true;
  }

  ngOnInit(): void {
    this.getleavePolicyInformation();
  }
  getleavePolicyInformation() {
    this.leavePolicyService.getLeavePloicyInformation().subscribe((data: any) => {
      this.leavePolicyInformation = data;
    });

  }
  applyLeavePolicy(leavePolicyData?: any) {
    const modalRef = this.modalService.open(LeavePopupComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = leavePolicyData ? leavePolicyData.data : null;
    modalRef.result.then(() => {
      this.getleavePolicyInformation();
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

  //delete

  deleteRow(row: any) {
    Swal.fire({
      title:  `Are you sure want to delete? \n ( ${row.data.PolicyName})`,
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        this.leavePolicyService.deleteLeavePolicyInformation(row.data.PolicyID).subscribe((res: any) => {
          if (res) {
      this.getleavePolicyInformation();

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

  }


  //statuid

  onStatusChange(event: any){
    ////console.log(event.data);
    
    let obj = {
      ...event.data
    }
    if(obj.StatusID == 1){
      obj.StatusID = 2
    }else{
      obj.StatusID = 1
    }
    Swal.fire({
      title:  `Are you sure want to ${obj.StatusID == 1 ? 'Activate': 'Inactivate'}? \n ( ${obj.PolicyID}  - ${obj.PolicyName.toLowerCase()} )`,
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
    this.leavePolicyService.updateLeavePolicyInformation(obj).subscribe((result: any) => {
      if (result) {
        this.savedResponse(obj.StatusID);
      }
      else {
        this.errorResponse();
      }
    });
  }
  })
  }
  
  savedResponse(StatusID: number) {
      Swal.fire({
        title: 'Well done !',
      text: `Aww yeah, Leave Policy details are successfully ${StatusID == 1 ? 'activated': 'inactivated'}.`,
      icon: 'success',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    }).then(() => {
      this.getleavePolicyInformation();
    });
  }
  errorResponse() {
    Swal.fire({
      title: 'Oops...! Something went Wrong !',
      text: 'Leave Policy details are not Saved.',
      icon: 'warning',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    }).then(() => { });
  }
}
@Pipe({ name: 'gridCellData' })
export class GridCellDataPipe implements PipeTransform {
  transform(gridData: any) {
    return gridData.data['LeaveStatusStyle'];
  }
}