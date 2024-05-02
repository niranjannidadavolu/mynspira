import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PrivilegeLeaveComponent } from './privilege-leave.component';

describe('PrivilegeLeaveComponent', () => {
  let component: PrivilegeLeaveComponent;
  let fixture: ComponentFixture<PrivilegeLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PrivilegeLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PrivilegeLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
