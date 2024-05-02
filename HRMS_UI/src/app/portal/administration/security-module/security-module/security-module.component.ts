import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ModuleInformationService, RoleInformationService, SecurityModuleService, UserInformationService } from 'src/app/core/services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-security-module',
  templateUrl: './security-module.component.html',
  styleUrls: ['./security-module.component.scss']
})
export class SecurityModuleComponent implements OnInit {

  activeRoles: any;

  selectAllModeVlaue: string = "page";
  selectionModeValue: string = "single";
  activeModules: any;
  showCheckBoxesModes: string[] = ["normal", "selectAll", "none"];
  showCheckBoxesMode: string = this.showCheckBoxesModes[1];
  selectionModes: string[] = ["multiple", "single"];
  selectionMode: string = this.selectionModes[0];

  selectNodesRecursive: boolean = true;
  selectByClick: boolean = false;

  isRecursiveDisabled: boolean = false;
  isSelectionModeDisabled: boolean = false;
  activeUsers: any;
  activePermissions: any;
  selectedRoles: any;
  selectedUsers: any;
  selectedPermissions: any = [];
  userRolePermission: any;
  breadCrumbItems: any;
  companies: any;
  isSubmitted: boolean;
  declarationForm: any;

  constructor(
    private readonly route: ActivatedRoute,
    private readonly router: Router,
    private roleInformationService: RoleInformationService,
    private userInformationService: UserInformationService,
    private moduleInformationService: ModuleInformationService,
    private securityModuleService: SecurityModuleService) {
    this.companies = [];
    this.isSubmitted = false;
  }

  ngOnInit() {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Security Module', active: true }
    ];
    this.userRolePermission = {
      RoleId: 0,
      UserId: 0,
      Permissions: []
    };
    this.loadActiveRoles();
    //this.loadActiveUsers();
    this.loadAllModules();
  }

  loadActiveRoles() {
    this.roleInformationService.getAllActiveRoles()
      .toPromise()
      .then((data: any) => {
        this.activeRoles = data;
      });
  }

  loadActiveUsers() {
    this.userInformationService.getAllActiveUsers()
      .toPromise()
      .then((data: any) => {
        this.activeUsers = data;
      });
  }

  loadAllModules() {
    this.moduleInformationService.loadModuleInformations().subscribe(data => {
      
      this.activeModules = data;
    });
  }

  LoadMappedPermissions(roleId: number) {
    this.securityModuleService.LoadMappedPermissions(roleId).subscribe((data: any) => {
      
      this.activeModules = data;
    });
  }

  roleSelected(v: any) {
    
    let roleId = v.addedItems[0].RoleId;
    this.userRolePermission.RoleId = roleId;
    this.userRolePermission.UserId = 0;
    this.LoadMappedPermissions(roleId);
  }

  treeViewSelectionChanged(e: any) {
    this.syncSelection(e.component);
  }

  treeViewContentReady(e: any) {
    this.syncSelection(e.component);
  }

  syncSelection(treeView: any) {

    const selectedEmployees = treeView.getSelectedNodes()
      .map((node: any) => node.itemData);

    this.selectedPermissions = selectedEmployees;
    this.userRolePermission.Permissions = this.selectedPermissions;
  }

  SavePermissions() {
    
    this.securityModuleService.SavePermissions(this.userRolePermission)
      .subscribe(
        (res: any) => {
          Swal.close();
          if (res) {
            Swal.fire({
              title: 'Success',
              icon: 'success',
              html:
                'Permission Successfully saved.',
              showCloseButton: false,
              showCancelButton: false,
              focusConfirm: false,
              allowEscapeKey: false,
              allowOutsideClick: false,
              confirmButtonText:
                '<i class="fa fa-thumbs-up"></i> Great!',
              confirmButtonAriaLabel: 'Thumbs up, great!',
              cancelButtonText:
                '<i class="fa fa-thumbs-down"></i>',
              cancelButtonAriaLabel: 'Thumbs down'
            }).then((result) => {
              if (result.value) {
                this.loadAllModules();
              }
            })
          } else {
            Swal.fire({
              titleText: 'Transaction Failed',
              icon: "error",
            })
          }
        }
      );
  }

}
