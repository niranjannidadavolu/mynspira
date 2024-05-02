import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { StorageService } from 'src/app/core/services';
import { KraInformationService } from 'src/app/core/services/perfomance-management';
import { KraInformationComponent } from './kra-information/kra-information.component';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-kra-management',
  templateUrl: './kra-management.component.html',
  styleUrls: ['./kra-management.component.scss']
})
export class KraManagementComponent implements OnInit {

  breadCrumbItems: any;
  filterSettings: any;
  loadingIndicator: any;
  employeeProfile: any;
  loggedInUser: any;
  kraInformations: any;
  pageSettings: any;

  constructor(
    private readonly storageService: StorageService,
    private readonly kraInformationService: KraInformationService,
    private readonly modalSerivce: NgbModal
  ) {
    this.breadCrumbItems = [
      { label: 'PMS' },
      { label: 'KRA Management', active: true }
    ];
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 13 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
    this.employeeProfile = this.storageService.getParsedData("EmployeeProfile", 1);
    this.loggedInUser = this.storageService.getParsedData("LoggedInUser", 1);
    this.getAllKraInformations();
  }

  getAllKraInformations() {
    this.kraInformationService.getAllKraInformations().subscribe((data: any) => {
      if (data) {
        this.kraInformations = data;
      }
    });
  }

  ngOnInit(): void {
  }
  showModalWindow(mode: any, data: any) {
    const modalRef = this.modalSerivce.open(KraInformationComponent, {
      size: "lg",
      centered: true,
      backdrop: "static",
      backdropClass: "customBackdrop",
    });
    
    modalRef.componentInstance.data = data;
    modalRef.componentInstance.mode = mode;
    modalRef.result.then(
      (data: any) => {
        this.getAllKraInformations();
      },
      (reason: any) => {
        this.getAllKraInformations(); 
      }
    );
  }
  onEditClick(data: any) {
    this.showModalWindow('Update', data);
  }

  onViewClick(data: any) {
    this.showModalWindow('View', data);
  }
  onKpiMapClick(data: any)
  {

  }
  addKraInformation() {
    this.showModalWindow('Add', null);
  }
  onDeleteClick(data: any) {
    Swal.fire({
      position: 'center',
      title: 'Are you sure?',
      text: 'This process is irreversible.',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, go ahead.',
      cancelButtonText: 'No, let me think'
    }).then((result) => {
      if (result.value) {
        this.kraInformationService.deleteKRAInformation(data.KraSlno).subscribe((res: any) => {
          if (res) {
            Swal.fire(
              'Removed!',
              'KRA Information removed successfully.',
              'success'
            );
            this.getAllKraInformations();
          }
        });
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire(
          'Cancelled',
          'KRA Information Not removed',
          'error'
        )
      }
    })
  }


}