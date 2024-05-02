import { ComponentFixture, TestBed } from '@angular/core/testing';

import { KraInformationComponent } from './kra-information.component';

describe('KraInformationComponent', () => {
  let component: KraInformationComponent;
  let fixture: ComponentFixture<KraInformationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ KraInformationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(KraInformationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
