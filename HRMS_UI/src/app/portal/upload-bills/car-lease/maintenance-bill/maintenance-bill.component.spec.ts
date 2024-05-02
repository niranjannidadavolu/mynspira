import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MaintenanceBillComponent } from './maintenance-bill.component';

describe('MaintenanceBillComponent', () => {
  let component: MaintenanceBillComponent;
  let fixture: ComponentFixture<MaintenanceBillComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MaintenanceBillComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MaintenanceBillComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
