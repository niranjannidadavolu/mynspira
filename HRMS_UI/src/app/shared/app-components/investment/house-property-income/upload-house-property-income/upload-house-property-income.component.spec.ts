import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UploadHousePropertyIncomeComponent } from './upload-house-property-income.component';

describe('UploadHousePropertyIncomeComponent', () => {
  let component: UploadHousePropertyIncomeComponent;
  let fixture: ComponentFixture<UploadHousePropertyIncomeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UploadHousePropertyIncomeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UploadHousePropertyIncomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
