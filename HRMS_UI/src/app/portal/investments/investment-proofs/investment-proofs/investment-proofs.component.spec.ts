import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InvestmentProofsComponent } from './investment-proofs.component';

describe('InvestmentProofsComponent', () => {
  let component: InvestmentProofsComponent;
  let fixture: ComponentFixture<InvestmentProofsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InvestmentProofsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InvestmentProofsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
