import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { RoleInformationService } from 'src/app/core/services';

@Component({
  selector: 'app-view-role-information',
  templateUrl: './view-role-information.component.html',
  styleUrls: ['./view-role-information.component.scss']
})
export class ViewRoleInformationComponent implements OnInit ,OnDestroy{
  @Input() public selectedRoleId: any;
  roleForm: FormGroup;
  roleInformation: any;
  constructor(
    private readonly activeModal: NgbActiveModal,
    private readonly roleInformationService: RoleInformationService,
    private readonly formBuilder: FormBuilder
  ) {
    this.roleForm = this.formBuilder.group({
      RoleName: new FormControl({ value: null, disabled: true }),
      Description: new FormControl({ value: null, disabled: true }),
      IsAdmin: new FormControl({ value: null, disabled: true }),
    });
  }

  ngOnInit(): void {
    this.getRoleInformation(this.selectedRoleId);
  }
  getRoleInformation(selectedRoleId: any) {
    this.roleInformationService.getRoleInformation(selectedRoleId)
      .subscribe((data: any) => {
        this.roleInformation = data;
        this.roleForm.patchValue({
          RoleName: data.RoleName,
          Description: data.Description,
          IsAdmin: data.IsAdmin
        });
      });
  }

  CloseModal() {
    this.activeModal.dismiss('Closed');
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
