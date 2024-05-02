import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
      path: '',
      pathMatch:'full',
      redirectTo:'payslips'
  },
  {
    path: 'payslips', loadChildren: () => import('./pay-slips/pay-slips.module').then(m => m.PaySlipsModule)
  },
  {
    path: 'form16', loadChildren: () => import('./form16/form16.module').then(m => m.Form16Module)
  },
  {
    path: 'help-documents', loadChildren: () => import('./help-documents/help-documents.module').then(m => m.HelpDocumentsModule)
  },
  {
    path: 'group-medi-claim', loadChildren: () => import('./group-medi-claim/group-medi-claim.module').then(m => m.GroupMediClaimModule)
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DownloadsRoutingModule { }
