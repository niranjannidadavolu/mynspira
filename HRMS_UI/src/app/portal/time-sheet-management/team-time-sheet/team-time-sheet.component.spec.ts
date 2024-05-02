import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TeamTimeSheetComponent } from './team-time-sheet.component';

describe('TeamTimeSheetComponent', () => {
  let component: TeamTimeSheetComponent;
  let fixture: ComponentFixture<TeamTimeSheetComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TeamTimeSheetComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TeamTimeSheetComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
