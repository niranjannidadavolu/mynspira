import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReImbursementComponent } from './re-imbursement.component';

describe('ReImbursementComponent', () => {
  let component: ReImbursementComponent;
  let fixture: ComponentFixture<ReImbursementComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReImbursementComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ReImbursementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
