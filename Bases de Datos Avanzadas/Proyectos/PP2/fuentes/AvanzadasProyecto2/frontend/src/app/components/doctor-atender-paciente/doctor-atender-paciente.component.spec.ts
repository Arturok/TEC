import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DoctorAtenderPacienteComponent } from './doctor-atender-paciente.component';

describe('DoctorAtenderPacienteComponent', () => {
  let component: DoctorAtenderPacienteComponent;
  let fixture: ComponentFixture<DoctorAtenderPacienteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DoctorAtenderPacienteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DoctorAtenderPacienteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
