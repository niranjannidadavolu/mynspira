import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CompOffLeaveComponent } from './comp-off-leave.component';

describe('CompOffLeaveComponent', () => {
  let component: CompOffLeaveComponent;
  let fixture: ComponentFixture<CompOffLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CompOffLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CompOffLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
