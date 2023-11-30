import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Form2oComponent } from './form2o.component';

describe('Form2oComponent', () => {
  let component: Form2oComponent;
  let fixture: ComponentFixture<Form2oComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [Form2oComponent]
    });
    fixture = TestBed.createComponent(Form2oComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
