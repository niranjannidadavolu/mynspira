import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { EmployeeService } from 'src/app/core/services';
import { StorageService } from 'src/app/core/services/helper';
import { InvestmentService } from 'src/app/core/services/investment';
import Swal from 'sweetalert2';
import { finalize } from 'rxjs/operators';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';

@Component({
  selector: 'app-investment-proofs',
  templateUrl: './investment-proofs.component.html',
  styleUrls: ['./investment-proofs.component.scss']
})
export class InvestmentProofsComponent implements OnInit {

  isSubmitted: boolean;
  declarationForm: FormGroup;
  loggedInUser: any;
  employeeProfile: any;
  profile: any;
  breadCrumbItems: Array<{}>;
  declarations: any;
  isProcessing: boolean = false;
  constructor(private readonly formBuilder: FormBuilder,
    private readonly investmentService: InvestmentService,
    private readonly investmentProofService: InvestmentProofsService,
    private readonly storageService: StorageService,
    private readonly employeeService: EmployeeService) {
    this.breadCrumbItems = [
      { label: 'ESSP', },
      { label: 'Investment Proof ', active: true }
    ];

    this.declarationForm = this.createFormGroup();

    this.isSubmitted = false;
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.getMyProfile();
    this.getInvestmentDetails(this.employeeProfile.FinSLNo, this.employeeProfile.EmployeeSlno);
  }

  ngOnInit(): void {

    this.investmentProofService.getRefreshRequest().subscribe
      ((isRefresh: boolean) => { //message contains the data sent from service
        if (isRefresh) {

          this.getInvestmentDetails(this.employeeProfile.FinSLNo, this.employeeProfile.EmployeeSlno);
        }
      });
  }

  createFormGroup() {
    return this.formBuilder.group({
      EmployeeTdsId: new FormControl(),
      EmployeeId: new FormControl(),
      FinancialYearId: new FormControl(),
      UniqueNumber: new FormControl(),
      IsPanVerified: false,
      InvestmentDetail: new FormControl(),
      HouseRentAllowance: new FormControl(Validators.required),
      Chapter6Detail: new FormControl(),
      HouseIncomeDetail: new FormControl(),
      OtherIncomeDetail: new FormControl(),
    });
  }

  get f() { return this.declarationForm.controls; }
  getMyProfile() {
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.profile = this.employeeProfile;
    if (!this.profile) {
      this.employeeService.getMyprofile(employeeSlno).subscribe(data => {
        this.profile = data;
      });
    }
  }

  getInvestmentDetails(finSLNo: number, employeeSLNo: number) {

    this.investmentService.getInvestmentDetails(finSLNo, employeeSLNo).pipe()
      .subscribe((item: any) => {
        this.declarations = item;

        this.declarationForm.patchValue({
          EmployeeTdsId: item.EmployeeTdsId,
          EmployeeId: item.EmployeeId,
          FinancialYearId: item.FinancialYearId,
          UniqueNumber: item.UniqueNumber,
          IsPanVerified: false,
          InvestmentDetail: item.InvestmentDetail,
          HouseRentAllowance: item.HouseRentAllowance,
          Chapter6Detail: item.Chapter6Detail,
          HouseIncomeDetail: item.HouseIncomeDetail,
          OtherIncomeDetail: item.OtherIncomeDetail
        });
      })
  }
  findInvalidControls() {
    let invalid: any = [];
    let controls = this.declarationForm.controls;
    for (const name in controls) {
      if (controls[name].invalid) {
        invalid.push(name);
      }
    }
    return invalid;
  }
  saveInvestmentDeclarations() {
    this.isSubmitted = true;
    this.isProcessing = true;
    this.declarationForm.markAllAsTouched();
    if (this.declarationForm.valid) {
      // this.isProcessing = false;    
      // Swal.fire({
      //   // position: 'top-end',
      //   icon: 'error',
      //   title: 'Oops...! Mandatory fields are required !',
      //   text: `Please provide the missing data in => ${this.findInvalidControls()}`,
      //   showConfirmButton: false
      // })
      //   return;      

      let saveObject = this.declarationForm.value;
      this.investmentService.saveInvestmentDeclarations(saveObject).pipe(finalize(() => this.isSubmitted = false))
        .subscribe((item: any) => {
          this.isProcessing = false;

          if (item) {
            Swal.fire({
              title: 'Well done !',
              text: 'Aww yeah, your Investment Proofs are successfully saved.',
              icon: 'success',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
          else {
            Swal.fire({
              title: 'Oops...! Something went Wrong !',
              text: 'Your Investment Proofs are not Saved.',
              icon: 'warning',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
        });
    }
    else {
      this.isSubmitted = false;
      this.isProcessing = false;
      Swal.fire({
        title: 'Oops...! Something went Wrong !',
        text: `Please provide the missing data in => ${this.findInvalidControls()}`,
        icon: 'error',
        confirmButtonColor: 'rgb(54, 69, 116)',
        confirmButtonText: 'Ok'
      });
    }
  }
}
