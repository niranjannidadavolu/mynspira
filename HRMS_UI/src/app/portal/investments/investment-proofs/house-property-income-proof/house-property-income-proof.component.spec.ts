import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HousePropertyIncomeProofComponent } from './house-property-income-proof.component';

describe('HousePropertyIncomeProofComponent', () => {
  let component: HousePropertyIncomeProofComponent;
  let fixture: ComponentFixture<HousePropertyIncomeProofComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ HousePropertyIncomeProofComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(HousePropertyIncomeProofComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
