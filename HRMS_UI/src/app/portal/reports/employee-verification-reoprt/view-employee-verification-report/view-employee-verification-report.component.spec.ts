import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewEmployeeVerificationReportComponent } from './view-employee-verification-report.component';

describe('ViewEmployeeVerificationReportComponent', () => {
  let component: ViewEmployeeVerificationReportComponent;
  let fixture: ComponentFixture<ViewEmployeeVerificationReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ViewEmployeeVerificationReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewEmployeeVerificationReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
