import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeePanVerificationReportComponent } from './employee-pan-verification-report.component';

describe('EmployeePanVerificationReportComponent', () => {
  let component: EmployeePanVerificationReportComponent;
  let fixture: ComponentFixture<EmployeePanVerificationReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmployeePanVerificationReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeePanVerificationReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
