import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProfileRoutingModule } from './profile-routing.module';
import { NgbDropdownModule, NgbAccordionModule, NgbTooltipModule, NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { NgSelectModule } from '@ng-select/ng-select';
import { FlatpickrModule } from 'angularx-flatpickr';
import { SwiperModule } from 'ngx-swiper-wrapper';
import { SharedModule } from 'src/app/shared/shared.module';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    SharedModule,
    NgbModule,
    ProfileRoutingModule,
    NgbDropdownModule,
    NgbAccordionModule,
    NgbTooltipModule,
    SwiperModule,
    NgSelectModule,
    FlatpickrModule,
  ]
})
export class ProfileModule { }
