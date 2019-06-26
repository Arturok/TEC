import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminRangoEnfermedadesComponent } from './admin-rango-enfermedades.component';

describe('AdminRangoEnfermedadesComponent', () => {
  let component: AdminRangoEnfermedadesComponent;
  let fixture: ComponentFixture<AdminRangoEnfermedadesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminRangoEnfermedadesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminRangoEnfermedadesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
