import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UploadNewBillComponent } from './upload-new-bill.component';

describe('UploadNewBillComponent', () => {
  let component: UploadNewBillComponent;
  let fixture: ComponentFixture<UploadNewBillComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UploadNewBillComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UploadNewBillComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
