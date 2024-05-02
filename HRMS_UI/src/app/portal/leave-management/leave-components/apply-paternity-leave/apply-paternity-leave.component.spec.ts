import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApplyPaternityLeaveComponent } from './apply-paternity-leave.component';

describe('ApplyPaternityLeaveComponent', () => {
  let component: ApplyPaternityLeaveComponent;
  let fixture: ComponentFixture<ApplyPaternityLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ApplyPaternityLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ApplyPaternityLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
