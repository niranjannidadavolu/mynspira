import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AutoApprovalReportComponent } from './auto-approval-report.component';

describe('AutoApprovalReportComponent', () => {
  let component: AutoApprovalReportComponent;
  let fixture: ComponentFixture<AutoApprovalReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AutoApprovalReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AutoApprovalReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
