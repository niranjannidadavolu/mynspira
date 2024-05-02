import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TeamLeavesForApprovalComponent } from './team-leaves-for-approval.component';

describe('TeamLeavesForApprovalComponent', () => {
  let component: TeamLeavesForApprovalComponent;
  let fixture: ComponentFixture<TeamLeavesForApprovalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TeamLeavesForApprovalComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TeamLeavesForApprovalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
