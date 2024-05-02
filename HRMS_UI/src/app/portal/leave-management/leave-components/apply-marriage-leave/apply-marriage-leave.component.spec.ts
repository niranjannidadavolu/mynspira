import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApplyMarriageLeaveComponent } from './apply-marriage-leave.component';

describe('ApplyMarriageLeaveComponent', () => {
  let component: ApplyMarriageLeaveComponent;
  let fixture: ComponentFixture<ApplyMarriageLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ApplyMarriageLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ApplyMarriageLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
