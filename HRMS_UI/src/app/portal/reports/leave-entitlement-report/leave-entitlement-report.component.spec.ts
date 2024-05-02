import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LeaveEntitlementReportComponent } from './leave-entitlement-report.component';

describe('LeaveEntitlementReportComponent', () => {
  let component: LeaveEntitlementReportComponent;
  let fixture: ComponentFixture<LeaveEntitlementReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LeaveEntitlementReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LeaveEntitlementReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
