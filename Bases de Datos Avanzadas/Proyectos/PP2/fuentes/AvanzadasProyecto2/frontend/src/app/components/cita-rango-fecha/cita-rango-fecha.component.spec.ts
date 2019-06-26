import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CitaRangoFechaComponent } from './cita-rango-fecha.component';

describe('CitaRangoFechaComponent', () => {
  let component: CitaRangoFechaComponent;
  let fixture: ComponentFixture<CitaRangoFechaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CitaRangoFechaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CitaRangoFechaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
