import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CitaEspecialidadComponent } from './cita-especialidad.component';

describe('CitaEspecialidadComponent', () => {
  let component: CitaEspecialidadComponent;
  let fixture: ComponentFixture<CitaEspecialidadComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CitaEspecialidadComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CitaEspecialidadComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
