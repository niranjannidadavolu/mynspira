import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardLeavesComponent } from './dashboard-leaves.component';

describe('DashboardLeavesComponent', () => {
  let component: DashboardLeavesComponent;
  let fixture: ComponentFixture<DashboardLeavesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DashboardLeavesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DashboardLeavesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
