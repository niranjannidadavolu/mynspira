import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'my-leaves'
  },
  {
    path: 'my-leaves', loadChildren: () => import('./my-leaves/my-leaves.module').then(m => m.MyLeavesModule)
  },
  {
    path: 'team-leaves', loadChildren: () => import('./my-team-leaves/my-team-leaves.module').then(m => m.MyTeamLeavesModule)
  },
  {
    path:'team-leaves-approval',loadChildren:()=>import('./leave-for-approval/leave-for-approval.module').then(m=>m.LeaveForApprovalModule)
  },
  {
    path: 'leave-transactions', loadChildren: () => import('./leave-transactions/leave-transactions.module').then(m => m.LeaveTransactionsModule)
  },
  {
    path: 'leave-encashment', loadChildren: () => import('./leave-encashment/leave-encashment.module').then(m => m.LeaveEncashmentModule)
  },
  {
    path: 'leave-report', loadChildren: () => import('./leave-report/leave-report.module').then(m => m.LeaveReportModule)
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LeaveManagementRoutingModule { }
