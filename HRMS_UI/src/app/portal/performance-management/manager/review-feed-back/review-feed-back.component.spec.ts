import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReviewFeedBackComponent } from './review-feed-back.component';

describe('ReviewFeedBackComponent', () => {
  let component: ReviewFeedBackComponent;
  let fixture: ComponentFixture<ReviewFeedBackComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReviewFeedBackComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ReviewFeedBackComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
