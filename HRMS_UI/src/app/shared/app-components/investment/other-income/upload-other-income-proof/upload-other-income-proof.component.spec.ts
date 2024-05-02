import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UploadOtherIncomeProofComponent } from './upload-other-income-proof.component';

describe('UploadOtherIncomeProofComponent', () => {
  let component: UploadOtherIncomeProofComponent;
  let fixture: ComponentFixture<UploadOtherIncomeProofComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UploadOtherIncomeProofComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UploadOtherIncomeProofComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
