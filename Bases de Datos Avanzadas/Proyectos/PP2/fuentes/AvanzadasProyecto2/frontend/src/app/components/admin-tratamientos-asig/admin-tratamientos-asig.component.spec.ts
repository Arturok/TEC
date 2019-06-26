import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminTratamientosAsigComponent } from './admin-tratamientos-asig.component';

describe('AdminTratamientosAsigComponent', () => {
  let component: AdminTratamientosAsigComponent;
  let fixture: ComponentFixture<AdminTratamientosAsigComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminTratamientosAsigComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminTratamientosAsigComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
