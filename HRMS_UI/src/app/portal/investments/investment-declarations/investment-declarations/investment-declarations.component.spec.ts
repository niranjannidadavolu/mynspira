import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InvestmentDeclarationsComponent } from './investment-declarations.component';

describe('InvestmentDeclarationsComponent', () => {
  let component: InvestmentDeclarationsComponent;
  let fixture: ComponentFixture<InvestmentDeclarationsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InvestmentDeclarationsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InvestmentDeclarationsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
