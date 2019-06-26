import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TopNavBarAdminComponent } from './top-nav-bar-admin.component';

describe('TopNavBarAdminComponent', () => {
  let component: TopNavBarAdminComponent;
  let fixture: ComponentFixture<TopNavBarAdminComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TopNavBarAdminComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TopNavBarAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
