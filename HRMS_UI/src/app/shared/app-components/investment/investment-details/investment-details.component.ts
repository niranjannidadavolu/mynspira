import { Component, forwardRef, Input, OnInit } from '@angular/core';
import { ControlValueAccessor, FormBuilder, FormControl, FormGroup, NG_VALUE_ACCESSOR } from '@angular/forms';
import { InvestmentService } from 'src/app/core/services';

@Component({
  selector: 'app-investment-details',
  templateUrl: './investment-details.component.html',
  styleUrls: ['./investment-details.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      multi: true,
      useExisting: forwardRef(() => InvestmentDetailsComponent),  // replace name as appropriate
    }
  ]
})
export class InvestmentDetailsComponent implements OnInit, ControlValueAccessor {

  value:any;
  investmentDetails: FormGroup;
  assessmentTypes: any;
  @Input() isVerify: boolean = false;

  constructor(private readonly formBuilder: FormBuilder, private readonly investmentService: InvestmentService) {
    this.getAssesseeTypeDetails();
    this.investmentDetails = this.formBuilder.group({
      AssesseeTypeId: new FormControl(),
      Is_NewRegime: new FormControl(false),
      Is_Senior_Citizen: new FormControl(false)
    });
  }

  onChange = (value: any) => { };

  onTouched = () => { };

  writeValue(value: any): void {
    
    if (value) {
      this.investmentDetails.patchValue({
        AssesseeTypeId: value.AssesseeTypeId,
        Is_NewRegime: value.Is_NewRegime,
        Is_Senior_Citizen: value.Is_Senior_Citizen
      });
      this.investmentDetails.valueChanges.subscribe((data: any) => { this.onChange(this.investmentDetails.value) });
    }
  }

  registerOnChange(onChange: any): void {
    this.onChange = onChange;
  }

  registerOnTouched(onTouched: any): void {
    this.onTouched = onTouched;
  }

  get f() { return this.investmentDetails.controls; }

  ngOnInit(): void {
    
  }

  getAssesseeTypeDetails = async () => {
    this.investmentService.getAssesseeTypeDetails().subscribe((data) => {
      this.assessmentTypes = data;
    });
  }

}
