import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
      path: '',
      pathMatch:'full',
      redirectTo:'role-list'
  },
  {
    path: 'role-list', loadChildren: () => import('./role-list/role-list.module').then(m => m.RoleListModule)
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RoleManagementRoutingModule { }
