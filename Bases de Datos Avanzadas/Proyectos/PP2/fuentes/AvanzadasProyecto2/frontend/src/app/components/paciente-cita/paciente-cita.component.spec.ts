import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PacienteCitaComponent } from './paciente-cita.component';

describe('PacienteCitaComponent', () => {
  let component: PacienteCitaComponent;
  let fixture: ComponentFixture<PacienteCitaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PacienteCitaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PacienteCitaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
