import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Chapte6ProofComponent } from './chapte6-proof.component';

describe('Chapte6ProofComponent', () => {
  let component: Chapte6ProofComponent;
  let fixture: ComponentFixture<Chapte6ProofComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Chapte6ProofComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Chapte6ProofComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
