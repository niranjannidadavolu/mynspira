import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SecurityModuleComponent } from './security-module/security-module.component';

const routes: Routes = [
  {
      path: '',
      component:SecurityModuleComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SecurityModuleRoutingModule { }
