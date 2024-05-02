import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReviewerEvaluationComponent } from './reviewer-evaluation.component';

describe('ReviewerEvaluationComponent', () => {
  let component: ReviewerEvaluationComponent;
  let fixture: ComponentFixture<ReviewerEvaluationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReviewerEvaluationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ReviewerEvaluationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
