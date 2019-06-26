import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminEnfermedadesDiagComponent } from './admin-enfermedades-diag.component';

describe('AdminEnfermedadesDiagComponent', () => {
  let component: AdminEnfermedadesDiagComponent;
  let fixture: ComponentFixture<AdminEnfermedadesDiagComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminEnfermedadesDiagComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminEnfermedadesDiagComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
