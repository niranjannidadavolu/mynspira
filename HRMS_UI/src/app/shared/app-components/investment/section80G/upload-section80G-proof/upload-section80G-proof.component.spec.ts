import { ComponentFixture, TestBed } from '@angular/core/testing';
import { UploadSection80GProofComponent } from './upload-section80G-proof.component';


describe('UploadSection80GProof', () => {
  let component: UploadSection80GProofComponent;
  let fixture: ComponentFixture<UploadSection80GProofComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UploadSection80GProofComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UploadSection80GProofComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
