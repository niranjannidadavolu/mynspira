import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewEmployeeItrVerificationReportComponent } from './view-employee-itr-verification-report.component';

describe('ViewEmployeeItrVerificationReportComponent', () => {
  let component: ViewEmployeeItrVerificationReportComponent;
  let fixture: ComponentFixture<ViewEmployeeItrVerificationReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ViewEmployeeItrVerificationReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewEmployeeItrVerificationReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
