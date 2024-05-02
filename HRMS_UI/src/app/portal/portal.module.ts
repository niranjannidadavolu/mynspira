import { NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';

import { PortalRoutingModule } from './portal-routing.module';
import { LeafletModule } from '@asymmetrik/ngx-leaflet';
import { NgbToastModule, NgbDropdownModule } from '@ng-bootstrap/ng-bootstrap';
import { CountToModule } from 'angular-count-to';
import { FlatpickrModule } from 'angularx-flatpickr';
import { NgApexchartsModule } from 'ng-apexcharts';
import { LightboxModule } from 'ngx-lightbox';
import { SwiperModule } from 'ngx-swiper-wrapper';
import { SimplebarAngularModule } from 'simplebar-angular';
// import { AppsModule } from '../pages/apps/apps.module';
// import { DashboardsModule } from '../pages/dashboards/dashboards.module';
// import { EcommerceModule } from '../pages/ecommerce/ecommerce.module';
import { SharedModule } from '../shared/shared.module';
import { WidgetModule } from '../shared/widget/widget.module';
import { EmployeeService } from '../core/services';


@NgModule({
  declarations: [
  
    
  ],
  imports: [
    CommonModule,
    NgbToastModule,
    FlatpickrModule.forRoot(),
    CountToModule,
    NgApexchartsModule,
    LeafletModule,
    NgbDropdownModule,
    SimplebarAngularModule,
    SharedModule,
    WidgetModule,
    SwiperModule,
    LightboxModule,
    // DashboardsModule,
    // AppsModule,
    // EcommerceModule,
    PortalRoutingModule
  ],
  providers:[EmployeeService, DatePipe]
})
export class PortalModule { }
