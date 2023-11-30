import { Component } from '@angular/core';

import { Person } from '../person';

@Component({
  selector: 'app-loops',
  templateUrl: './loops.component.html',
  styleUrls: ['./loops.component.css']
})
export class LoopsComponent {

  people: Person[] = [
    { name: 'John', age: 34 },
    { name: ' Doe', age: 30 },
    { name: 'Ana', age: 23 },
    { name: 'Britny', age: 21 }
  ];
}
