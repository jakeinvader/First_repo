import { Component } from '@angular/core';

@Component({
  selector: 'app-form2o',
  templateUrl: './form2o.component.html',
  styleUrls: ['./form2o.component.css']
})
export class Form2oComponent {

  person = {
    name: '',
    age: ''
  };

  process() {
    console.log(this.person);
  }
}
