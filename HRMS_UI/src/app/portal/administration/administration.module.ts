import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdministrationRoutingModule } from './administration-routing.module';
import { UserInformationService } from 'src/app/core/services';
import { RoleInformationService } from 'src/app/core/services/administration/role-information.service';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';


@NgModule({
  declarations: [
  ],
  imports: [
    CommonModule,
    NgbModule,
    AdministrationRoutingModule
  ],
  providers:[RoleInformationService, UserInformationService]
})
export class AdministrationModule { }
