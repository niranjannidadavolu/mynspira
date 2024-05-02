import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeeReportingStructureComponent } from './employee-reporting-structure.component';

describe('EmployeeReportingStructureComponent', () => {
  let component: EmployeeReportingStructureComponent;
  let fixture: ComponentFixture<EmployeeReportingStructureComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmployeeReportingStructureComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeeReportingStructureComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
