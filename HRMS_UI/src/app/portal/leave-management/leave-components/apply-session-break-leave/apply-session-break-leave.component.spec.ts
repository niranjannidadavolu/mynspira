import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApplySessionBreakLeaveComponent } from './apply-session-break-leave.component';

describe('ApplySessionBreakLeaveComponent', () => {
  let component: ApplySessionBreakLeaveComponent;
  let fixture: ComponentFixture<ApplySessionBreakLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ApplySessionBreakLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ApplySessionBreakLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
