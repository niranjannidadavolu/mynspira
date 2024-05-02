import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HouseRentAllowanceComponent } from './house-rent-allowance.component';

describe('HouseRentAllowanceComponent', () => {
  let component: HouseRentAllowanceComponent;
  let fixture: ComponentFixture<HouseRentAllowanceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ HouseRentAllowanceComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(HouseRentAllowanceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
