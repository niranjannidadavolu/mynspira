import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddTimeSheetComponent } from './add-time-sheet.component';

const routes: Routes = [
  {
    path: '',
    component:AddTimeSheetComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AddTimeSheetRoutingModule { }
