import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { finalize } from 'rxjs/operators';
import Swal from 'sweetalert2';
import { AuthenticationService, EmployeeService, StorageService, TokenStorageService } from 'src/app/core/services';
import { UserInformation } from 'src/app/core/models';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { RegisterComponent } from '../register/register.component';
import { environment } from 'src/environments/environment';
import * as CryptoJS from 'crypto-js';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})

/**
 * Login Component
 */
export class LoginComponent implements OnInit {


  showNavigationArrows: any;
  loginForm!: FormGroup;
  isSubmitted = false;
  error = '';
  returnUrl!: string;
  layout_mode!: string;
  fieldTextType!: boolean;
  displayText: string;
  loggedinUserInformation: UserInformation | undefined;
  showErrorMessage: boolean;
  secretKey: string;
  isAutoLogin: boolean;

  constructor(private formBuilder: FormBuilder,
    private readonly route: ActivatedRoute,
    private readonly router: Router,
    private readonly authenticationService: AuthenticationService,
    private readonly employeeInformationService: EmployeeService,
    private readonly storageService: StorageService,
    private readonly tokenStorageService: TokenStorageService,
    private readonly modalService: NgbModal,
    private activatedRoute: ActivatedRoute
  ) {
    this.isAutoLogin = false;
    this.secretKey = environment.SecretKey;

    this.activatedRoute.queryParams.subscribe(params => {
      ////
      let date = params['username'];
      if (date) {
        let newstr = date.replace(' ', "+");
        this.isAutoLogin = true;
        this.isSubmitted = true;
        this.autoLogInUser(newstr);
      }
    });
    this.loginForm = this.formBuilder.group({
      userName: ['', [Validators.required]],
      password: ['', [Validators.required]],
      rememberMe: [false]
    });
    this.displayText = '';
    this.showErrorMessage = false;
    if (this.authenticationService.currentUserValue) {
      this.router.navigate(['/']);
    }
  }

  ngOnInit(): void {
    let loggedInUser = this.storageService.get('LoggedInUser', 2);
    let password = this.storageService.get('Password', 2);


    if (loggedInUser && password) {
      let userInfo: UserInformation = JSON.parse(loggedInUser);
      userInfo.Password = password;
      userInfo.UserName = userInfo.EmployeeId;
      document.body.setAttribute('data-layout', 'vertical');
      this.logInUser(userInfo);
    }
    else {
      this.storageService.clear();
      this.fieldTextType = false;
      this.displayText = '';
      this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
      document.body.setAttribute('data-layout', 'vertical');
    }
  }

  autoLogInUser(loggedInUser: any) {
    this.authenticationService.autoLogin(loggedInUser)
      .pipe(finalize(() => this.isSubmitted = false))
      .subscribe(data => {
        if (!data) {
          this.displayText = "Invalid Credentials";
          this.showErrorMessage = false;
          this.isSubmitted = false;
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Invalid Login Credentials!',
            footer: 'Please check your Login Credentials.'
          });
          return;
        }
        
        
        this.loggedinUserInformation = data;
        this.loggedinUserInformation.EmployeeId = this.f['userName'].value;

        if (this.f['rememberMe'].value) {
          this.storageService.save("LoggedInUser", JSON.stringify(this.loggedinUserInformation), 2);
          this.storageService.save("LoggedInUser", JSON.stringify(this.loggedinUserInformation), 1);
          this.storageService.save("Password", loggedInUser.Password, 2);
          this.tokenStorageService.saveToken(this.loggedinUserInformation.Token);
          this.getEmployeeProfile();
        }
        else {
          this.storageService.save("LoggedInUser", JSON.stringify(this.loggedinUserInformation), 1);
          this.tokenStorageService.saveToken(this.loggedinUserInformation.Token);
          this.getEmployeeProfile();
        }

      },
        error => {
          this.isSubmitted = false;
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Invalid Login Credentials!',
            footer: 'Please check your Login Credentials.'
          });
        });
  }

  logInUser(loggedInUser: any) {
    this.authenticationService.login(loggedInUser)
      .pipe(finalize(() => this.isSubmitted = false))
      .subscribe(data => {
        if (!data) {
          this.displayText = "Invalid Credentials";
          this.showErrorMessage = false;
          this.isSubmitted = false;
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Invalid Login Credentials!',
            footer: 'Please check your Login Credentials.'
          });
          return;
        }
        
        this.loggedinUserInformation = data;
        this.loggedinUserInformation.EmployeeId = this.f['userName'].value;

        if (this.f['rememberMe'].value) {
          this.storageService.save("LoggedInUser", JSON.stringify(this.loggedinUserInformation), 2);
          this.storageService.save("LoggedInUser", JSON.stringify(this.loggedinUserInformation), 1);
          this.storageService.save("Password", loggedInUser.Password, 2);
          this.tokenStorageService.saveToken(this.loggedinUserInformation.Token);
          this.getEmployeeProfile();
        }
        else {
          this.storageService.save("LoggedInUser", JSON.stringify(this.loggedinUserInformation), 1);
          this.tokenStorageService.saveToken(this.loggedinUserInformation.Token);
          this.getEmployeeProfile();
        }

      },
        error => {
          this.isSubmitted = false;
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Invalid Login Credentials!',
            footer: 'Please check your Login Credentials.'
          });
        });
  }

  get f() { return this.loginForm.controls; }

  onSubmit() {
    ////
    this.isSubmitted = true;
    if (this.loginForm.invalid) {
      return;
    } else {

      let loginUser = { UserName: this.f['userName'].value, Password: this.f['password'].value };
      this.logInUser(loginUser);
    }
  }

  getEmployeeProfile() {
    this.isSubmitted = true;
    let employeeslno = this.loggedinUserInformation?.EmployeeSlno;
    this.employeeInformationService.getEmployeeMinimumProfile(employeeslno)
      .pipe(finalize(() => this.isSubmitted = false))
      .subscribe((data: any) => {
        this.storageService.save("EmployeeProfile", JSON.stringify(data), 1);
        this.router.navigate(['/portal/dashboard']);
      },
        error => {
          this.isSubmitted = false;
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Invalid Login Credentials!',
            footer: 'Please check your Login Credentials.'
          });
        });
  }

  forgotPassword() {
    this.router.navigate(['/account/recover-password']);
  }

  /**
   * Password Hide/Show
   */
  toggleFieldTextType() {
    this.fieldTextType = !this.fieldTextType;
  }

  signUp() {
    this.modalService.open(RegisterComponent, { size: 'lg', centered: true });
  }
}
