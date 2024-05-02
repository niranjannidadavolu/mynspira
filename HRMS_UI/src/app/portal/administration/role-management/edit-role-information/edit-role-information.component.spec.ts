import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditRoleInformationComponent } from './edit-role-information.component';

describe('EditRoleInformationComponent', () => {
  let component: EditRoleInformationComponent;
  let fixture: ComponentFixture<EditRoleInformationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditRoleInformationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditRoleInformationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
