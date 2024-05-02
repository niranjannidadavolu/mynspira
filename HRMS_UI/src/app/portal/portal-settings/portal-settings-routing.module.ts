import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
      path: '',
      pathMatch:'full',
      redirectTo:'settings'
  },
  {
    path: 'settings', loadChildren: () => import('./portal-settings/portal-settings.module').then(m => m.PortalSettingsModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PortalSettingsRoutingModule { }
