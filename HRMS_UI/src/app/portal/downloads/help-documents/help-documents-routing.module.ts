import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HelpDocumentsComponent } from './help-documents/help-documents.component';

const routes: Routes = [
  {
      path: '',
      component: HelpDocumentsComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HelpDocumentsRoutingModule { }
