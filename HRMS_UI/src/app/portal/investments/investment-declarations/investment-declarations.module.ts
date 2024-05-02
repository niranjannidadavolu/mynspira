import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { InvestmentDeclarationsRoutingModule } from './investment-declarations-routing.module';
import { InvestmentDeclarationsComponent } from './investment-declarations/investment-declarations.component';
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
  declarations: [
    InvestmentDeclarationsComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    CommonModule,
    NgbToastModule,
    FeatherModule.pick(allIcons),
    CountToModule,
    LeafletModule,
    NgbDropdownModule,
    SimplebarAngularModule,
    NgApexchartsModule,
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
    NgbNavModule,
    NgbAccordionModule,
    NgbCollapseModule,
    InvestmentDeclarationsRoutingModule
  ]
})
export class InvestmentDeclarationsModule { }
