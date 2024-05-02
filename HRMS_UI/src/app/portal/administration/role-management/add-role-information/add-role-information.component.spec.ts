import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddRoleInformationComponent } from './add-role-information.component';

describe('AddRoleInformationComponent', () => {
  let component: AddRoleInformationComponent;
  let fixture: ComponentFixture<AddRoleInformationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddRoleInformationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddRoleInformationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
