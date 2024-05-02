import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeeItrVerificationReportComponent } from './employee-itr-verification-report.component';

describe('EmployeeItrVerificationReportComponent', () => {
  let component: EmployeeItrVerificationReportComponent;
  let fixture: ComponentFixture<EmployeeItrVerificationReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmployeeItrVerificationReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeeItrVerificationReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
