import { LogsModule } from './logs/logs.module';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
      path: '',
      pathMatch:'full',
      redirectTo:'user-management'
  },
  {
    path: 'user-management', loadChildren: () => import('./user-management/user-management.module').then(m => m.UserManagementModule)
  },
  {
    path: 'role-management', loadChildren: () => import('./role-management/role-management.module').then(m => m.RoleManagementModule)
  },
  {
    path: 'screen-management', loadChildren: () => import('./screen-management/screen-management.module').then(m => m.ScreenManagementModule)
  },
  {
    path: 'security-module', loadChildren: () => import('./security-module/security-module.module').then(m => m.SecurityModuleModule)
  },
  {
    path: 'leave-management', loadChildren: () => import('./leave-management/leave-management.module').then(m => m.LeaveManagementModule)
  },
  {
    path: 'logs', loadChildren: () => import('./logs/logs.module').then(m => m.LogsModule)
  },
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdministrationRoutingModule { }
