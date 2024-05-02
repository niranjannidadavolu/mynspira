import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MaternityLeaveComponent } from './maternity-leave.component';

describe('MaternityLeaveComponent', () => {
  let component: MaternityLeaveComponent;
  let fixture: ComponentFixture<MaternityLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MaternityLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MaternityLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
