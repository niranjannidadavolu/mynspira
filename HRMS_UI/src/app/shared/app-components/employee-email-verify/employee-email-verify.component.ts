import { InvestmentDeclarationsModule } from './../../../portal/investments/investment-declarations/investment-declarations.module';
import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { finalize } from 'rxjs/operators';
import { EmployeeService, StorageService, UserInformationService } from 'src/app/core/services';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-employee-email-verify',
  templateUrl: './employee-email-verify.component.html',
  styleUrls: ['./employee-email-verify.component.scss']
})
export class EmployeeEmailVerifyComponent implements OnInit, OnDestroy {
  @Input() public peofileInfo: any;
  displayText: string;
  otpDisplayText: string;
  hasOtp: boolean;
  showUserName: boolean;
  showOtp: boolean;
  userForm: FormGroup;
  otpForm: FormGroup;
  userSubmitted = false;
  otpSubmitted = false;
  otpData: any;
  employeeProfile: any;
  domainNames: any;

  constructor(
    private formBuilder: FormBuilder, public activeModal: NgbActiveModal,
    private employeeService: EmployeeService,
    private readonly storageService: StorageService,

  ) {
    this.domainNames = ['@narayanagroup.com', '@nspira.in'];
    this.displayText = '';
    this.otpDisplayText = '';
    this.hasOtp = false;
    this.showUserName = true;
    this.showOtp = false;
    this.userForm = this.formBuilder.group({
      EmployeeSlno: new FormControl('', [Validators.required]),
      WorkEmail: new FormControl('', [Validators.required, Validators.pattern("^[a-zA-Z0-9_.+-]+@((domain|domain1|domain)).com$")])
    });

    this.otpForm = this.formBuilder.group({
      otp: ['', [Validators.required]]
    });

  }

  ngOnInit(): void {
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.userForm.controls['EmployeeSlno'].patchValue(this.employeeProfile.EmployeeSlno);
  }

  get f() { return this.userForm.controls; }
  get otpControls() { return this.otpForm.controls; }

  getOtp() {
    let isValidWorkEmail = true;
    if (this.userForm.valid) {
      this.userSubmitted = true;
      this.employeeService.GetUpdateEmployeeEmailAddressOtp(this.userForm.value)
        .pipe(finalize(() => this.userSubmitted = false))
        .subscribe(data => {
          if (data) {
            this.userForm.disable();
            this.displayText = "Successfully sent OTP to email address ";
            this.hasOtp = true;
            this.showOtp = true;
            this.showUserName = false;
            this.otpData = data;
          }
          else {
            // this.displayText = "Either the User already registered or invalid Employee No provided.";
            this.hasOtp = false;
            this.showOtp = false;
            this.showUserName = false;
          }
        },
          err => {
            this.displayText = "There is some issue, while sending the OTP.";
            this.hasOtp = false;
            this.showOtp = false;
            this.showUserName = false;
          }
        );
    }
  }

  validateOtp() {
    this.otpSubmitted = true;
    if (this.otpForm.valid) {
      // let otp = this.otpControls['otp'].value;
      let obj = this.userForm.getRawValue();
      obj.GeneratedOtp = this.otpControls['otp'].value,

        this.employeeService.VerifyUpdateEmployeeEmailAddressOtp(obj)
          .pipe(finalize(() => this.otpSubmitted = false))
          .subscribe(data => {
            if (!data) {
              this.otpDisplayText = "Please provide valid OTP sent to your registered mobile.";
              return;
            }
            if (data) {
              this.activeModal.dismiss('Saved Successfully');
              this.applySuccessMsg();
              this.otpForm.disable();
              this.showOtp = false;
              this.showUserName = false;
            }
            else {
              this.otpDisplayText = "Please provide valid OTP sent to your registered mobile."
            }
          },
            err => this.otpDisplayText = "Please provide valid OTP sent to your registered mobile."
          );
    }
  }
  applySuccessMsg() {
    this.employeeService.sendUpdate(true);
    this.activeModal.dismiss('Saved Successfully');
    Swal.fire({
      title: 'Well done !',
      html: 'Aww yeah, your email address is successfully updated.',
      icon: 'success',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    });
    return;
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
