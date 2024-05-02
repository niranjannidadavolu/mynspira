import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OtherIncomeProofComponent } from './other-income-proof.component';

describe('OtherIncomeProofComponent', () => {
  let component: OtherIncomeProofComponent;
  let fixture: ComponentFixture<OtherIncomeProofComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OtherIncomeProofComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OtherIncomeProofComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
