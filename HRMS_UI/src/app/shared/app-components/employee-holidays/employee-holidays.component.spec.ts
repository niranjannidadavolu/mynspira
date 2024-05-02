import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeeHolidaysComponent } from './employee-holidays.component';

describe('EmployeeHolidaysComponent', () => {
  let component: EmployeeHolidaysComponent;
  let fixture: ComponentFixture<EmployeeHolidaysComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmployeeHolidaysComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeeHolidaysComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
