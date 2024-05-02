import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeePendingReviewComponent } from './employee-pending-review.component';

describe('EmployeePendingReviewComponent', () => {
  let component: EmployeePendingReviewComponent;
  let fixture: ComponentFixture<EmployeePendingReviewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmployeePendingReviewComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeePendingReviewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
