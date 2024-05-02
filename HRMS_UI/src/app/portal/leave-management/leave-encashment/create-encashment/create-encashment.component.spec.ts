import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateEncashmentComponent } from './create-encashment.component';

describe('CreateEncashmentComponent', () => {
  let component: CreateEncashmentComponent;
  let fixture: ComponentFixture<CreateEncashmentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreateEncashmentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateEncashmentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
