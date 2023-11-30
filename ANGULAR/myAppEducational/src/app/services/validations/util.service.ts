import { Injectable } from '@angular/core';
import { FormControl } from '@angular/forms';
import { of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UtilService {

  constructor() { }

  noNeiva(control: FormControl) {

    const value: string = control.value?.trim().toLowerCase();

    if( value == 'neiva' ) {

      return {
        noNeiva: true
      }
    }

    return of(null);
      
  }
}
