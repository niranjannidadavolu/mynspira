import { ComponentFixture, TestBed } from '@angular/core/testing';

import { KraMetricsReportComponent } from './kra-metrics-report.component';

describe('KraMetricsReportComponent', () => {
  let component: KraMetricsReportComponent;
  let fixture: ComponentFixture<KraMetricsReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ KraMetricsReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(KraMetricsReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
