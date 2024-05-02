import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeeProfileInfoComponent } from './employee-profile-info.component';

describe('EmployeeProfileInfoComponent', () => {
  let component: EmployeeProfileInfoComponent;
  let fixture: ComponentFixture<EmployeeProfileInfoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmployeeProfileInfoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeeProfileInfoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
