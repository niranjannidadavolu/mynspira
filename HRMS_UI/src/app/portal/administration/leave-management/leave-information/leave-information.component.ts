import { filter } from 'rxjs/operators';
import { LeaveInformation } from './../../../../core/models/administration/leave-information.model';
import { Component, Input, OnChanges, OnInit, Pipe, PipeTransform, SimpleChanges } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Subscription } from 'rxjs';
import { LeaveInformations } from 'src/app/core/models/leave-management/leave-policy-information';
import { StorageService } from 'src/app/core/services';
import { LeaveInformationService } from 'src/app/core/services/administration/leave-information.service';
import Swal from 'sweetalert2';
import { LeaveInformationPopupComponent } from './leave-information-popup/leave-information-popup.component';
import { stringify } from 'querystring';

@Component({
  selector: 'app-leave-information',
  templateUrl: './leave-information.component.html',
  styleUrls: ['./leave-information.component.scss']
})
export class LeaveInformationComponent implements OnInit {
  popupPosition:any;
  leaveInformation: any;
  employeeProfile: any;
  gridData: any;
  subscriptionName: Subscription;
  showFilterRow: boolean | undefined;
  currentFilter:boolean| undefined;
  filterLeaveType:any;
  filterPolicyName:any;
  filterOfficeType: any;
  constructor(private readonly leaveInformationService: LeaveInformationService, private readonly storageService: StorageService, private readonly modalService: NgbModal) {
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.subscriptionName = new Subscription();
    this.showFilterRow=true;
    this.currentFilter=true;
    this.popupPosition = {
      of: window, at: 'top', my: 'top', offset: { y: 10 },
    };
    this.getleaveInformation();

  }

  ngOnInit(): void {
    this.getleaveInformation();
  }
  //GetLeaveInformation
  getleaveInformation() {
    this.leaveInformationService.getLeaveInformation(this.employeeProfile.EmployeeSlno).subscribe((data: any) => {
        this.leaveInformation = data;
    //    //console.log(data);
     this.filterLeaveType= this.removeleaveTypeDuplicates( data);
     this.filterPolicyName= this.removePolicyNDuplicates( data);
     this.filterOfficeType=this.removeOfficeTypeDuplicates( data);
    });
  }
  
  removeleaveTypeDuplicates(data:any)
  {
   // 
    const leaveTypeArray:any= [];
    let leaveTypes = data.map((p:any) => p.LeaveTypeName);
    const uniqueLeaveType = Array.from(new Set(leaveTypes.map((p:any) => JSON.stringify(p)))).map((p:any) => JSON.parse(p));
    leaveTypeArray.push(uniqueLeaveType)
    const mapped = Object.entries(uniqueLeaveType).map(([id, value]) => ({id, value}));
    return mapped;
  }
  removePolicyNDuplicates(data:any)
  {
   // 
    const leaveTypeArray:any= [];
    let policyName = data.map((p:any) => p.PolicyName);
    const uniquePolicyName = Array.from(new Set(policyName.map((p:any) => JSON.stringify(p)))).map((p:any) => JSON.parse(p));
    leaveTypeArray.push(uniquePolicyName)
    const mapped = Object.entries(uniquePolicyName).map(([id, value]) => ({id, value}));
    return mapped;
  }
  removeOfficeTypeDuplicates(data:any)
  {
   // 
    const officeTypeArray:any= [];
    let officeType = data.map((p:any) => p.OfficeTypeName);
    const uniqueOfficeType = Array.from(new Set(officeType.map((p:any) => JSON.stringify(p)))).map((p:any) => JSON.parse(p));
    officeTypeArray.push(uniqueOfficeType)
    const mapped = Object.entries(uniqueOfficeType).map(([id, value]) => ({id, value}));
    return mapped;
  }
  eventAction(event: any, eventName: string) {
    let data = event.data;
   
    if (eventName == "update") {
      this.updateLeaveInformation(data);
    }
    else if (eventName == "new") {
      this.saveLeaveInformation(data);
    }
  }
  applyLeaveInformationPolicy(leavePolicyinfoData?: any)
  {
    const modalRef = this.modalService.open(LeaveInformationPopupComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = leavePolicyinfoData ? leavePolicyinfoData.data : null;
    modalRef.result.then(() => {
      this.getleaveInformation();
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


  saveLeaveInformation(data: any) {
    this.leaveInformationService.savedLeaveInformation(data).subscribe((result: any) => {
      if (result) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah,  Leave Information is successfully saved.',
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => {
          this.getleaveInformation();
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: ' Leave  Information is not . saved.',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => { });
        this.getleaveInformation();
      }
    });
  }

  updateLeaveInformation(data: LeaveInformations) {
    this.leaveInformationService.updateLeaveInformation(data).subscribe((result: any) => {
      if (result) {
        Swal.fire({
          title: 'Well done !',
          text: 'Aww yeah, Leave Information is successfully Updated.',
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => {
          this.getleaveInformation();
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: 'Leave  Information is Not Updated ',
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then(() => { });
        this.getleaveInformation();
      }
    });
  }
//Active Status button

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
    title:  `Are you sure want to ${obj.StatusID == 1 ? 'Activate': 'InActivate'}? \n ( ${obj.LeaveInformationID}  - ${obj.LeaveInformationName.toLowerCase()} )`,
    showCancelButton: true,
    confirmButtonText: 'Yes',
    cancelButtonText: 'No',
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) {
  this.leaveInformationService.updateLeaveInformation(obj).subscribe((result: any) => {
    if (result) {
      this.savedResponse(obj.StatusID);
    }
    else {
      this.errorResponse();
    }
  });
}
else{
  this.getleaveInformation();
}
})

}

savedResponse(StatusID: number) {

  Swal.fire({
  
    title: 'Well done !',
    text: `Aww yeah, Leave Information details are successfully ${StatusID == 1 ? 'activated': 'inactivated'}.`,
    icon: 'success',
    confirmButtonColor: 'rgb(54, 69, 116)',
    confirmButtonText: 'Ok'
  }).then(() => {
    this.getleaveInformation();
  });
}
errorResponse() {
  Swal.fire({
    title: 'Oops...! Something went Wrong !',
    text: 'Leave Information details are not Saved.',
    icon: 'warning',
    confirmButtonColor: 'rgb(54, 69, 116)',
    confirmButtonText: 'Ok'
  }).then(() => { });
}
  //Delete

  deleteRow(row: any) {
    Swal.fire({
      title:  `Are you sure want to delete? \n ( ${row.data.LeaveInformationName})`,
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        this.leaveInformationService.deleteLeaveInformation(row.data.LeaveInformationID).subscribe(res => {
          if (res) {
           this.getleaveInformation();

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
}

@Pipe({ name: 'gridCellData' })
export class GridCellDataPipe implements PipeTransform {
  transform(gridData: any) {
    return gridData.data['LeaveStatusStyle'];
  }
}