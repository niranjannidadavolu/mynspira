import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TeamUpcomingLeavesComponent } from './team-upcoming-leaves.component';

describe('TeamUpcomingLeavesComponent', () => {
  let component: TeamUpcomingLeavesComponent;
  let fixture: ComponentFixture<TeamUpcomingLeavesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TeamUpcomingLeavesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TeamUpcomingLeavesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
