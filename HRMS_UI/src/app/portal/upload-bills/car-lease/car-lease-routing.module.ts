import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CarLeaseComponent } from './car-lease/car-lease.component';

const routes: Routes = [
  {
      path: '',
      component: CarLeaseComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CarLeaseRoutingModule { }
