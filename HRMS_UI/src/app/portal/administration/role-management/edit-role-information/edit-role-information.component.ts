import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { RoleInformationService } from 'src/app/core/services';
import Swal from 'sweetalert2';
import { finalize } from 'rxjs/operators';
import { Subject } from 'rxjs';

@Component({
  selector: 'app-edit-role-information',
  templateUrl: './edit-role-information.component.html',
  styleUrls: ['./edit-role-information.component.scss']
})
export class EditRoleInformationComponent implements OnInit, OnDestroy {

  @Input() public selectedRole: any;
  roleForm: FormGroup;
  roleInformation: any;
  isSubmitted: boolean;
  dtTrigger: Subject<any> = new Subject();
  
  constructor(
    private readonly activeModal: NgbActiveModal,
    private readonly roleInformationService: RoleInformationService,
    private readonly formBuilder: FormBuilder
  ) {
    this.isSubmitted = false;
    this.roleForm = this.formBuilder.group({
      RoleId: new FormControl(),
      RoleName: new FormControl(false),
      Description: new FormControl(),
      IsAdmin: new FormControl(),
    });
  }

  ngOnInit(): void {
    // this.getRoleInformation(this.selectedRoleId);
    
    let data = this.selectedRole;
    this.roleForm.patchValue({
      RoleId: data.RoleId,
      RoleName: data.RoleName,
      Description: data.Description,
      IsAdmin: data.IsAdmin
    });
  }
  getRoleInformation(selectedRoleId: any) {
    
    this.roleInformationService.getRoleInformation(selectedRoleId)
      .subscribe((data: any) => {
        this.roleInformation = data;
        this.roleForm.patchValue({
          RoleId: data.RoleId,
          RoleName: data.RoleName,
          Description: data.Description,
          IsAdmin: data.IsAdmin
        });
      });
  }

  CloseModal() {
    this.activeModal.dismiss('Closed');
  }

  SaveRoleInformation()
  {
    
    this.isSubmitted = true;
    let saveObject = this.roleForm.value;
    this.roleInformationService.saveRoleInformation(saveObject).pipe(finalize(() => this.isSubmitted = false))
      .subscribe((item: any) => {
        if (item) {
          this.activeModal.dismiss('closed');
          Swal.fire({
            title: 'Well done !',
            text: 'Aww yeah, Role Details are successfully saved.',
            icon: 'success',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
        else {
          this.activeModal.dismiss('closed');
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            text: 'Role Details  are not Saved.',
            icon: 'warning',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
        this.dtTrigger.next();
      });
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
