import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReviewerPendingReviewComponent } from './reviewer-pending-review.component';

describe('ReviewerPendingReviewComponent', () => {
  let component: ReviewerPendingReviewComponent;
  let fixture: ComponentFixture<ReviewerPendingReviewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReviewerPendingReviewComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ReviewerPendingReviewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
