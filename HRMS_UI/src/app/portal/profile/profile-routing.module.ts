import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  // {
  //     path: '',
  //     pathMatch:'full',
  //     redirectTo:'my-profile'
  // },
  {
    path: '', loadChildren: () => import('./my-profile/my-profile.module').then(m => m.MyProfileModule)
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProfileRoutingModule { }
