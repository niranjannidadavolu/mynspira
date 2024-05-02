import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { pathToFileURL } from 'url';
import { MyDocumentsComponent } from './my-documents.component';

const routes: Routes = [
  {
    path:'',
    component:MyDocumentsComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MyDocumentsRoutingModule { }
