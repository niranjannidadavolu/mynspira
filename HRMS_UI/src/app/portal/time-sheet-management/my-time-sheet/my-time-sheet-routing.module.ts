import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MyTimeSheetComponent } from './my-time-sheet.component';

const routes: Routes = [
  {
    path: '',
    component:MyTimeSheetComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MyTimeSheetRoutingModule { }
