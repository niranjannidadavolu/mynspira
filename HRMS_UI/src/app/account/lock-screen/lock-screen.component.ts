import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { finalize } from 'rxjs/operators';
import { AuthenticationService, EmployeeService, StorageService, TokenStorageService } from 'src/app/core/services';
import Swal from 'sweetalert2';
import { UserInformation } from 'src/app/core/models';
import { Router } from '@angular/router';

@Component({
  selector: 'app-lock-screen',
  templateUrl: './lock-screen.component.html',
  styleUrls: ['./lock-screen.component.scss']
})
export class LockScreenComponent implements OnInit {
  loggedInUser: any;
  photoPath: string;
  lastLoginTime: any;
  lockscreenForm: any;
  submitted: boolean;
  displayText: string;
  showErrorMessage = false;
  loggedinUserInformation: UserInformation | undefined;
  employeeProfile:any;

  constructor(
    private formBuilder: FormBuilder,
    private readonly storageService: StorageService,
    private readonly authenticationService: AuthenticationService,
    private readonly employeeService: EmployeeService,
    private readonly tokenStorageService: TokenStorageService,
    private readonly router: Router) {
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.lastLoginTime = this.loggedInUser?.LastLoginTime;
    this.photoPath = "";
    this.submitted = false;
    this.displayText = '';
    this.showErrorMessage = false;
    this.lockscreenForm = this.formBuilder.group({
      password: ['', [Validators.required]]
    });
  }
  get f() { return this.lockscreenForm.controls; }
  ngOnInit(): void {
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
  }
  onSubmit() {
    this.submitted = true;
    if (this.lockscreenForm.invalid) {
      return;
    }
    else {
      let loginUser = { UserName: this.loggedInUser.CustomizedId, Password: this.f['password'].value };
      this.authenticationService.login(loginUser)
        .pipe(finalize(() => this.submitted = false))
        .subscribe(data => {
          if (!data) {
            this.displayText = "Invalid Credentials";
            this.showErrorMessage = false;
            this.submitted = false;
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Invalid Login Credentials!',
              footer: 'Please check your Login Credentials.'
            });
            return;
          }
          this.loggedinUserInformation = data;
          this.storageService.save("LoggedInUser", JSON.stringify(this.loggedinUserInformation), 1);
          this.tokenStorageService.saveToken(this.loggedinUserInformation.Token);
          if (!this.loggedinUserInformation.IsFirstLogin) {
            this.getEmployeeProfile(data.EmployeeSlno).subscribe(data=>{
              this.storageService.save("EmployeeProfile", JSON.stringify(data), 1);
              this.router.navigate(['/portal/dashboard']);
            });
          }
        },
          error => {
            this.submitted = false;
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Invalid Login Credentials!',
              footer: 'Please check your Login Credentials.'
            });
          });
    }
  }
  getEmployeeProfile(employeeSLNo:number){
    return this.employeeService.getEmployeeProfile(employeeSLNo);
}
}
