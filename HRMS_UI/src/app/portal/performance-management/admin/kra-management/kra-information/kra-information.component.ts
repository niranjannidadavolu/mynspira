import { Component, Input, OnInit } from '@angular/core';
import { AbstractControl, FormBuilder, FormControl, ValidationErrors, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { StorageService } from 'src/app/core/services';
import { KraInformationService } from 'src/app/core/services/perfomance-management';
import { KraUniqueValidator } from 'src/app/core/validators/kra-async-validator-service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-kra-information',
  templateUrl: './kra-information.component.html',
  styleUrls: ['./kra-information.component.scss'],
  providers: [KraInformationService, KraUniqueValidator]
})
export class KraInformationComponent implements OnInit {

  @Input() data: any;
  @Input() mode: any;
  kraForm: any;
  isSubmitted: boolean;
  employeeProfile: any;
  loggedInUser: any;
  static kp1: KraInformationService;
  canDisable: any;
  constructor(
    private readonly formBuilder: FormBuilder,
    public readonly activeModal: NgbActiveModal,
    public readonly kraInformationService: KraInformationService,
    private readonly storageService: StorageService,
    private readonly asyncValidatorService: KraUniqueValidator
  ) {
    KraInformationComponent.kp1 = kraInformationService;
    this.employeeProfile = this.storageService.getParsedData("EmployeeProfile", 1);
    this.loggedInUser = this.storageService.getParsedData("LoggedInUser", 1);
    this.isSubmitted = false;
    this.kraForm = this.formBuilder.group({
      KraName: new FormControl('', Validators.compose([Validators.required, KraInformationComponent.noSpecialChars]), [this.asyncValidatorService.validate.bind(this.asyncValidatorService)]),
      Description: new FormControl('', [Validators.required]),
      KraSlno: new FormControl(0),
      ModifiedBy: new FormControl(this.loggedInUser.EmployeeSlno)
    },
      {
        updateOn: 'blur',
      });
  }

  ngOnInit(): void {
    
    this.canDisable = this.mode === 'View';
    this.kraForm.patchValue(this.data);
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


  SaveKraInformation() {
    
    this.isSubmitted = true;
    this.kraInformationService.saveKraInformationDetails(this.kraForm.value).subscribe(data => {
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