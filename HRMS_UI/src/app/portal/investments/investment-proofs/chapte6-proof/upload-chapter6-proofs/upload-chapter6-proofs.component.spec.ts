import { ComponentFixture, TestBed } from '@angular/core/testing';
import { UploadChapter6ProofsComponent } from './upload-chapter6-proofs.component';

describe('UploadProofsComponent', () => {
  let component: UploadChapter6ProofsComponent;
  let fixture: ComponentFixture<UploadChapter6ProofsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UploadChapter6ProofsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UploadChapter6ProofsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
