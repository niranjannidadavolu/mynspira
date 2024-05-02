import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InitiatePerformanceReviewComponent } from './initiate-performance-review.component';

describe('InitiatePerformanceReviewComponent', () => {
  let component: InitiatePerformanceReviewComponent;
  let fixture: ComponentFixture<InitiatePerformanceReviewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InitiatePerformanceReviewComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InitiatePerformanceReviewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
