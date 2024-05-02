import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SecurityModuleComponent } from './security-module.component';

describe('SecurityModuleComponent', () => {
  let component: SecurityModuleComponent;
  let fixture: ComponentFixture<SecurityModuleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SecurityModuleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SecurityModuleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
