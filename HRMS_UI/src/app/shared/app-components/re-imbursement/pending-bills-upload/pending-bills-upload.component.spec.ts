import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PendingBillsUploadComponent } from './pending-bills-upload.component';

describe('PendingBillsUploadComponent', () => {
  let component: PendingBillsUploadComponent;
  let fixture: ComponentFixture<PendingBillsUploadComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PendingBillsUploadComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PendingBillsUploadComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
