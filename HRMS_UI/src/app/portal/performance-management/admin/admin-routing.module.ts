import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: "",
    pathMatch: "full",
    redirectTo: "kra-management",
  },
  {
    path: "kra-management",
    loadChildren: () =>
      import("./kra-management/kra-management.module").then(
        (m) => m.KraManagementModule
      ),
  },
  {
    path: "kpp-management",
    loadChildren: () =>
      import("./kpi-management/kpi-management.module").then(
        (m) => m.KpiManagementModule
      ),
  },
  {
    path: 'assign-kra', loadChildren: () => import('./assign-kra/assign-kra.module').then(m => m.AssignKraModule)
  },
  {
    path: 'initiate-performance-review', loadChildren: () => import('./initiate-performance-review/initiate-performance-review.module').then(m => m.InitiatePerformanceReviewModule)
  },
  

  {
    path: 'final-review', loadChildren: () => import('./final-review/final-review.module').then(m => m.FinalReviewModule)
  },
  // {
  //   path: 'employee-wise-report', loadChildren: () => import('./final-review/employee-wise-report/').then(m => m.EmployeeWiseReportModule)
  // }
  
  // /portal/pms/adminpms/assign-kra
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
