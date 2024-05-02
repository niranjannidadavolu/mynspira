import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { UserInformation } from 'src/app/core/models';
import { EmployeeService, InvestmentService, StorageService } from 'src/app/core/services';
import Swal from 'sweetalert2';
import { finalize } from 'rxjs/operators';
import { EmployeeCardComponent } from 'src/app/shared/app-components/employee-card';

@Component({
  selector: 'app-investment-declarations',
  templateUrl: './investment-declarations.component.html',
  styleUrls: ['./investment-declarations.component.scss']
})
export class InvestmentDeclarationsComponent implements OnInit {

  @ViewChild(EmployeeCardComponent, { static: false }) childC: EmployeeCardComponent | undefined;

  breadCrumbItems: Array<{}>;

  declarationForm: FormGroup;
  declarations: any;

  loggedinUserInformation?: UserInformation;
  finSLNo?: number = 14;
  loggedInUser: any;
  profile: any;
  isSubmitted: boolean;
  employeeProfile: any;
  isProcessing: boolean = false;

  isVerify: any;
  canUpload: any;

  constructor(
    private readonly formBuilder: FormBuilder,
    private readonly investmentService: InvestmentService,
    private readonly storageService: StorageService,
    private readonly employeeService: EmployeeService,
  ) {

    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Investment Declarations', active: true }
    ];
    this.isSubmitted = false;
    this.declarationForm = this.formBuilder.group({
      EmployeeTdsId: new FormControl(),
      EmployeeId: new FormControl(),
      FinancialYearId: new FormControl(),
      UniqueNumber: new FormControl(),
      InvestmentDetail: new FormControl(),
      HouseRentAllowance: ['', [Validators.required]],
      Chapter6Detail: new FormControl(),
      Section80GDetail: new FormControl(),
      HouseIncomeDetail: new FormControl(),
      OtherIncomeDetail: new FormControl(),
    });

    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.getMyProfile();
    this.getInvestmentDetails(this.employeeProfile.FinSLNo, this.employeeProfile.EmployeeSlno);
  }

  get f() { return this.declarationForm.controls; }

  getMyProfile() {
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.profile = this.employeeProfile;
    this.employeeService.getMyprofile(employeeSlno).subscribe(data => {
      
      this.profile = data;
      this.canUpload = this.profile.AllowProofUpload;
      this.isVerify = this.profile.AllowVerfication;
    });
    // // if (!this.profile) {
    // //   this.employeeService.getMyprofile(employeeSlno).subscribe(data => {
    // //     
    // //     this.profile = data;
    // //     this.canUpload = this.profile.AllowProofUpload;
    // //     this.isVerify = this.profile.AllowVerfication;
    // //   });
    // }
  }

  ngOnInit(): void {
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
          InvestmentDetail: item.InvestmentDetail,
          HouseRentAllowance: item.HouseRentAllowance,
          Chapter6Detail: item.Chapter6Detail,
          HouseIncomeDetail: item.HouseIncomeDetail,
          OtherIncomeDetail: item.OtherIncomeDetail,
          Section80GDetail: item.Section80GDetail
        });
      });
      this.declarationForm.disable();
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
    //this.declarationForm.markAllAsTouched();
    if (this.declarationForm.valid) {
      let saveObject = this.declarationForm.value;
      this.investmentService.saveInvestmentDeclarations(saveObject).pipe(finalize(() => this.isSubmitted = false))
        .subscribe((item: any) => {
          this.isProcessing = false;
          if (item) {
            Swal.fire({
              title: 'Well done !',
              text: 'Aww yeah, your Investment Details are successfully saved.',
              icon: 'success',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
          else {
            Swal.fire({
              title: 'Oops...! Something went Wrong !',
              text: 'Your Investment Declarations are not Saved.',
              icon: 'warning',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
          if (this.childC) {
            this.childC.refreshTaxCalculations();
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
