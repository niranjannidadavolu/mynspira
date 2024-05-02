import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { UpdateEntitlementComponent } from './update-entitlement/update-entitlement.component';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { LeaveInformationService } from 'src/app/core/services/administration/leave-information.service';
import { BranchesService } from 'src/app/core/services/masters';
import { LeaveEntitlementService } from 'src/app/core/services/administration/leave-entitlement.service';
import Swal from 'sweetalert2';
import { StorageService } from 'src/app/core/services';
import { DxDataGridComponent } from 'devextreme-angular';
import { ContextMenuList, LeaveType } from 'src/app/core/enum/application-enums';
import CustomStore from 'devextreme/data/custom_store';

@Component({
  selector: 'app-leave-entitlement',
  templateUrl: './leave-entitlement.component.html',
  styleUrls: ['./leave-entitlement.component.scss']
})
export class LeaveEntitlementComponent implements OnInit {
  entitlements: any = [];
  filterForm!: FormGroup;
  officeTypeList: any = [];
  branchLIst: any = [];
  employeesList: any = [];
  leaveTypeList: any = [{}];
  events: Array<string> = [];
  leaveInformationList: any = [];
  employeeProfile: any;
  isSubmitted: boolean;
  breadCrumbItems: ({ label: string; active?: undefined; } | { label: string; active: boolean; })[];
  allMode: string;

  checkBoxesMode: string;
  @ViewChild(DxDataGridComponent, { static: false }) dataGrid!: DxDataGridComponent;
  selectedLeaveEntitlements: any = [];
  editMode: string = 'row';
  editDateMode: boolean = false;
  selectedLeaveTypeId: any;
  isDeleted: boolean=false;
  constructor(
    private readonly modalService: NgbModal,
    private readonly leaveInformationService: LeaveInformationService,
    private readonly leaveEntitlementService: LeaveEntitlementService,
    private readonly branchesService: BranchesService,
    private fb: FormBuilder,
    private readonly storageService: StorageService
  ) {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Leave Entitlements', active: true }
    ];
    this.isSubmitted = false;
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.createForm();

