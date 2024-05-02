import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SpecialSickLeaveComponent } from './special-sick-leave.component';

describe('SpecialSickLeaveComponent', () => {
  let component: SpecialSickLeaveComponent;
  let fixture: ComponentFixture<SpecialSickLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SpecialSickLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SpecialSickLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
