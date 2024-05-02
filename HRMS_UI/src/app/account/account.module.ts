import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

// Load Icons
import { defineLordIconElement } from 'lord-icon-element';
import lottie from 'lottie-web';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';

import { AccountRoutingModule } from './account-routing.module';
import { SigninModule } from "./auth/signin/signin.module";
import { NgbCarouselModule } from '@ng-bootstrap/ng-bootstrap';
import { RecoverPasswordComponent } from './recover-password/recover-password.component';
import { SharedModule } from '../shared/shared.module';

@NgModule({
  declarations: [
  
    RecoverPasswordComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    NgbCarouselModule,
    ReactiveFormsModule,
    FormsModule,
    AccountRoutingModule,
    SigninModule
  ]
})
export class AccountModule { 
  constructor() {
    defineLordIconElement(lottie.loadAnimation);
  }
}
