import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'dashboard'
  },
  {
    path: 'dashboard', loadChildren: () => import('./dash-board/dash-board.module').then(m => m.DashBoardModule)
  },
  {
    path: 'investments', loadChildren: () => import('./investments/investments.module').then(m => m.InvestmentsModule)
  },
  {
    path: 'profile', loadChildren: () => import('./profile/profile.module').then(m => m.ProfileModule)
  },
  {
    path: 'upload-bills', loadChildren: () => import('./upload-bills/upload-bills.module').then(m => m.UploadBillsModule)
  },
  {
    path: 'downloads', loadChildren: () => import('./downloads/downloads.module').then(m => m.DownloadsModule)
  },
  {
    path: 'administration', loadChildren: () => import('./administration/administration.module').then(m => m.AdministrationModule)
  },
  {
    path: 'leave', loadChildren: () => import('./leave-management/leave-management.module').then(m => m.LeaveManagementModule)
  },
  {
    path: 'project-management', loadChildren: () => import('./time-sheet-management/time-sheet-management.module').then(m => m.TimeSheetManagementModule)
  },
  {
    path: 'time-sheet', loadChildren: () => import('./time-sheet-management/time-sheet-management.module').then(m => m.TimeSheetManagementModule)
  },
  {
    path: 'reports', loadChildren: () => import('./reports/reports.module').then(m => m.ReportsModule)
  },
  {
    path: 'document-management', loadChildren: () => import('./document-management/document-management.module').then(m => m.DocumentManagementModule)
  },
  // {
  //   path: 'travel', loadChildren: () => import('./travel-management/travel-management.module').then(m => m.TravelManagementModule)
  // },
  {
    path: 'pms', loadChildren: () => import('./performance-management/performance-management.module').then(m => m.PerformanceManagementModule)
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PortalRoutingModule { }
