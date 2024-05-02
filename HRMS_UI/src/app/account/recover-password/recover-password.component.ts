import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { finalize } from 'rxjs/operators';
import { UserInformationService } from 'src/app/core/services';
import { MustMatch } from 'src/app/core/validators/custom-validator';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-recover-password',
  templateUrl: './recover-password.component.html',
  styleUrls: ['./recover-password.component.scss']
})
export class RecoverPasswordComponent implements OnInit {
  submitted = false;
  successmsg = false;
  error = '';
  // set the current year
  year: number = new Date().getFullYear();

  userForm: FormGroup;
  passwordForm: FormGroup;
  otpForm: FormGroup;

  userSubmitted = false;
  otpSubmitted = false;
  passwordSubmitted = false;
  hasOtp: boolean;
  isValidOtp: boolean;
  showUserName: boolean;
  showOtp: boolean;
  showPassword: boolean;
  otpData: any;
  displayText: string;
  otpDisplayText: string;
  changePwdDisplayText: string;
  showErrorMessage: boolean;
  userName: any;
  fieldTextType: boolean;
  fieldTextType1: boolean;

  constructor(private formBuilder: FormBuilder, private router: Router, private userInformationService: UserInformationService) {
    this.displayText = '';
    this.otpDisplayText = '';
    this.changePwdDisplayText = '';
    this.showErrorMessage = false;
    this.hasOtp = false;
    this.isValidOtp = false;
    this.showUserName = true;
    this.showOtp = false;
    this.showPassword = false;
    this.fieldTextType = false;
    this.fieldTextType1 = false;
    this.userForm = this.formBuilder.group({
      EmployeeId: new FormControl('', [Validators.required])
    });

    this.otpForm = this.formBuilder.group({
      otp: ['', [Validators.required]]
    });
    this.passwordForm = this.formBuilder.group({
      password: ['', [Validators.required, Validators.maxLength(20), Validators.pattern("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&].{8,}$")]],
      confirmPassword: ['', [Validators.required, Validators.maxLength(20), Validators.pattern("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&].{8,}$")]],
    },
      {
        validator: MustMatch('password', 'confirmPassword')
      });
  }

  get passwordControls() { return this.passwordForm.controls; }
  get userControls() { return this.userForm.controls; }
  get otpControls() { return this.otpForm.controls; }

  ngOnInit(): void {

  }

  getOtp() {
    this.displayText = '';
    this.userSubmitted = true;
    if (this.userForm.valid) {
      this.userName = this.userControls['EmployeeId'].value;
      this.userInformationService.getOtp(this.userName)
        .pipe(finalize(() => this.userSubmitted = false))
        .subscribe((data: { IsOtpSent: any; } | null) => {
          if (data != null && data.IsOtpSent) {
            this.userForm.disable();
            this.displayText = "";
            this.hasOtp = true;
            this.showOtp = true;
            this.showUserName = false;
            this.showPassword = false;
            this.otpData = data;
          }
          else {
            this.displayText = "Either the User already registered or invalid Employee No provided.";
            this.hasOtp = false;
            this.showOtp = false;
            this.showUserName = false;
            this.showPassword = false;
          }
        }
        );
    }
  }

  validateOtp() {
    this.otpDisplayText = '';
    this.otpSubmitted = true;
    if (this.otpForm.valid) {
      let otp = this.otpControls['otp'].value;
      this.userInformationService.validateOtp(this.userName, otp)
        .pipe(finalize(() => this.otpSubmitted = false))
        .subscribe((data: any) => {
          if (!data) {
            this.otpDisplayText = "Please provide valid OTP sent to your registered mobile.";
            return;
          }
          if (data) {

            this.otpForm.disable();
            this.isValidOtp = true;
            this.showOtp = false;
            this.showUserName = false;
            this.showPassword = true;
          }
          else {
            this.isValidOtp = false;
            this.otpDisplayText = "Please provide valid OTP sent to your registered mobile."
          }
        },
          err => this.otpDisplayText = "Please provide valid OTP sent to your registered mobile."
        );
    }
  }

  changePassword() {
    this.passwordSubmitted = true;
    if (this.passwordForm.invalid) {
      return;
    }
    else {
      let loginUser = { CustomizedId: this.userName, Password: this.passwordControls['password'].value };

      this.userInformationService.forgotPassword(loginUser)
        .pipe(finalize(() => this.passwordSubmitted = false))
        .subscribe((data: any) => {
          if (!data) {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Error while changing the password!',
              footer: 'Please contact administrator for resolution.'
            });
            return;
          }
          else {
            //this.activeModal.close('SUCCESS');
            Swal.fire({
              position: 'center',
              icon: 'success',
              title: 'Password changed successfully.',
              showConfirmButton: true,
              //timer: 2000,
            }).then((result) => {
              
              if (result['isConfirmed']) {
                this.router.navigate(['/account/login']);
              };
            })
          }
        },
          err => {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Error while changing the password!',
              footer: 'Please contact administrator for resolution.'
            });
          }
        );
    }
  }

  toggleFieldTextType() {
    this.fieldTextType = !this.fieldTextType;
  }
  toggleFieldTextType1() {
    this.fieldTextType1 = !this.fieldTextType1;
  }
  gotoLoginPage() {
    this.router.navigate(['/account/login']);
  }
}
