import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CasualLeaveComponent } from './casual-leave.component';

describe('CasualLeaveComponent', () => {
  let component: CasualLeaveComponent;
  let fixture: ComponentFixture<CasualLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CasualLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CasualLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
