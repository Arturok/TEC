import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TopNavBarDoctorComponent } from './top-nav-bar-doctor.component';

describe('TopNavBarDoctorComponent', () => {
  let component: TopNavBarDoctorComponent;
  let fixture: ComponentFixture<TopNavBarDoctorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TopNavBarDoctorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TopNavBarDoctorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
