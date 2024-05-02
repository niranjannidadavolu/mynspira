import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GroupMediClaimComponent } from './group-medi-claim.component';

describe('GroupMediClaimComponent', () => {
  let component: GroupMediClaimComponent;
  let fixture: ComponentFixture<GroupMediClaimComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GroupMediClaimComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(GroupMediClaimComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
