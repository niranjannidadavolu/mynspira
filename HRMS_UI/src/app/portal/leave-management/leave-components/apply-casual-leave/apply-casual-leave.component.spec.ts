import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApplyCasualLeaveComponent } from './apply-casual-leave.component';

describe('ApplyCasualLeaveComponent', () => {
  let component: ApplyCasualLeaveComponent;
  let fixture: ComponentFixture<ApplyCasualLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ApplyCasualLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ApplyCasualLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
