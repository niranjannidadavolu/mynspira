import { BasicComponent } from './account/auth/errors/basic/basic.component';
import { CoverComponent } from './account/auth/errors/cover/cover.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from './core/guards/auth.guard';
import { MaintenanceComponent } from './extraspages/maintenance/maintenance.component';
import { LayoutComponent } from './layouts/layout.component';

const routes: Routes = [
  { path: 'account', loadChildren: () => import('./account/account.module').then(m => m.AccountModule) },
  { path: 'portal', component: LayoutComponent, loadChildren: () => import('./portal/portal.module').then(m => m.PortalModule), canActivate: [AuthGuard]},
  { path: 'unauthorized', component: BasicComponent },
  { path: '', pathMatch: 'full', redirectTo: 'account' },
  { path: '**', component: CoverComponent }
];
@NgModule({
  imports: [
    RouterModule.forRoot(routes)
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
