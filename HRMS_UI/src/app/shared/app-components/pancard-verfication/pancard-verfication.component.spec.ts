import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PancardVerficationComponent } from './pancard-verfication.component';

describe('PancardVerficationComponent', () => {
  let component: PancardVerficationComponent;
  let fixture: ComponentFixture<PancardVerficationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PancardVerficationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PancardVerficationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
