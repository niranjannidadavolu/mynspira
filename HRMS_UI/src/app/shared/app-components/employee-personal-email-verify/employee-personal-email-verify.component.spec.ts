import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeePersonalEmailVerifyComponent } from './employee-personal-email-verify.component';

describe('EmployeePersonalEmailVerifyComponent', () => {
  let component: EmployeePersonalEmailVerifyComponent;
  let fixture: ComponentFixture<EmployeePersonalEmailVerifyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmployeePersonalEmailVerifyComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeePersonalEmailVerifyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
