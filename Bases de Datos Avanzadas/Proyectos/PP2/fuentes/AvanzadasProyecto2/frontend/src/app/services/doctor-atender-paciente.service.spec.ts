import { TestBed } from '@angular/core/testing';

import { DoctorAtenderPacienteService } from './doctor-atender-paciente.service';

describe('DoctorAtenderPacienteService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: DoctorAtenderPacienteService = TestBed.get(DoctorAtenderPacienteService);
    expect(service).toBeTruthy();
  });
});
