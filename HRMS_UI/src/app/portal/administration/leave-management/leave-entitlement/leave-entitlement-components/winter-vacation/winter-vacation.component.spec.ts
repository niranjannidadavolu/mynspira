import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WinterVacationComponent } from './winter-vacation.component';

describe('WinterVacationComponent', () => {
  let component: WinterVacationComponent;
  let fixture: ComponentFixture<WinterVacationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ WinterVacationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(WinterVacationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
