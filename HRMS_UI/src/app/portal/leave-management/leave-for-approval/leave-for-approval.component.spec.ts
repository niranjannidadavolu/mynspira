import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LeaveForApprovalComponent } from './leave-for-approval.component';

describe('LeaveForApprovalComponent', () => {
  let component: LeaveForApprovalComponent;
  let fixture: ComponentFixture<LeaveForApprovalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LeaveForApprovalComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LeaveForApprovalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
