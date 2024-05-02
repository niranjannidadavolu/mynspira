import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewReviewDetailComponent } from './view-review-detail.component';

describe('ViewReviewDetailComponent', () => {
  let component: ViewReviewDetailComponent;
  let fixture: ComponentFixture<ViewReviewDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ViewReviewDetailComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewReviewDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
