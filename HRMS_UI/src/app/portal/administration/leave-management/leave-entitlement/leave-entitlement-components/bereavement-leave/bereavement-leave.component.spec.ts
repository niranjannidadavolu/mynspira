import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BereavementLeaveComponent } from './bereavement-leave.component';

describe('BereavementLeaveComponent', () => {
  let component: BereavementLeaveComponent;
  let fixture: ComponentFixture<BereavementLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BereavementLeaveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BereavementLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
