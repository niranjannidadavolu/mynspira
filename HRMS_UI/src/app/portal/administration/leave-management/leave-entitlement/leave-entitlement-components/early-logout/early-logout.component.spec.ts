import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EarlyLogoutComponent } from './early-logout.component';

describe('EarlyLogoutComponent', () => {
  let component: EarlyLogoutComponent;
  let fixture: ComponentFixture<EarlyLogoutComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EarlyLogoutComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EarlyLogoutComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