    this.allMode = 'allPages';
    this.checkBoxesMode = 'always';//themes.current().startsWith('material') ? 'always' : 'onClick';
  }
  ngOnInit(): void {
    this.getOfficeTypes();
  }
  createForm() {
    this.filterForm = this.fb.group({
      OfficeTypeSlno: [],
      BranchSlno: [],
      employeeSlno: [this.employeeProfile.EmployeeSlno],
      // LeaveInformationId: [],
      LeaveTypeId: [],
    });
    this.entitlements = [];
  }

  get f() { return this.filterForm.controls; }

  getValue(data: any) {
    return data.BranchName
  }
  addLeaveEntitlement() {
    const modalRef = this.modalService.open(UpdateEntitlementComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    let obj = {
      data: this.filterForm.getRawValue(),
      isUpdateForm: false
    }
    modalRef.componentInstance.entitlementData = obj;
    modalRef.result.then(() => {
    });
  }
  updateLeaveEntitlement(row: any) {
    const modalRef = this.modalService.open(UpdateEntitlementComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    let obj = {
      data: row.data,
      isUpdateForm: true
    }
    modalRef.componentInstance.entitlementData = obj;
    modalRef.result.then((data) => {

      // this.getLeaveEntitlement();
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

  // getLeaveEntitlement() {
  //   let filterValue = this.filterForm.value;
  //   this.entitlements = [];
  //   if (this.filterForm.invalid) {
  //     return;
  //   }
  //   this.leaveEntitlementService.getLeaveEntitlement(filterValue).subscribe((data: any) => {
  //     //console.log(data);

  //     this.entitlements = data;
  //   });
  // }

  getLeaveEntitlement() {

    this.entitlements = new CustomStore({
      key: "EmployeeSlno",
      load: (loadOptions: any): any => {
        
        let filterValue = this.filterForm.value;
        this.entitlements = [];
        if (this.filterForm.invalid) {
          return;
        }
        return this.leaveEntitlementService.getLeaveEntitlement(filterValue)
          .toPromise()
          .then((data: any) => {
            this.entitlements = data;
          });
      }
    });
  }

  getOfficeTypes() {
    this.branchesService.GetOfficeType().subscribe((data: any) => {
      this.officeTypeList = data;
    });
  }
  onChangeOfficeType(event: any) {
    this.filterForm.controls['LeaveTypeId'].patchValue('');
    this.filterForm.controls['BranchSlno'].patchValue('');
    this.branchLIst = [];
    this.leaveTypeList = [];
    // this.entitlements = [];
    let obj = {
      officeTypeSlno: event.OfficeTypeSlno,
      employeeSlno: this.filterForm.value.employeeSlno == 23006 ? 0 : this.filterForm.value.employeeSlno
    }
    this.branchesService.GetBranchesByOfcType(obj).subscribe((data: any) => {
      this.branchLIst = data;
    });
    this.leaveInformationService.getLeaveTypeInformation(event.OfficeTypeSlno).subscribe((data: any) => {
      this.leaveTypeList = data;
    });

  }
  onChangeLeaveType(event: any) {
    
    this.selectedLeaveTypeId = event.LeaveTypeId;
      this.filterForm.controls['LeaveTypeId'].patchValue(event.LeaveTypeId);
      if (event.LeaveTypeId == LeaveType.SUMMER_VACATION || event.LeaveTypeId == LeaveType.WINTER_VACATION) {
        this.editMode = 'form';
        this.editDateMode = true;
      } else {
        this.editMode = 'row';
        this.editDateMode = false;
      }
  }
  onChangeBranch(event: any) {
    // //console.log(event);
    // let arrayEle = Object.keys(event).map(function (k) { return event[k].PBranchSLNo }).join(",");;
    // if (event.length) {
    //   this.filterForm.controls['BranchSlno'].patchValue(arrayEle);
    // } else if (event.length == 0) {
    //   this.filterForm.controls['BranchSlno'].patchValue(null);
    // }
    // this.getLeaveEntitlement();
    // this.entitlements = [];


  }

  onStatusChange(event: any) {
    
    let obj = {
      ...event.data
    }
    if (obj.StatusId == 1) {
      obj.StatusId = 2
    } else {
      obj.StatusId = 1
    }
    Swal.fire({
      title: `Are you sure want to ${obj.StatusId == 1 ? 'Activate' : 'Inactivate'}? \n ( ${obj.EmpId} - ${obj.LeaveTypeName.toLowerCase()} )`,
      showCancelButton: true,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        this.leaveEntitlementService.UpdateLeaveEntitlement(obj).subscribe((result: any) => {
          if (result) {
            this.savedResponse(obj.StatusId);
          }
          else {
            this.errorResponse();
          }
        });
      }
    })

  }
  updateRow(e: any) {
    let data = this.dataGrid.instance.getSelectedRowsData();
    let foundIndex = data.findIndex(x => x.EmployeeSlno == e.changes[0].key);
    if (foundIndex < 0) {
      this.dataGrid.instance.selectRows(e.changes[0].key, true);
    }
  }
  checkEncashedLeaves(event: any){
    
    event.data.isEncash = false;
    let leaveBalance = (event.data.TotalLeaves - (event.data.ConsumedLeaves + event.data.EncashedLeaves + event.data.NewEncashedLeaves));
    if(leaveBalance >= 15){
      event.data.isEncash = true;
      event.data.NewEncashedLeaves = event.data.NewEncashedLeaves; 
    }

    //console.log(event.data.isEncash,event);
    
    return event.data.isEncash;
  }
  getSelectedRowsData() {
    
    this.selectedLeaveEntitlements = [];
    let data = JSON.parse(JSON.stringify(this.dataGrid.instance.getSelectedRowsData()));
    for (let i in data) {    
      data[i].YearOfLeave= data[i].LeaveYear;
      data[i].DbDateValidFrom= data[i].DateValidFrom;
      data[i].DbDateValidUntil= data[i].DateValidUntil;

      if(data[i].EmployeeLeaveEntitlementId >0){
        data[i].UpdatedBy= this.employeeProfile.EmployeeSlno;
      }else{
        data[i].CreatedBy= this.employeeProfile.EmployeeSlno;
      }
    }
    if (data.length) {
       
      this.leaveEntitlementService.UpdateLeaveEntitlement(data).subscribe((result: any) => {
        if (result) {
          this.savedResponse2();
        }
        else {
          this.errorResponse();
        }
      });
    }

  }
  addMenuItems(e: any) {
    if (e.target == "content" && (e.column.dataField == "LeaveYear" || e.column.dataField == "DateValidFrom" || e.column.dataField == "DateValidUntil" || e.column.dataField == "TotalLeaves")) {
      if (!e.items) e.items = [];
      let contextMenu = [
        {
          text: ContextMenuList.COPY_TITLE,
          disabled: true
        },
        {
          text: ContextMenuList.COPY_ALL,
          onItemClick: () => {
            this.copyCellData(e, ContextMenuList.COPY_ALL);
          }
        },
        {
          text: ContextMenuList.COPY_UP,
          onItemClick: () => {
            this.copyCellData(e, ContextMenuList.COPY_UP);
          }
        },
        {
          text: ContextMenuList.COPY_DOWN,
          onItemClick: () => {
            this.copyCellData(e, ContextMenuList.COPY_DOWN);
          }
        }
      ]
      e.items = contextMenu;
    }
  }
  copyCellData(event: any, type: any) {
    this.entitlements.map((item: any, index: any) => {
   
      switch (type) {
        case ContextMenuList.COPY_ALL:
          item[event.column.dataField] = event.row.data[event.column.dataField];
          let data = {
            changes: [
              {
                key: item.EmployeeSlno
              }
            ]
          }
          this.updateRow(data);
          break;
        case ContextMenuList.COPY_UP:
          if (index < event.rowIndex) {
            item[event.column.dataField] = event.row.data[event.column.dataField];
            let data = {
              changes: [
                {
                  key: item.EmployeeSlno
                }
              ]
            }
          this.updateRow(data);
          }
          break;
        case ContextMenuList.COPY_DOWN:
          if (index > event.rowIndex) {
            item[event.column.dataField] = event.row.data[event.column.dataField];
            let data = {
              changes: [
                {
                  key: item.EmployeeSlno
                }
              ]
            }
          this.updateRow(data);
          }
          break;
      }
    });
  }
  savedResponse2() {
    Swal.fire({
      title: 'Well done !',
      text: `Aww yeah, Leave entitlement details are successfully created.`,
      icon: 'success',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    }).then(() => {
      this.getLeaveEntitlement();
    });
  }
  savedResponse(StatusId: number) {
    Swal.fire({
      title: 'Well done !',
      text: `Aww yeah, Leave entitlement details are successfully ${StatusId == 1 ? 'activated' : 'inactivated'}.`,
      icon: 'success',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    }).then(() => {
      this.getLeaveEntitlement();
    });
  }
  errorResponse() {
    Swal.fire({
      title: 'Oops...! Something went Wrong !',
      text: 'Leave entitlement details are not Saved.',
      icon: 'warning',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    }).then(() => { });
  }
  deleteRow(row: any) {
    if (row.data.hasOwnProperty('EmployeeLeaveEntitlementId') && row.data.hasOwnProperty('LeaveTypeName')) {
      Swal.fire({
        title: `Are you sure want to delete? \n ( ${row.data.EmpId} - ${row.data.LeaveTypeName.toLowerCase()} )`,
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          let obj = {
            EmployeeLeaveEntitlementId: row.data.EmployeeLeaveEntitlementId,
            EmployeeSlno: row.data.EmployeeSlno,
            UpdatedBy: this.employeeProfile.EmployeeSlno
          }
          this.leaveEntitlementService.deleteLeaveEntitlement(obj).subscribe(res => {
            if (res) {
              this.getLeaveEntitlement();

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

  deleteAllEntitlements(row: any) {

    if (this.selectedLeaveEntitlements.length <= 0) {
      Swal.fire({
        title: 'Oops...! Need to select al !',
        text: 'row data was not deleted.',
        icon: 'warning',
        confirmButtonColor: 'rgb(54, 69, 116)',
        confirmButtonText: 'Ok'
      });
    }
    else {
      Swal.fire({
        title: `Are you sure want to delete? \n ( ${row.data.EmpId} - ${row.data.LeaveTypeName.toLowerCase()} )`,
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          let obj = {
            EmployeeLeaveEntitlementId: row.data.EmployeeLeaveEntitlementId,
            EmployeeSlno: row.data.EmployeeSlno,
            UpdatedBy: this.employeeProfile.EmployeeSlno
          }
          this.leaveEntitlementService.deleteLeaveEntitlement(obj).subscribe(res => {
            if (res) {
              this.getLeaveEntitlement();

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
      });
    }
  }
}
