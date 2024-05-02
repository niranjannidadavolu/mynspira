import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateEducationDetailsComponent } from './create-education-details.component';

describe('CreateEducationDetailsComponent', () => {
  let component: CreateEducationDetailsComponent;
  let fixture: ComponentFixture<CreateEducationDetailsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreateEducationDetailsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateEducationDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
