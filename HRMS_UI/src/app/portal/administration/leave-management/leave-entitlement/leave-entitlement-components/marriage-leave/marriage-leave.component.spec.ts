import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MarriageLeaveComponent } from './marriage-leave.component';

describe('MarriageLeaveComponent', () => {
  let component: MarriageLeaveComponent;
  let fixture: ComponentFixture<MarriageLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MarriageLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MarriageLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
