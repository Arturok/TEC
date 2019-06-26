import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DoctorInfoPacienteComponent } from './doctor-info-paciente.component';

describe('DoctorInfoPacienteComponent', () => {
  let component: DoctorInfoPacienteComponent;
  let fixture: ComponentFixture<DoctorInfoPacienteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DoctorInfoPacienteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DoctorInfoPacienteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
