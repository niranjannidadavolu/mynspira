import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InvestmentsVerifyComponent } from './investments-verify.component';

describe('InvestmentsVerifyComponent', () => {
  let component: InvestmentsVerifyComponent;
  let fixture: ComponentFixture<InvestmentsVerifyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InvestmentsVerifyComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InvestmentsVerifyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
