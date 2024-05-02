import { AfterViewInit, ChangeDetectorRef, Component, forwardRef, Input, OnInit, ViewChild } from '@angular/core';
import { ControlValueAccessor, FormArray, FormBuilder, FormControl, FormGroup, NG_VALIDATORS, NG_VALUE_ACCESSOR, ValidationErrors, Validator } from '@angular/forms';
import { NgbModal, ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { NgSelectComponent } from '@ng-select/ng-select';
import { commonMethods } from 'src/app/core/common/common.static';
import { HouseRentAllowance } from 'src/app/core/models';
import { DistrictsService, InvestmentService, MandalsService, StatesService, StorageService } from 'src/app/core/services';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import { SwiperSliderComponent } from '../../swiper-slider/swiper-slider.component';
import { UploadHouseRentAllowanceComponent } from './upload-house-rent-allowance/upload-house-rent-allowance.component';

@Component({
  selector: 'app-house-rent-allowance',
  templateUrl: './house-rent-allowance.component.html',
  styleUrls: ['./house-rent-allowance.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      multi: true,
      useExisting: HouseRentAllowanceComponent
    },
    {
      // >>>>>> 1- The NG_VALIDATORS should be provided here <<<<<
      provide: NG_VALIDATORS,
      useExisting: forwardRef(() => HouseRentAllowanceComponent),
      multi: true,
    },
  ]
})
export class HouseRentAllowanceComponent implements OnInit, AfterViewInit, ControlValueAccessor, Validator {
  private hraLoacation: any;
  loggedInUser: any;
  employeeProfile: any;
  profile: any;
  @ViewChild('hraLoacation') set content(content: NgSelectComponent) {
    if (content) { // initially setter gets called with undefined
      this.hraLoacation = content;
    }
  }

  isVerify: any;
  canUpload: any;
  value!: HouseRentAllowance;
  districts: any;
  states: any;
  mandals: any;
  hRALocations: any;
  employeeDetails: any;
  tdsEmployeeHraDetails: any;

  hraForm: FormGroup;
  items!: FormArray;

  constructor(
    private readonly formBuilder: FormBuilder,
    private readonly stateService: StatesService,
    private readonly districtService: DistrictsService,
    private readonly mandalService: MandalsService,
    private readonly investmentService: InvestmentService,
    private readonly storageService: StorageService,
    private changeDetector: ChangeDetectorRef,
    private readonly modalService: NgbModal,
    private readonly investmentProofsService: InvestmentProofsService) {
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.profile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.getMyProfile();
    this.getHraLocations();
    this.getStates();
    this.hraForm = this.formBuilder.group({
      IsRentHouse: new FormControl(false),
      LocationId: [''],
      HouseNumber: [''],
      StreetName: [''],
      StateId: [''],
      DistrictId: [''],
      MandalId: [''],
      Pincode: [''],
      PhoneNumber: [''],
      RentPaymentDetails: new FormArray([]),
    });
  }
  ngAfterViewInit(): void {
    
  }
  getMyProfile() {
    
    if (this.profile) {
      this.canUpload = false;//this.profile.AllowProofUpload;
      this.isVerify = this.profile.AllowVerfication;
    }
  }
  get f() { return this.hraForm.controls; }
  get RentPayments(): FormArray {
    return this.hraForm.controls['RentPaymentDetails'] as FormArray;
  }
  setOrderItemArray(items: any) {

    items?.forEach((item: any) => {
      this.RentPayments.push(this.buildOrderItemsForm(item))
    });
  }
  buildOrderItemsForm(item: any): FormGroup {
    let formGroup = this.formBuilder.group({
      OwnerName: item.OwnerName,
      OwnerPan: item.OwnerPan,
      NoOfMonths: item.NoOfMonths,
      Amount: item.Amount,
      RentPaymentId: item.RentPaymentId,
      VerifiedAmount: new FormControl({ value: item.VerifiedAmount, disabled: true }),
      VerifiedRemarks: new FormControl({ value: item.VerifiedRemarks, disabled: true }),
    })

    return formGroup;
  }

  onChange = (value: any) => { };
  onTouched = () => { };
  onValidationChange: any = () => { };

  registerOnValidatorChange(fn: () => void): void {
    this.onValidationChange = fn;
  }
  writeValue(value: any): void {

    if (value) {

      this.hraForm.patchValue({
        IsRentHouse: value.IsRentHouse,
        LocationId: value.LocationId == '' ? null : value.LocationId,
        HouseNumber: value.HouseNumber,
        StreetName: value.StreetName,
        StateId: value.StateId == '' ? null : value.StateId,
        DistrictId: value.DistrictId == '' ? null : value.DistrictId,
        MandalId: value.MandalId == '' ? null : value.MandalId,
        Pincode: value.Pincode,
        PhoneNumber: value.PhoneNumber,
      });
      this.loadDropDownsData(value);
      this.changeDetector.detectChanges();
      this.setOrderItemArray(value.RentPaymentDetails);
      this.hraForm.valueChanges.subscribe((data: any) => {
        this.onChange(this.hraForm.value);
        this.onValidationChange();
      });

    }
  }
  // >>>> 3- add registerOnValidatorChange to call it after every changes <<<<

  loadDropDownsData(value: any) {
    this.getDistrictsByStateId(value.StateId);
    this.getMandalsByDistrictId(value.DistrictId);
  }

  // registerOnChange(onChange: any): void {
  //   this.onChange = onChange;
  // }

  registerOnTouched(onTouched: any): void {
    this.onTouched = onTouched;
  }
  registerOnChange(fn: (v: any) => void) {
    this.hraForm.valueChanges.subscribe((val) => {
      fn(val);
    });
  }
  validate(): ValidationErrors | null {
    if (this.hraForm.invalid) {
      return { invalid: true };
    } else {
      return null;
    }
  }

  ngOnInit(): void {
  }

  onStateChange(event: any) {

    if (event != undefined) {
      this.districts = [];
      this.getDistrictsByStateId(event.StateSLNo);
    }
    else {
      this.districts = [];
      this.mandals = [];
    }
  }

  onDistrictChange(event: any) {

    if (event != undefined) {
      this.mandals = [];
      this.getMandalsByDistrictId(event.DistrictSLNo);
    }
    else {
      this.mandals = [];
    }
  }
  getHraLocations = async () => {
    this.investmentService.getHraLocations().subscribe((data: any) => {
      this.hRALocations = data;
    })
  }

  getDistrictsByStateId(stateSlno: any) {
    this.districts = [];
    this.districtService.getDistricts(stateSlno).subscribe((data: any) => {
      this.districts = data;
    })
  }
  getMandalsByDistrictId(districtSlNo: any) {

    this.mandals = [];
    this.mandalService.getMandals(districtSlNo).subscribe((data) => {
      this.mandals = data;
    })
  }
  getStates = async () => {
    this.stateService.getStates().subscribe((data: any) => {
      this.states = data;
    })
  }

  numberOnly(event: any): boolean {
    return commonMethods.isNumberKey(event);
  }
  uploadHRAFiles(hraDetails: any) {
    const modalRef = this.modalService.open(UploadHouseRentAllowanceComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.hraDetails = hraDetails.value;
    modalRef.result.then(() => {

    },
      (reason) => {
        let closeResult = `Dismissed ${this.getDismissReason(reason)}`;

      });
  }
  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }
  viewAttachments(caserow: any) {
    
    this.investmentProofsService.getHouseRentAllowancFiles(caserow.value.RentPaymentId).subscribe((data: any[]) => {
      if (data) {
        const modalRef = this.modalService.open(SwiperSliderComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
        let obj = {
          title: 'House Rent Allowance (HRA)',
          attachments: data
        };
        modalRef.componentInstance.attchmentmentDetails = obj;
        modalRef.result.then(() => {
        },
          (reason) => {
            let closeResult = `Dismissed ${this.getDismissReason(reason)}`;

          });
      }
    });
  }
}
