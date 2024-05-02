import { AfterViewInit, ChangeDetectorRef, Component, forwardRef, Input, OnInit, ViewChild } from '@angular/core';
import { ControlValueAccessor, FormArray, FormBuilder, FormControl, FormGroup, NG_VALIDATORS, NG_VALUE_ACCESSOR, ValidationErrors, Validators } from '@angular/forms';
import { NgSelectComponent } from '@ng-select/ng-select';
import { commonMethods } from 'src/app/core/common/common.static';
import { HouseRentAllowance } from 'src/app/core/models';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';
import { DistrictsService, InvestmentService, MandalsService, StatesService } from 'src/app/core/services';
import { saveAs as importedSaveAs } from 'file-saver';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { UploadHouseRentAllowanceComponent } from './upload-house-rent-allowance/upload-house-rent-allowance.component';
import { SwiperSliderComponent } from 'src/app/shared/app-components/swiper-slider/swiper-slider.component';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import { flatMap } from 'rxjs/internal/operators';

@Component({
  selector: 'app-house-rent-allowance-proof',
  templateUrl: './house-rent-allowance-proof.component.html',
  styleUrls: ['./house-rent-allowance-proof.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      multi: true,
      useExisting: HouseRentAllowanceProofComponent
    },
    {
      // >>>>>> 1- The NG_VALIDATORS should be provided here <<<<<
      provide: NG_VALIDATORS,
      useExisting: forwardRef(() => HouseRentAllowanceProofComponent),
      multi: true,
    },
  ]
})
export class HouseRentAllowanceProofComponent implements OnInit, AfterViewInit, ControlValueAccessor {
  @Input() isVerify: boolean = false;
  private hraLoacation: any;
  verifyPan: boolean;
  @ViewChild('hraLoacation') set content(content: NgSelectComponent) {
    if (content) {
      this.hraLoacation = content;
    }
  }
  value!: HouseRentAllowance;
  districts: any;
  states: any;
  mandals: any;
  hRALocations: any;
  employeeDetails: any;
  tdsEmployeeHraDetails: any;

  hraForm: FormGroup;
  items!: FormArray;
  cultureImage: any;
  fileCount: number;
  constructor(
    private readonly formBuilder: FormBuilder,
    private readonly stateService: StatesService,
    private readonly districtService: DistrictsService,
    private readonly mandalService: MandalsService,
    private readonly investmentService: InvestmentService,
    private changeDetector: ChangeDetectorRef,
    private readonly modalService: NgbModal,
    private readonly investmentProofsService: InvestmentProofsService,
  ) {
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
    this.fileCount = 0;
    this.verifyPan = false;
  }
  ngAfterViewInit(): void {

  }
  get RentPayments(): FormArray {
    let formArr = this.hraForm.controls['RentPaymentDetails'] as FormArray;
    return formArr;
  }
  setOrderItemArray(items: any) {
    let item = this.hraForm.controls['RentPaymentDetails'] as FormArray;
    item.controls.length = 0;
    items.forEach((item: any) => {
      this.RentPayments.push(this.buildOrderItemsForm(item))
    });
  }
  buildOrderItemsForm(item: any): FormGroup {
    let formGroup = this.formBuilder.group({
      OwnerName: new FormControl(item.OwnerName),//, [Validators.required]
      OwnerPan: new FormControl(item.OwnerPan), //, [Validators.required]
      NoOfMonths: new FormControl(item.NoOfMonths), // , [Validators.required]
      Amount: new FormControl(item.Amount), // , [Validators.required]
      RentPaymentId: new FormControl(item.RentPaymentId),
      VerifiedAmount: new FormControl(item.VerifiedAmount),
      IsPanVerified: new FormControl(item.IsPanVerified),
      VerifiedPan: new FormControl(item.VerifiedPan),
      VerifiedName: new FormControl(item.VerifiedName),
      FileCount: new FormControl(item.FileCount),
      FilePath: new FormControl(''),
      FileToUpload: new FileUpload(),
      File: [''], // , [Validators.required]
      VerifiedRemarks: new FormControl(item.VerifiedRemarks),
      VerifiedUserSlNo: new FormControl(item.VerifiedUserSlNo)
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
  loadDropDownsData(value: any) {
    this.getDistrictsByStateId(value.StateId);
    this.getMandalsByDistrictId(value.DistrictId);
  }

  // registerOnChange(onChange: any): void {
  //   this.onChange = onChange;
  // }
  registerOnChange(fn: (v: any) => void) {
    this.hraForm.valueChanges.subscribe((val) => {
      fn(val);
    });
  }
  registerOnTouched(onTouched: any): void {
    this.onTouched = onTouched;
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

  get f() { return this.hraForm.controls; }

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
  verifyPanCard(index: any, itemrow: any) {
    this.verifyPan = true;
    
    let k = itemrow.controls['OwnerPan'].value;
    let panNumber = itemrow.controls['OwnerPan'].value;
    this.investmentProofsService.verifyPanNumber(1, panNumber).subscribe((data: any) => {
      

      let x = (<FormArray>this.RentPayments).at(index);
      //console.log(x);

      x.patchValue({
        IsPanVerified: "VERIFIED",
        VerifiedPan: data.Pan,
        VerifiedName: data.FullName,
      });
      this.verifyPan = false;
    });
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
