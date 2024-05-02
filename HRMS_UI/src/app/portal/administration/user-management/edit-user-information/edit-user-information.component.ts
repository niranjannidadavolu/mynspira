import { Subject } from 'rxjs';
import { Component, Input, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { DxDataGridComponent } from 'devextreme-angular';
import CustomStore from 'devextreme/data/custom_store';
import { RoleInformationService, StorageService, UserInformationService } from 'src/app/core/services';
import { GridComponent, RowDataBoundEventArgs } from '@syncfusion/ej2-angular-grids';
@Component({
  selector: 'app-edit-user-information',
  templateUrl: './edit-user-information.component.html',
  styleUrls: ['./edit-user-information.component.scss']
})
export class EditUserInformationComponent implements OnInit, OnDestroy {
  @ViewChild('grid') grid: GridComponent | undefined;
  public selectedUserId: any;
  roleData: any = {};
  applyFilterTypes: any;
  currentFilter: any;
  showFilterRow: boolean;
  showHeaderFilter: boolean;
  selectedRoles: number[] = [];
  userInformation: any;
  selectedRows: any;
  loggedInUser: any;
  checkBoxesMode: string;
  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  selectedIndex: any = [];
  mappedRoles: any;
  constructor(
    private readonly roleInformationService: RoleInformationService,
    private readonly userInformationService: UserInformationService,
    public activeModal: NgbActiveModal,
    private readonly storageService: StorageService) {
    this.checkBoxesMode = 'always';
    this.showFilterRow = true;
    this.showHeaderFilter = true;
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 14 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };

    //this.initRolesDataSource();
  }
  ngOnInit(): void {
    let selectedRoleId = this.selectedUserId;
    this.getMappedRoles();
  }
  initRolesDataSource() {
    this.roleInformationService.getAllActiveRoles().subscribe((data: any) => {
      this.roleData = data;
      return data;
    });
  }
  getMappedRoles() {
    this.userInformationService.getMappedRoles(this.selectedUserId)
      .subscribe(
        (res: any) => {
          debugger;
          this.mappedRoles = res;
        }
      );
  }

  rowDataBound(args: RowDataBoundEventArgs): void {
    if (args && args.data) {
      let rowIndex = (args.row as Element).getAttribute('aria-rowindex') as string;
      let rowData: any;
      rowData = args.data;
      let mapStatus = rowData.Mapped;
      if (mapStatus) {
        let rowIndex1 = parseInt(rowIndex);
        let index = this.selectedIndex.findIndex((item: any) => item === rowIndex1);
        if (index === -1) {
          rowIndex1 = rowIndex1 - 1;
          this.selectedIndex.push(rowIndex1);
        }
      }
    }
  }

  dataBound(): void {
    if (this.selectedIndex.length) {
      if (this.grid) {
        this.grid.selectRows(this.selectedIndex);
        this.selectedIndex = [];
      }
    }
  }


  
  onSubmit() {
    debugger;
    if (this.grid) {
      let selectedUserRoles = this.grid.getSelectedRecords();
      this.userInformation = {};
      this.userInformation.EmployeeSlno = this.selectedUserId;
      this.userInformation.UserId = this.loggedInUser.EmployeeSlno;
      this.userInformation.UserRoles = [];
      this.userInformation.UserRoles = selectedUserRoles;
      this.saveAndUpdateUserInformation(this.userInformation);
    }
  }
  saveAndUpdateUserInformation(userInformation: any) {
    this.userInformationService.saveAndUpdateUserInformation(userInformation)
      .subscribe(
        (res: any) => {
          this.activeModal.close('Success');
        }
      );
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}