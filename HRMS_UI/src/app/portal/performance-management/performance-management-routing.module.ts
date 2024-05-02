import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'admin'
  },
  {
    path: 'admin', loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule)
  },
  {
    path: 'employee', loadChildren: () => import('./employee/employee.module').then(m => m.EmployeeModule)
  },
  {
    path: 'manager', loadChildren: () => import('./manager/manager.module').then(m => m.ManagerModule)
  },
  {
    path: 'view-review', loadChildren: () => import('./view-review-detail/view-review-detail.module').then(m => m.ViewReviewDetailModule)
  },
  {
    path: 'reviewer', loadChildren: () => import('./reviewer/reviewer.module').then(m => m.ReviewerModule)
  },
 
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PerformanceManagementRoutingModule { }
