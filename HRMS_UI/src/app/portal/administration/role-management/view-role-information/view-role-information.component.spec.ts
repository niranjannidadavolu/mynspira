import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewRoleInformationComponent } from './view-role-information.component';

describe('ViewRoleInformationComponent', () => {
  let component: ViewRoleInformationComponent;
  let fixture: ComponentFixture<ViewRoleInformationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ViewRoleInformationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewRoleInformationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
