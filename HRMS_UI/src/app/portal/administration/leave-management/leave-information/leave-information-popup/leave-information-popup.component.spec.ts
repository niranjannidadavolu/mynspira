import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LeaveInformationPopupComponent } from './leave-information-popup.component';

describe('LeaveInformationPopupComponent', () => {
  let component: LeaveInformationPopupComponent;
  let fixture: ComponentFixture<LeaveInformationPopupComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LeaveInformationPopupComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LeaveInformationPopupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
