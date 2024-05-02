import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
      path: '',
      pathMatch:'full',
      redirectTo:'re-imbursement'
  },
  {
    path: 're-imbursement', loadChildren: () => import('./re-imbursement/re-imbursement.module').then(m => m.ReImbursementModule)
  },  
  {
    path: 'car-lease', loadChildren: () => import('./car-lease/car-lease.module').then(m => m.CarLeaseModule)
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UploadBillsRoutingModule { }
