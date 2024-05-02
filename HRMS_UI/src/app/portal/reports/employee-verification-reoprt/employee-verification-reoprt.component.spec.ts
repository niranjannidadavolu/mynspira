import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeeVerificationReoprtComponent } from './employee-verification-reoprt.component';

describe('EmployeeVerificationReoprtComponent', () => {
  let component: EmployeeVerificationReoprtComponent;
  let fixture: ComponentFixture<EmployeeVerificationReoprtComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmployeeVerificationReoprtComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeeVerificationReoprtComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
