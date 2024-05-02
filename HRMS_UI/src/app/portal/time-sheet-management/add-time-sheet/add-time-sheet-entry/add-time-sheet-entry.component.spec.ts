import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddTimeSheetEntryComponent } from './add-time-sheet-entry.component';

describe('AddTimeSheetEntryComponent', () => {
  let component: AddTimeSheetEntryComponent;
  let fixture: ComponentFixture<AddTimeSheetEntryComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddTimeSheetEntryComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddTimeSheetEntryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
