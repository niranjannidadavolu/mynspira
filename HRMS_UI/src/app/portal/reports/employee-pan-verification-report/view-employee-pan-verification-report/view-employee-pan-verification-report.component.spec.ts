import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewEmployeePanVerificationReportComponent } from './view-employee-pan-verification-report.component';

describe('ViewEmployeePanVerificationReportComponent', () => {
  let component: ViewEmployeePanVerificationReportComponent;
  let fixture: ComponentFixture<ViewEmployeePanVerificationReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ViewEmployeePanVerificationReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewEmployeePanVerificationReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
