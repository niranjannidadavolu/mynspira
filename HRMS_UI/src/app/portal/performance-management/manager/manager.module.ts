import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ManagerRoutingModule } from './manager-routing.module';
import { PendingReviewsComponent } from './pending-reviews/pending-reviews.component';
import { ReviewFeedBackComponent } from './review-feed-back/review-feed-back.component';


@NgModule({
  declarations: [
  ],
  imports: [
    CommonModule,
    ManagerRoutingModule
  ]
})
export class ManagerModule { }
