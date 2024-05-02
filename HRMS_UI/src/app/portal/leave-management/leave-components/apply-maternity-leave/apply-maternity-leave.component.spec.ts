import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApplyMaternityLeaveComponent } from './apply-maternity-leave.component';

describe('ApplyMaternityLeaveComponent', () => {
  let component: ApplyMaternityLeaveComponent;
  let fixture: ComponentFixture<ApplyMaternityLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ApplyMaternityLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ApplyMaternityLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
