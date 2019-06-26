import { TestBed } from '@angular/core/testing';

import { PacienteCitaService } from './paciente-cita.service';

describe('PacienteCitaService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: PacienteCitaService = TestBed.get(PacienteCitaService);
    expect(service).toBeTruthy();
  });
});


