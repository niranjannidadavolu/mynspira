import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { InvestmentsRoutingModule } from './investments-routing.module';
import { LeafletModule } from '@asymmetrik/ngx-leaflet';
import { NgbToastModule, NgbDropdownModule, NgbNavModule, NgbAccordionModule, NgbAlertModule, NgbCarouselModule, NgbModalModule, NgbProgressbarModule, NgbTooltipModule, NgbPopoverModule, NgbPaginationModule, NgbCollapseModule } from '@ng-bootstrap/ng-bootstrap';
import { CountToModule } from 'angular-count-to';
import { FeatherModule } from 'angular-feather';
import { allIcons } from 'angular-feather/icons';
import { FlatpickrModule } from 'angularx-flatpickr';
import { NgApexchartsModule } from 'ng-apexcharts';
import { SwiperModule } from 'ngx-swiper-wrapper';
import { SimplebarAngularModule } from 'simplebar-angular';
import { SharedModule } from 'src/app/shared/shared.module';
import { WidgetModule } from 'src/app/shared/widget/widget.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    NgbToastModule,
    FeatherModule.pick(allIcons),
    CountToModule,
    LeafletModule,
    NgbDropdownModule,
    NgbNavModule,
    SimplebarAngularModule,
    NgApexchartsModule,
    NgbAccordionModule,
    SwiperModule,
    FlatpickrModule.forRoot(),
    SharedModule,
    WidgetModule,    
    NgbAlertModule,
    NgbCarouselModule,
    NgbModalModule,
    NgbProgressbarModule,
    NgbTooltipModule,
    NgbPopoverModule,
    NgbPaginationModule,
    NgbCollapseModule,
    InvestmentsRoutingModule
  ]
})
export class InvestmentsModule { }
