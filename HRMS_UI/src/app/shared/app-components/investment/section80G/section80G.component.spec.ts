import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Section80GComponent } from './section80G.component';

describe('Chapter6Component', () => {
  let component: Section80GComponent;
  let fixture: ComponentFixture<Section80GComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Section80GComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Section80GComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
