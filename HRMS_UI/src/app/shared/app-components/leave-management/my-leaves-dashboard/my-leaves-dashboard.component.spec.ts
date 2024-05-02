import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MyLeavesDashboardComponent } from './my-leaves-dashboard.component';

describe('MyLeavesDashboardComponent', () => {
  let component: MyLeavesDashboardComponent;
  let fixture: ComponentFixture<MyLeavesDashboardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MyLeavesDashboardComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MyLeavesDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
