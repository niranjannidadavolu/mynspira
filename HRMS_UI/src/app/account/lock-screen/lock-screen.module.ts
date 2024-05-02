import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NgbCarouselModule } from '@ng-bootstrap/ng-bootstrap';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { LockScreenRoutingModule } from './lock-screen-routing.module';
import { LockScreenComponent } from './lock-screen.component';
import { SharedModule } from 'src/app/shared/shared.module';

@NgModule({
  declarations: [
    LockScreenComponent
  ],
  imports: [
    CommonModule,
    NgbCarouselModule,
    ReactiveFormsModule,
    FormsModule,
    LockScreenRoutingModule,
    SharedModule
  ]
})
export class LockscreenModule { }
