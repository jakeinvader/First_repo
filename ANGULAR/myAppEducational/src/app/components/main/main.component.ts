import { Component } from '@angular/core';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent {

  cities = ['Neiva', 'Medellin', 'Bogota', 'Santa Marta', 'Cartagena'];
  showCity: boolean = true;
  changeCss: boolean = true;

  show () {
    this.showCity = !this.showCity;
  }

  changCss() {
    this.changeCss = !this.changeCss;
  }
}
