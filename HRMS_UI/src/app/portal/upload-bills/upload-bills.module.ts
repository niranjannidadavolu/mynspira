import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UploadBillsRoutingModule } from './upload-bills-routing.module';
import { NgbModule, NgbDropdownModule, NgbAccordionModule, NgbTooltipModule, NgbAlertModule, NgbCarouselModule, NgbCollapseModule, NgbModalModule, NgbNavModule, NgbPaginationModule, NgbPopoverModule, NgbProgressbarModule, NgbToastModule } from '@ng-bootstrap/ng-bootstrap';
import { NgSelectModule } from '@ng-select/ng-select';
import { FlatpickrModule } from 'angularx-flatpickr';
import { SwiperModule } from 'ngx-swiper-wrapper';
import { SharedModule } from 'src/app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { LeafletModule } from '@asymmetrik/ngx-leaflet';
import { CountToModule } from 'angular-count-to';
import { FeatherModule } from 'angular-feather';
import { allIcons } from 'angular-feather/icons';
import { NgApexchartsModule } from 'ng-apexcharts';
import { SimplebarAngularModule } from 'simplebar-angular';
import { WidgetModule } from 'src/app/shared/widget/widget.module';
// import { CarLeaseComponent } from './car-lease/car-lease.component';
// import { ReImbursementComponent } from './re-imbursement/re-imbursement.component';


@NgModule({
  declarations: [
    // CarLeaseComponent,
    // ReImbursementComponent
  ],
  imports: [
    UploadBillsRoutingModule,
    CommonModule,
    SharedModule,
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
  ]
})
export class UploadBillsModule { }
