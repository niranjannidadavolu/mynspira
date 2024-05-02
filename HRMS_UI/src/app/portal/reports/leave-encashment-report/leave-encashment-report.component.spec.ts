import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LeaveEncashmentReportComponent } from './leave-encashment-report.component';

describe('LeaveEncashmentReportComponent', () => {
  let component: LeaveEncashmentReportComponent;
  let fixture: ComponentFixture<LeaveEncashmentReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LeaveEncashmentReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LeaveEncashmentReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
