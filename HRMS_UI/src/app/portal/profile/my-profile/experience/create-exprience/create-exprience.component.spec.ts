import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateExprienceComponent } from './create-exprience.component';

describe('CreateExprienceComponent', () => {
  let component: CreateExprienceComponent;
  let fixture: ComponentFixture<CreateExprienceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreateExprienceComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateExprienceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
