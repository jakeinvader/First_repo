import { Component } from '@angular/core';
import { Person } from '../person';

@Component({
  selector: 'app-contador',
  templateUrl: './contador.component.html',
  styleUrls: ['./contador.component.css']
})
export class ContadorComponent {

  number: number = 1;

  decrement() {
    this.number--;
  }

  increment() {
    this.number += 1;
  }
}
