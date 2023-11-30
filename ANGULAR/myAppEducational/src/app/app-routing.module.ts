import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MainComponent } from './components/main/main.component';
import { TimeComponent } from './components/time/time.component';

const routes: Routes = [
  { path: 'main', component: MainComponent },
  { path: 'time', component: TimeComponent },
  { path: '', redirectTo: '/main', pathMatch: 'full' },
  { path: '*', component: MainComponent }
]

@NgModule({
  imports: [
    RouterModule.forRoot (routes)
  ],

  exports: [ RouterModule ]
})
export class AppRoutingModule { }
