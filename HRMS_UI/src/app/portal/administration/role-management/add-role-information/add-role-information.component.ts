import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { finalize } from 'rxjs/operators';
import { RoleInformationService } from 'src/app/core/services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-add-role-information',
  templateUrl: './add-role-information.component.html',
  styleUrls: ['./add-role-information.component.scss']
})
export class AddRoleInformationComponent implements OnInit , OnDestroy{

  @Input() public selectedRoleId: any;
  roleForm: FormGroup;
  roleInformation: any;
  isSubmitted: boolean;

  constructor(
    private readonly activeModal: NgbActiveModal,
    private readonly roleInformationService: RoleInformationService,
    private readonly formBuilder: FormBuilder
  ) {
    this.isSubmitted = false;
    this.roleForm = this.formBuilder.group({
      RoleName: new FormControl('', Validators.required),
      Description: new FormControl(''),
      IsAdmin: new FormControl(false),
    });
  }

  ngOnInit(): void {
  }

  CloseModal() {
    this.activeModal.dismiss('Closed');
  }

  SaveRoleInformation()
  {
    
    this.isSubmitted = true;
    let saveObject = this.roleForm.value;
    saveObject.RoleId = 0;
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
          this.activeModal.dismiss('Failed');
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            text: 'Role Details  are not Saved.',
            icon: 'warning',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
      });
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal?.dismiss();
  }
}
