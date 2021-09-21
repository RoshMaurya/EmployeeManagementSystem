import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddEmptoprojectComponent } from './add-emptoproject.component';

describe('AddEmptoprojectComponent', () => {
  let component: AddEmptoprojectComponent;
  let fixture: ComponentFixture<AddEmptoprojectComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddEmptoprojectComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddEmptoprojectComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
