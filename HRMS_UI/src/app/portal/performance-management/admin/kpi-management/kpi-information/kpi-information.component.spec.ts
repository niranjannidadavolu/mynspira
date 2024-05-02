import { ComponentFixture, TestBed } from '@angular/core/testing';

import { KpiInformationComponent } from './kpi-information.component';

describe('KpiInformationComponent', () => {
  let component: KpiInformationComponent;
  let fixture: ComponentFixture<KpiInformationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ KpiInformationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(KpiInformationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
