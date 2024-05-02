import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ReviewTimeSheetComponent } from './review-time-sheet.component';

const routes: Routes = [
  {
    path: '',
    component:ReviewTimeSheetComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReviewTimeSheetRoutingModule { }
