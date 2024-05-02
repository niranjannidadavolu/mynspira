import { ComponentFixture, TestBed } from '@angular/core/testing';
import { UploadHouseRentAllowanceComponent } from './upload-house-rent-allowance.component';


describe('UploadHouseRentAllowanceProofComponent', () => {
  let component: UploadHouseRentAllowanceComponent;
  let fixture: ComponentFixture<UploadHouseRentAllowanceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UploadHouseRentAllowanceComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UploadHouseRentAllowanceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
