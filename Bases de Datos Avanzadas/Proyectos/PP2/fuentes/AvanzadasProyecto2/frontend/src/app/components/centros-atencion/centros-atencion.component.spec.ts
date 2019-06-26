import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CentrosAtencionComponent } from './centros-atencion.component';

describe('CentrosAtencionComponent', () => {
  let component: CentrosAtencionComponent;
  let fixture: ComponentFixture<CentrosAtencionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CentrosAtencionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CentrosAtencionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
