import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApplyEmployeeLeaveByHrOpsComponent } from './apply-employee-leave-by-hr-ops.component';

describe('ApplyEmployeeLeaveByHrOpsComponent', () => {
  let component: ApplyEmployeeLeaveByHrOpsComponent;
  let fixture: ComponentFixture<ApplyEmployeeLeaveByHrOpsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ApplyEmployeeLeaveByHrOpsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ApplyEmployeeLeaveByHrOpsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
