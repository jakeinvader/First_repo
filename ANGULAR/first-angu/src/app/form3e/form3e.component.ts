import { Component } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-form3e',
  templateUrl: './form3e.component.html',
  styleUrls: ['./form3e.component.css']
})
export class Form3eComponent {

  name = new FormControl('');
  email = new FormControl('');
}
