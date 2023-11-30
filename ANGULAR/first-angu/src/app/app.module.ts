import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ContadorComponent } from './contador/contador.component';
import { ButtonsComponent } from './buttons/buttons.component';
import { FormComponent } from './form/form.component';
import { LoopsComponent } from './loops/loops.component';
import { SwitchComponent } from './switch/switch.component';
import { Form2oComponent } from './form2o/form2o.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Form3eComponent } from './form3e/form3e.component';


@NgModule({
  declarations: [
    AppComponent,
    ContadorComponent,
    ButtonsComponent,
    FormComponent,
    LoopsComponent,
    SwitchComponent,
    Form2oComponent,
    Form3eComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
