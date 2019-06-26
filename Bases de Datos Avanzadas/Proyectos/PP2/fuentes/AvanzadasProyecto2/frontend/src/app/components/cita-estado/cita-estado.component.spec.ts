import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CitaEstadoComponent } from './cita-estado.component';

describe('CitaEstadoComponent', () => {
  let component: CitaEstadoComponent;
  let fixture: ComponentFixture<CitaEstadoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CitaEstadoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CitaEstadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
