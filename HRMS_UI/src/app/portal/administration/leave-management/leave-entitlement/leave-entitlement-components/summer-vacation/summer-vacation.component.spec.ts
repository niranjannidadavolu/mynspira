import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SummerVacationComponent } from './summer-vacation.component';

describe('SummerVacationComponent', () => {
  let component: SummerVacationComponent;
  let fixture: ComponentFixture<SummerVacationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SummerVacationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SummerVacationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
