import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UploadAgreementBillsComponent } from './upload-agreement-bills.component';

describe('UploadAgreementBillsComponent', () => {
  let component: UploadAgreementBillsComponent;
  let fixture: ComponentFixture<UploadAgreementBillsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UploadAgreementBillsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UploadAgreementBillsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
