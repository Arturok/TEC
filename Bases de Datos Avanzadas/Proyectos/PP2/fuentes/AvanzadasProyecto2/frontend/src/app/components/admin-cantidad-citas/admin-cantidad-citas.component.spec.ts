import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminCantidadCitasComponent } from './admin-cantidad-citas.component';

describe('AdminCantidadCitasComponent', () => {
  let component: AdminCantidadCitasComponent;
  let fixture: ComponentFixture<AdminCantidadCitasComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminCantidadCitasComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminCantidadCitasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
