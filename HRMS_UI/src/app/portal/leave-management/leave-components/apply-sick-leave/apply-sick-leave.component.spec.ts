import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApplySickLeaveComponent } from './apply-sick-leave.component';

describe('ApplySickLeaveComponent', () => {
  let component: ApplySickLeaveComponent;
  let fixture: ComponentFixture<ApplySickLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ApplySickLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ApplySickLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
