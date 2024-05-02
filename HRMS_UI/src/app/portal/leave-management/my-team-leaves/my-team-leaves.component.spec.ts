import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MyTeamLeavesComponent } from './my-team-leaves.component';

describe('MyTeamLeavesComponent', () => {
  let component: MyTeamLeavesComponent;
  let fixture: ComponentFixture<MyTeamLeavesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MyTeamLeavesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MyTeamLeavesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
