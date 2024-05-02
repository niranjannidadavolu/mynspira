import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UploadItrFileComponent } from './upload-itr-file.component';

describe('UploadItrFileComponent', () => {
  let component: UploadItrFileComponent;
  let fixture: ComponentFixture<UploadItrFileComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UploadItrFileComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UploadItrFileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
