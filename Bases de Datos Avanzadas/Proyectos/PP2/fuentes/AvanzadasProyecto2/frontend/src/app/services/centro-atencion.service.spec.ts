import { TestBed } from '@angular/core/testing';

import { CentroAtencionService } from './centro-atencion.service';

describe('CentroAtencionService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: CentroAtencionService = TestBed.get(CentroAtencionService);
    expect(service).toBeTruthy();
  });
});
