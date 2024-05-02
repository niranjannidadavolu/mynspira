import { Component, OnInit, ViewChild, Renderer2, AfterViewInit, OnDestroy } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { DataTableDirective } from 'angular-datatables';
import CustomStore from 'devextreme/data/custom_store';
import { of, Subject } from 'rxjs';
import { EmployeeService, UserInformationService } from 'src/app/core/services';
import { UserRoleMappingComponent } from '../user-role-mapping/user-role-mapping.component';
import { confirm } from 'devextreme/ui/dialog';
import * as $ from 'jquery';
import { EditUserInformationComponent } from '../edit-user-information/edit-user-information.component';
import { DxDataGridComponent } from 'devextreme-angular';
import { FormControl, FormGroup } from '@angular/forms';
import { debounceTime } from 'rxjs/operators';
@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.scss']
})
export class UserListComponent implements OnInit, AfterViewInit, OnDestroy {
  @ViewChild(DxDataGridComponent, { static: false }) dataGrid: DxDataGridComponent | undefined;
  breadCrumbItems!: Array<{}>;
  dtOptions: DataTables.Settings = {};
  dtTrigger: Subject<any> = new Subject(); dataSource: any;
  selectedUser: any;
  currentFilter: any;
  eventData: any;
  users: any;
  searchForm: FormGroup;
  obs: any;
  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  constructor(
    public renderer: Renderer2,
    private readonly employeeInformationService: EmployeeService,
    private readonly userInformationService: UserInformationService,
    private readonly modalService: NgbModal) {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'User Management', active: true }
    ];
    this.initDataSource();
    this.EditUserInformation = this.EditUserInformation.bind(this);
    this.searchForm = new FormGroup({
      searchValue: new FormControl('')
    });
    this.obs = this.searchForm.valueChanges
      .pipe(debounceTime(700))
      .subscribe((res) => {
        this.initDataSource();
      });
  }
  ngOnInit(): void {
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 14 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
  }
  initDataSource() {
    let searchCritera =
    {
      SearchValue: '',
      StartIndex: 1,
      EndIndex: 45000
    }
    this.employeeInformationService.searchEmployees(searchCritera).subscribe(data => {
      this.dataSource = data.Items
    })
    // this.dataSource = new CustomStore({
    //   key: "Slno",
    //   load: (loadOptions: any) => {
    //     let searchControl = this.searchForm.get('searchValue');
    //     let searchValue = searchControl?.value;
    //     let searchCritera =
    //     {
    //       SearchValue: searchValue,
    //       StartIndex: loadOptions.skip + 1,
    //       EndIndex: loadOptions.skip + loadOptions.take
    //     }
    //     return this.employeeInformationService.searchEmployees(searchCritera)
    //       .toPromise()
    //       .then((data: any) => {
           
    //         return {
    //           data: data.Items,
    //           totalCount: data.TotalItems,
    //           filteredCount: data.TotalItems,
    //           summary: null,
    //           groupCount: null
    //         };
    //       })
    //       .catch(() => { throw 'Data Loading Error' });
    //   },
    //   insert: () => {
    //     return of(null).toPromise();
    //   },
    //   update: () => {
    //     return of(null).toPromise();
    //   }
    // });
  }
  // isActiveVisible(e: any) {
  //   return e.row.data.StatusId === 2;
  // }
  // isInActiveVisible(e: any) {
  //   return e.row.data.StatusId === 1;
  // }

  EditUserInformation(data: any) {
    
    this.selectedUser = data;
    this.MapRoles(this.selectedUser.EmployeeSlno);
  }
  onRowRemoving(event: {
    component: {
      getRowIndexByKey: (arg0: any) => any;
      getRowElement: (arg0: any) => any;
    }; key: any; data: { ProductId: any; StatusId: any; }; cancel: JQuery.Promise<any, any, any>;
  }) {
    //console.log(event);
    this.eventData = event
    // let index = event.component.getRowIndexByKey(event.key);
    let rowEl = this.eventData.index;
    //  let productId = this.eventData.data.ProductId;
    let statusId = this.eventData.StatusId;
    if (statusId == 1) {
      $(rowEl).addClass("rowToDelete");
      let res = confirm("Do you really want to deactivate the slected user:", "Warning");
      let d = $.Deferred();
      event.cancel = d.promise();
      res.then((dialogResult: any) => {
        $(rowEl).removeClass("rowToDelete");
        if (!dialogResult) {
          d.resolve(true);
        }
        else {
          // this.productInformationService.deactivateProductInformation(productId)
          //   .subscribe(() => {
          //     this.dataSource.load();
          //   });
          d.resolve();
        }
      });
    }
    else {
      $(rowEl).addClass("rowToActiavate");
      let res = confirm("Do you really want to activate the slected User?:", "Warning");
      let d = $.Deferred();
      event.cancel = d.promise();
      res.then((dialogResult: any) => {
        $(rowEl).removeClass("rowToActiavate");
        if (!dialogResult) {
          d.resolve(true);
        }
        else {
          // this.productInformationService.activateProductInformation(productId)
          //   .subscribe(() => {
          //     this.dataSource.load();
          //   });
          d.resolve();
        }
      });
    }
  }
  MapRoles(employeeSlno: any) {
    const modalRef = this.modalService.open(EditUserInformationComponent, {
      size: "lg",
      centered: true,
      backdrop: "static",
      backdropClass: "customBackdrop",
    });
    
    modalRef.componentInstance.selectedUserId = employeeSlno;
  }
  ActivateUser(employeeSlno: any) {
    this.userInformationService.activateUser(employeeSlno)
      .subscribe((data: any) => {
        this.users = data.Items;
        this.refreshData();
      });
  }
  DeActivateUser(employeeSlno: any) {
    this.userInformationService.deActivateUser(employeeSlno)
      .subscribe((data: any) => {
        this.users = data.Items;
        this.refreshData();
      });
  }
  ResetPassword(employeeSlno: any) {
  }
  ngAfterViewInit(): void {
    this.dtTrigger.next();
    this.renderer.listen('document', 'click', (event) => {
      if (event.target.id === 'mapRolesId') {
        let value = event.target.dataset['customValue'];
        this.MapRoles(value);
      }
      else if (event.target.id === 'activateUser') {
        let value = event.target.dataset['customValue'];
        this.ActivateUser(value);
      }
      else if (event.target.id === 'deActivateUser') {
        let value = event.target.dataset['customValue'];
        this.DeActivateUser(value);
      }
      else if (event.target.id === 'resetPassword') {
        let value = event.target.dataset['customValue'];
        this.ResetPassword(value);
      }
    });
  }
  ngOnDestroy(): void {
    // Do not forget to unsubscribe the event
    this.dtTrigger.unsubscribe();
    this.modalService.dismissAll();
  }
  refreshData(): void {
    if (this.dataGrid) {
      this.dataGrid.instance.refresh();
    }
  }
}
