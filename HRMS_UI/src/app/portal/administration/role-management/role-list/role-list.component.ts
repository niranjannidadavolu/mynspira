import { Component, OnInit, Renderer2, ViewChild } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { DataTableDirective } from 'angular-datatables';
import { Subject, of } from 'rxjs';
import { RoleInformationService } from 'src/app/core/services';
import { AddRoleInformationComponent } from '../add-role-information/add-role-information.component';
import { EditRoleInformationComponent } from '../edit-role-information/edit-role-information.component';
import { ViewRoleInformationComponent } from '../view-role-information/view-role-information.component';
import CustomStore from 'devextreme/data/custom_store';
@Component({
  selector: 'app-role-list',
  templateUrl: './role-list.component.html',
  styleUrls: ['./role-list.component.scss']
})
export class RoleListComponent implements OnInit {
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective | undefined;
  breadCrumbItems!: Array<{}>;
  dtOptions: any = {};
  dtTrigger: Subject<any> = new Subject();
  roles: any;
  dataSource: any;
  Roles: any;
  statusType: any;
  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  constructor(
    public renderer: Renderer2,
    private readonly roleInformationService: RoleInformationService,
    private readonly modalService: NgbModal) {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Role Management', active: true }
    ];
    // this.getDataTableOptions();
    this.initDataSource();
    this.statusType = [{ id: 0, name: "Active" },
    { id: 1, name: "Inactive" }]
  }
  ngOnInit(): void {
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 14 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
  }
  getDataTableOptions() {
    this.dtOptions = {
      //dom: 'Blrtip',
      destroy: true,
      pagingType: 'full_numbers',
      lengthMenu: [[10, 20, 30, 50, -1], [10, 20, 30, 50, "All"]],
      pageLength: 20,
      searchDelay: 2000,
      //dom: 'lfrtipB',
      buttons: [
        'copy', 'csv', 'excel', 'print'
      ],
      columns: [
        { title: 'Role Name', data: 'RoleName' },
        {
          title: 'Is Admin',
          className: 'dt-head-center dt-body-center',
          render: function (data: any, type: any, full: any) {
            let status = full['IsAdmin'];
            var iconData = '';
            if (status) {
              iconData = '<span class ="text-success las la-check-double"></span>';
            }
            else {
              iconData = '<span class ="text-danger las la-window-close"></span>';;
            }
            return iconData;
          }
        },
        { title: 'Description', data: 'Description' },
        {
          title: 'Status',
          className: 'dt-head-center dt-body-center',
          render: function (data: any, type: any, full: any) {
            let status = full['Status'];
            let statusColor = full['StatusColor'];
            return '<span class ="text-' + statusColor + '">' + status + '</span>';
          }
        },
        {
          title: 'Actions',
          className: 'dt-center',
          render: function (data: any, type: any, full: any) {
            let menuItems = '<span class="dtr-data"><div class="dropdown d-inline-block" ngbDropdown>' +
              '<button class="btn btn-soft-secondary btn-sm dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false" ngbDropdownToggle>' +
              '<i class="ri-more-fill align-middle"></i></button>' +
              '<ul class=dropdown-menu dropdown-menu-end" ngbDropdownMenu>' +
              '<li><a id="editRole" class="dropdown-item text-info" data-custom-value="' + full['RoleId'] + '"><i class=" las la-lock me-2 text-info"></i> Edit Role</a></li>' +
              '<li><a id="viewRole" class="dropdown-item text-info" data-custom-value="' + full['RoleId'] + '"><i class=" las la-lock me-2 text-info"></i> View Role</a></li>';
            if (full['StatusId'] == 1) {
              menuItems = menuItems + '<li *ngif="' + full['StatusId'] + '===1"><a id="deActivateRole" class="dropdown-item text-danger" data-custom-value="' + full['RoleId'] + '"><i class=" las la-eye text-danger"></i> De Activate Role</a></li>';
            }
            else {
              menuItems = menuItems + '<li *ngif="' + full['StatusId'] + '!==1"><a id="activateRole" class="dropdown-item text-success" data-custom-value="' + full['RoleId'] + '"><i class="las la-lock-open me-2 text-success"></i> Activate Role</a></li>';
            }
            menuItems = menuItems + '</ul></div></span>';
            return menuItems;
          }
        }
      ],
      ajax: (params: any, callback: any) => {
        let searchCritera = { SearchValue: '', StartIndex: 1, EndIndex: 10 }
        this.roleInformationService.searchRoles(searchCritera)
          .subscribe((data: any) => {
            this.roles = data;
            callback({
              data: data
            });
          });
      },
    };
  }
  initDataSource() {
    let searchCritera =
    {
      SearchValue: '',
      // StartIndex: loadOptions.skip + 1,
      // EndIndex: loadOptions.skip + loadOptions.take
    }
    this.roleInformationService.searchRoles(searchCritera)
      .toPromise()
      .then((data: any) => {
        this.roles = data;
        return {
          data: data,
          totalCount: data,
          filteredCount: data,
          summary: null,
          groupCount: null
        };
      })
  }
  AddRole() {
    const modalRef = this.modalService.open(AddRoleInformationComponent, { centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.result.then((result) => {
      this.initDataSource();
    });
  }
  EditRole(role: any) {
    const modalRef = this.modalService.open(EditRoleInformationComponent, { centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRole = role;
    modalRef.result.then((result) => {
      this.initDataSource();
    }).catch((result) => {
      this.initDataSource();
    });
  }
  ViewRole(roleId: any) {
    let modalRef = this.modalService.open(ViewRoleInformationComponent, { centered: true });
    modalRef.componentInstance.selectedRoleId = roleId;
    modalRef.result.then((result) => {
    }).catch((result) => {
      this.rerender();
    });
  }
  ActivateRole(roleId: any) {
    this.roleInformationService.activateRole(roleId)
      .subscribe((data: any) => {
        this.rerender();
      });
  }
  DeActivateRole(roleId: any) {
    this.roleInformationService.deActivateRole(roleId)
      .subscribe((data: any) => {
        this.rerender();
      });
  }
  ngAfterViewInit(): void {
    this.dtTrigger.next();
    this.renderer.listen('document', 'click', (event) => {
      if (event.target.id === 'activateRole') {
        let value = event.target.dataset['customValue'];
        this.ActivateRole(value);
      }
      else if (event.target.id === 'deActivateRole') {
        let value = event.target.dataset['customValue'];
        this.DeActivateRole(value);
      }
      else if (event.target.id === 'editRole') {
        let value = event.target.dataset['customValue'];
        this.EditRole(value);
      }
      else if (event.target.id === 'viewRole') {
        let value = event.target.dataset['customValue'];
        this.ViewRole(value);
      }
    });
  }
  ngOnDestroy(): void {
    // Do not forget to unsubscribe the event
    this.dtTrigger.unsubscribe();
    this.modalService.dismissAll();
  }
  rerender(): void {
    if (this.dtElement) {
      this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
        dtInstance.destroy();
        this.dtTrigger.next();
      });
    }
  }
}
