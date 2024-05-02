import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SpecialCasualLeaveComponent } from './special-casual-leave.component';

describe('SpecialCasualLeaveComponent', () => {
  let component: SpecialCasualLeaveComponent;
  let fixture: ComponentFixture<SpecialCasualLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SpecialCasualLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SpecialCasualLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
