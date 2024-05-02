import { ComponentFixture, TestBed } from '@angular/core/testing';

import { YearCalenderComponent } from './year-calender.component';

describe('YearCalenderComponent', () => {
  let component: YearCalenderComponent;
  let fixture: ComponentFixture<YearCalenderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ YearCalenderComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(YearCalenderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
