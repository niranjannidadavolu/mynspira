import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MyTimeSheetComponent } from './my-time-sheet.component';

describe('MyTimeSheetComponent', () => {
  let component: MyTimeSheetComponent;
  let fixture: ComponentFixture<MyTimeSheetComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MyTimeSheetComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MyTimeSheetComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
