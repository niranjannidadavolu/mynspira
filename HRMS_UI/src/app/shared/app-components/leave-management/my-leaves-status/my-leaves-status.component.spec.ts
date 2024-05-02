import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MyLeavesStatusComponent } from './my-leaves-status.component';

describe('MyLeavesStatusComponent', () => {
  let component: MyLeavesStatusComponent;
  let fixture: ComponentFixture<MyLeavesStatusComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MyLeavesStatusComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MyLeavesStatusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
