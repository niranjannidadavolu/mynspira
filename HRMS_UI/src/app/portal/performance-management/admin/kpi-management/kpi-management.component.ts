import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import Swal from 'sweetalert2';
import { KpiInformationComponent } from './kpi-information/kpi-information.component';
import { StorageService, KraInformationService, KpiInformationService } from 'src/app/core/services';

@Component({
  selector: 'app-kpi-management',
  templateUrl: './kpi-management.component.html',
  styleUrls: ['./kpi-management.component.scss']
})
export class KpiManagementComponent implements OnInit {

  breadCrumbItems: any;
  filterSettings: any;
  loadingIndicator: any;
  employeeProfile: any;
  loggedInUser: any;
  kppInformations: any;
  pageSettings: any;

  constructor(private readonly storageService: StorageService,
    private readonly kraInformationService: KraInformationService,
    private readonly kpiInformationService: KpiInformationService,
    private readonly modalSerivce: NgbModal) {
    this.breadCrumbItems = [
      { label: 'PMS' },
      { label: 'KPP Management', active: true }
    ];
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 13 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
    this.employeeProfile = this.storageService.getParsedData("EmployeeProfile", 1);
    this.loggedInUser = this.storageService.getParsedData("LoggedInUser", 1);
    this.getAllKpiInformations();
  }

  ngOnInit(): void {
  }

  getAllKpiInformations() {
    this.kpiInformationService.getAllKpiInformations().subscribe((data: any) => {
      if (data) {
        this.kppInformations = data;
        console.log("data", data);
        
      }
    });
  }
  showModalWindow(mode: any, data: any) {
    const modalRef = this.modalSerivce.open(KpiInformationComponent, {
      size: "lg",
      centered: true,
      backdrop: "static",
      backdropClass: "customBackdrop",
    });
    
    modalRef.componentInstance.data = data;
    modalRef.componentInstance.mode = mode;
    modalRef.result.then(
      (data: any) => {
        this.getAllKpiInformations();
      },
      (reason: any) => {
        this.getAllKpiInformations();
      }
    );
  }

  onEditClick(data: any) {
    console.log("data", data);
    this.showModalWindow('Update', data);
  }

  onViewClick(data: any) {
    this.showModalWindow('View', data);
  }

  addKppInformation() {
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
        
        this.kpiInformationService.deleteKpiInformation(data.KpiSlno).subscribe((res: any) => {
          if (res) {
            Swal.fire(
              'Removed!',
              'KPP Information removed successfully.',
              'success'
            );
            this.getAllKpiInformations();
          }
        });
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire(
          'Cancelled',
          'KPP Information Not removed',
          'error'
        )
      }
    })
  }
}
