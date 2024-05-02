import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeeEmailVerifyComponent } from './employee-email-verify.component';

describe('EmployeeEmailVerifyComponent', () => {
  let component: EmployeeEmailVerifyComponent;
  let fixture: ComponentFixture<EmployeeEmailVerifyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmployeeEmailVerifyComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeeEmailVerifyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
