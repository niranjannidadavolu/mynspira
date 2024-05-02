import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HouseRentAllowanceProofComponent } from './house-rent-allowance-proof.component';

describe('HouseRentAllowanceProofComponent', () => {
  let component: HouseRentAllowanceProofComponent;
  let fixture: ComponentFixture<HouseRentAllowanceProofComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ HouseRentAllowanceProofComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(HouseRentAllowanceProofComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
