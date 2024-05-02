import { ComponentFixture, TestBed } from '@angular/core/testing';

import {  CarLeaseAgreementBillsComponent } from './agreement-bills.component';

describe('CarLeaseAgreementBillsComponent', () => {
  let component: CarLeaseAgreementBillsComponent;
  let fixture: ComponentFixture<CarLeaseAgreementBillsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CarLeaseAgreementBillsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CarLeaseAgreementBillsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
