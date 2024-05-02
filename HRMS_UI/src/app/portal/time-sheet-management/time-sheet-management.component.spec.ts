import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TimeSheetManagementComponent } from './time-sheet-management.component';

describe('TimeSheetManagementComponent', () => {
  let component: TimeSheetManagementComponent;
  let fixture: ComponentFixture<TimeSheetManagementComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TimeSheetManagementComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TimeSheetManagementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
