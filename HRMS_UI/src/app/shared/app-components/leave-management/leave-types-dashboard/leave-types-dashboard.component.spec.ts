import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LeaveTypesDashboardComponent } from './leave-types-dashboard.component';

describe('LeaveTypesDashboardComponent', () => {
  let component: LeaveTypesDashboardComponent;
  let fixture: ComponentFixture<LeaveTypesDashboardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LeaveTypesDashboardComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LeaveTypesDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
