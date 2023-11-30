import { Component } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { UtilService } from 'src/app/services/validations/util.service';
import { TemperatureçService } from 'src/app/services/temperatureç.service';


@Component({
  selector: 'app-time',
  templateUrl: './time.component.html',
  styleUrls: ['./time.component.css']
})
export class TimeComponent {

  form!: FormGroup;
  time: any;
  name: any;
  temperature: any;
  humidity: any;
  latitude: any;
  longitude: any;
  description: any;
  showError: boolean = false;
  messageError: String = "";
  date = new Date();

  constructor(private fb: FormBuilder, private _util: UtilService, private _time: TemperatureçService) {
    this.startform();
  }

  startform() {

    this.form = this.fb.group({
      city: ['', Validators.required, this._util.noNeiva, Validators.pattern('$[a-zA-Z]*') ],
      code: ['', Validators.required ]
    })
  }

  consult() {
    console.log("Form: ", this.form);

    this._time.getStatusWeather(this.form.get('city')?.value, this.form.get('code')?.value)
    .subscribe((response: any) => {
      this.showError = false;
      this.time = response;
      this.name = this.time.name;
      this.temperature = this.time.main.temp;
      this.humidity = this.time.main.humidity;
      this.latitude = this.time.coord.lat;
      this.longitude = this.time.coord.lon;
      this.description = this.time.weather[0].description;
      console.log("response: ", response);
    }),
    (error:any) => {
      this.showError = true;
      this.messageError = "Error when checking the weather status";
    }
  }
}
