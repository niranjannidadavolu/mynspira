import { Component, Input, OnInit } from '@angular/core';
import { AbstractControl, FormBuilder, FormControl, ValidationErrors, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { KraInformationComponent } from '../../kra-management/kra-information/kra-information.component';
import Swal from 'sweetalert2';
import { FilteringEventArgs } from '@syncfusion/ej2-angular-dropdowns';
import { EmitType } from '@syncfusion/ej2-base';
import { Query } from '@syncfusion/ej2-data';
import { KpiUniqueValidator } from 'src/app/core';
import { KraInformationService, KpiInformationService, StorageService, FrequencyInformationService } from 'src/app/core/services';

@Component({
  selector: 'app-kpi-information',
  templateUrl: './kpi-information.component.html',
  styleUrls: ['./kpi-information.component.scss'],
  providers: [KraInformationService, KpiInformationService, KpiUniqueValidator]
})
export class KpiInformationComponent implements OnInit {

  @Input() data: any;
  @Input() mode: any;
  kpiForm: any;
  isSubmitted: any;
  employeeProfile: any;
  loggedInUser: any;
  static kp1: KpiInformationService;
  canDisable: any;
  KraFields: any;
  frequencyFields: any;
  kraInformations: any;
  frequencyInfo: any;
  height: string;
  filterPlaceholder: string;
  watermarkKra: string = 'Select a Key Result Area';
  watermarkFrequency: string = 'Select Frequency';
  selectedKra: any;

  constructor(
    private readonly formBuilder: FormBuilder,
    public readonly activeModal: NgbActiveModal,
    public readonly kraInformationService: KraInformationService,
    public readonly kpiInformationService: KpiInformationService,
    public readonly frequencyInformationService: FrequencyInformationService,
    private readonly storageService: StorageService,
    private readonly asyncValidatorService: KpiUniqueValidator) {
    KpiInformationComponent.kp1 = kpiInformationService;
    this.employeeProfile = this.storageService.getParsedData("EmployeeProfile", 1);
    this.loggedInUser = this.storageService.getParsedData("LoggedInUser", 1);
    this.isSubmitted = false;
    this.filterPlaceholder = 'Search Key Result Area';
    this.height = '350px';
    this.kpiForm = this.formBuilder.group({
      KpiSlno: new FormControl(0),
      KpiName: new FormControl('', Validators.compose([Validators.required, KraInformationComponent.noSpecialChars]), [this.asyncValidatorService.validate.bind(this.asyncValidatorService)]),
      Description: new FormControl('', [ Validators.required ]),
      Measurement: new FormControl('', [ Validators.required ]),
      MinThresholdValues: new FormControl('', [ Validators.required ]),
      MaxThresholdValues: new FormControl('', [ Validators.required ]),
      KraSlno: new FormControl('', [ Validators.required ]),
      FrequencySlno: new FormControl('', [ Validators.required ]),
      CreatedBy: new FormControl(this.loggedInUser.EmployeeSlno),
      ModifiedBy: new FormControl(this.loggedInUser.EmployeeSlno)
    },
      {
        updateOn: 'blur',
      });
    this.KraFields = { text: 'KraName', value: 'KraSlno' };
    this.frequencyFields = { text: 'FrequencyName', value: 'FrequencySlno' };
    this.canDisable = this.mode === 'View';
    this.getAllKraInformations();
    this.getAllFrequencies();
  }

  ngOnInit(): void {
    
    this.kpiForm.patchValue(this.data);
    // this.kpiForm.controls['KraSlno'].patchValue(this.data.KraSlno);
    // this.kpiForm.controls['FrequencySlno'].patchValue(this.data.FrequencySlno);
  }
  onKraChange($event: any) {
    
    this.kpiForm.controls['KraSlno'].patchValue($event.itemData.KraSlno);
  }
  onFrequencyChange($event: any) {
    
    this.kpiForm.controls['FrequencySlno'].patchValue($event.itemData.FrequencySlno);
  }
  public static noSpecialChars(control: AbstractControl): ValidationErrors | null {
    const value: string = control.value;
    if (!value) {
      // If the value is empty, consider it valid (you can adjust this based on your requirements)
      return null;
    }
    // Regular expression to match special characters
    const specialCharsRegex = /[!@#$%^*(),.?":{}|<>]/;
    // Check if the value contains any special characters
    const hasSpecialChars = specialCharsRegex.test(value);
    // Check if the value starts with a space
    const startsWithSpace = /^\s/.test(value);
    // Return an error if special characters or leading spaces are found
    return hasSpecialChars || startsWithSpace ? { 'invalidInput': true } : null;
  }
  getAllKraInformations() {
    this.kraInformationService.getAllKraInformations().subscribe((data: any) => {
      if (data) {
        this.kraInformations = data;
      }
    });
  }
  getAllFrequencies() {
    this.frequencyInformationService.getFrequencies().subscribe((data: any) => {
      if (data) {
        this.frequencyInfo = data;
      }
    });
  }
  SaveKpiInformation() {
    this.isSubmitted = true;
    this.kpiInformationService.saveKpiinfromation(this.kpiForm.value).subscribe(data => {
      if (data) {
        Swal.fire({
          title: "Well done !",
          text: "Aww yeah, You Have successfully Saved Kra Information",
          icon: "success",
          confirmButtonColor: "rgb(54, 69, 116)",
          confirmButtonText: "Ok",
        }).then(() => {
          this.isSubmitted = false;
          this.activeModal.dismiss("Saved Successfully");
        });
      } else {
        Swal.fire({
          title: "Oops...! Something went Wrong !",
          text: "Record is not Saved.",
          icon: "warning",
          confirmButtonColor: "rgb(54, 69, 116)",
          confirmButtonText: "Ok",
        }).then(() => {
          this.isSubmitted = false;
        });
      }

    });
  }

}
