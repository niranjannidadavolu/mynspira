import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { EmployeeService } from 'src/app/core/services';
import { StorageService } from 'src/app/core/services/helper';
import { InvestmentService } from 'src/app/core/services/investment';
import Swal from 'sweetalert2';
import { finalize } from 'rxjs/operators';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
@Component({
  selector: 'app-investments-verify',
  templateUrl: './investments-verify.component.html',
  styleUrls: ['./investments-verify.component.scss']
})
export class InvestmentsVerifyComponent implements OnInit {

  isSubmitted: boolean;
  declarationForm: FormGroup;
  searchForm: FormGroup;
  loggedInUser: any;
  employeeProfile: any;
  profile: any;
  breadCrumbItems: Array<{}>;
  declarations: any;
  isVerify: boolean = true;
  constructor(private readonly formBuilder: FormBuilder,
    private readonly investmentService: InvestmentService,
    private readonly investmentProofService: InvestmentProofsService,
    private readonly storageService: StorageService,
    private readonly employeeService: EmployeeService) {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Investment Proof Verify', active: true }
    ];

    this.declarationForm = this.createFormGroup();
    this.searchForm = this.createSearchFormGroup();

    this.isSubmitted = false;
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser",1));
    // this.employeeProfile =JSON.parse(this.storageService.get("EmployeeProfile",1));
    // this.getMyProfile();
    // this.getInvestmentDetails(this.employeeProfile.FinSLNo, this.employeeProfile.EmployeeSlno);
  }

  ngOnInit(): void {

    // this.investmentProofService.getRefreshRequest().subscribe
    //   ((isRefresh: boolean) => { //message contains the data sent from service
    //     if (isRefresh) {

    //       this.getInvestmentDetails(this.employeeProfile.FinSLNo, this.employeeProfile.EmployeeSlno);
    //     }
    //   });
  }



  createFormGroup() {
    return this.formBuilder.group({
      EmployeeTdsId: new FormControl(),
      EmployeeId: new FormControl(),
      FinancialYearId: new FormControl(),
      UniqueNumber: new FormControl(),
      IsVerified: true,
      InvestmentDetail: new FormControl(),
      HouseRentAllowance: new FormControl(),
      Chapter6Detail: new FormControl(),
      HouseIncomeDetail: new FormControl(),
      OtherIncomeDetail: new FormControl(),
      Section80GDetail: new FormControl()
    });
  }

  createSearchFormGroup() {
    return this.formBuilder.group({
      SearchValue: new FormControl()
    });
  }

  get f() { return this.declarationForm.controls; }
  get searchf() { return this.searchForm.controls; }
  getMyProfile() {
    let employeeSlno = this.loggedInUser.EmployeeSlno;
    this.profile = this.employeeProfile;
    if (!this.profile) {
      this.employeeService.getMyprofile(employeeSlno).subscribe(data => {
        this.profile = data;
      });
    }
  }

  getEmployeeInvestmentProofs() {

    let employeeId = this.searchForm.controls['SearchValue'].value;

    this.profile = this.employeeProfile;
    if (!this.profile) {
      this.employeeService.getEmployeeProfile(employeeId).subscribe(data => {
        this.profile = data;
        this.getInvestmentDetails(this.profile.FinSLNo, this.profile.EmployeeSlno)
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
          IsVerified: true,
          InvestmentDetail: item.InvestmentDetail,
          HouseRentAllowance: item.HouseRentAllowance,
          Chapter6Detail: item.Chapter6Detail,
          HouseIncomeDetail: item.HouseIncomeDetail,
          OtherIncomeDetail: item.OtherIncomeDetail,
          Section80GDetail: item.Section80GDetail
        });
      })
  }

  saveInvestmentDeclarations() {
    
    let loggedInUser = JSON.parse(this.storageService.get("LoggedInUser",1));
    this.isSubmitted = true;
    let saveObject = this.declarationForm.value;
    saveObject.IsVerified = true;
    saveObject.VerificationEmployeeSlno = loggedInUser.EmployeeSlno;
    this.investmentService.saveInvestmentDeclarations(saveObject).pipe(finalize(() => this.isSubmitted = false))
      .subscribe((item: any) => {
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
}
