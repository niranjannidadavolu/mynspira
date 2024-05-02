import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CarLeaseComponent } from './car-lease.component';

describe('CarLeaseComponent', () => {
  let component: CarLeaseComponent;
  let fixture: ComponentFixture<CarLeaseComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CarLeaseComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CarLeaseComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
