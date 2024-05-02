import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path:'',
    redirectTo:'my-documents',
    pathMatch:'full'
  },
  {
    path: 'my-documents', loadChildren: () => import('./my-documents/my-documents.module').then(m => m.MyDocumentsModule)
  }
]

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DocumentManagementRoutingModule { }
