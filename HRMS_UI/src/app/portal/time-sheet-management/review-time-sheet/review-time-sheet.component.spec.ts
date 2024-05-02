import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReviewTimeSheetComponent } from './review-time-sheet.component';

describe('ReviewTimeSheetComponent', () => {
  let component: ReviewTimeSheetComponent;
  let fixture: ComponentFixture<ReviewTimeSheetComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReviewTimeSheetComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ReviewTimeSheetComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
