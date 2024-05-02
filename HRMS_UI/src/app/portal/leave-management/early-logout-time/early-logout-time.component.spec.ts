import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EarlyLogoutTimeComponent } from './early-logout-time.component';

describe('EarlyLogoutTimeComponent', () => {
  let component: EarlyLogoutTimeComponent;
  let fixture: ComponentFixture<EarlyLogoutTimeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EarlyLogoutTimeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EarlyLogoutTimeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
