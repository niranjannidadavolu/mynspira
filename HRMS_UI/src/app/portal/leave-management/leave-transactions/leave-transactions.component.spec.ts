import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LeaveTransactionsComponent } from './leave-transactions.component';

describe('LeaveTransactionsComponent', () => {
  let component: LeaveTransactionsComponent;
  let fixture: ComponentFixture<LeaveTransactionsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LeaveTransactionsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LeaveTransactionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
