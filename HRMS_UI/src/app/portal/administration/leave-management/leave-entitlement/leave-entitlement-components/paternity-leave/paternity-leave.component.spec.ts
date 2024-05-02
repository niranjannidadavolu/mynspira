import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PaternityLeaveComponent } from './paternity-leave.component';

describe('PaternityLeaveComponent', () => {
  let component: PaternityLeaveComponent;
  let fixture: ComponentFixture<PaternityLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PaternityLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PaternityLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
