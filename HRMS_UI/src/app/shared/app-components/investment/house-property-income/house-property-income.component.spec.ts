import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HousePropertyIncomeComponent } from './house-property-income.component';

describe('HousePropertyIncomeComponent', () => {
  let component: HousePropertyIncomeComponent;
  let fixture: ComponentFixture<HousePropertyIncomeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ HousePropertyIncomeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(HousePropertyIncomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
