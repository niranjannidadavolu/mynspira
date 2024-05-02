import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WorkflowTrackerComponent } from './workflow-tracker.component';

describe('WorkflowTrackerComponent', () => {
  let component: WorkflowTrackerComponent;
  let fixture: ComponentFixture<WorkflowTrackerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ WorkflowTrackerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(WorkflowTrackerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
