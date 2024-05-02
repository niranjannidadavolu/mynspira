import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
// Load Icons
import { defineLordIconElement } from 'lord-icon-element';
import lottie from 'lottie-web';
import { RecoverPasswordRoutingModule } from './recover-password-routing.module';
import { NgbCarouselModule, NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { SharedModule } from 'src/app/shared/shared.module';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    SharedModule,
    NgbCarouselModule,
    NgbModule,
    ReactiveFormsModule,
    FormsModule,
    RecoverPasswordRoutingModule
  ]
})
export class RecoverPasswordModule { 
  constructor() {
    defineLordIconElement(lottie.loadAnimation);
  }
}
