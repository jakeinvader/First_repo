import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Form3eComponent } from './form3e.component';

describe('Form3eComponent', () => {
  let component: Form3eComponent;
  let fixture: ComponentFixture<Form3eComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [Form3eComponent]
    });
    fixture = TestBed.createComponent(Form3eComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
