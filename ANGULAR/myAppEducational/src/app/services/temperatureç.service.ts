import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

const urlBase = 'https://api.openweathermap.org/data/2.5/weather';
const appId = 'f42d01f198159e4f0795acc3d3148007';
@Injectable({
  providedIn: 'root'
})
export class TemperatureçService {

  constructor(private http: HttpClient) { }

  getStatusWeather(city: string, code: string) {

    const url = `${ urlBase }?q=${city},${code}&appid=${appId}`;
    return this.http.get(url);
  }
}
