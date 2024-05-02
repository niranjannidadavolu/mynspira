import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeeLeaveEntitlementComponent } from './employee-leave-entitlement.component';

describe('EmployeeLeaveEntitlementComponent', () => {
  let component: EmployeeLeaveEntitlementComponent;
  let fixture: ComponentFixture<EmployeeLeaveEntitlementComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmployeeLeaveEntitlementComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeeLeaveEntitlementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
