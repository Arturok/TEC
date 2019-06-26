import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TopNavBarPacienteComponent } from './top-nav-bar-paciente.component';

describe('TopNavBarPacienteComponent', () => {
  let component: TopNavBarPacienteComponent;
  let fixture: ComponentFixture<TopNavBarPacienteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TopNavBarPacienteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TopNavBarPacienteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
