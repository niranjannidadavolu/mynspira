import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReImbursementRoutingModule } from './re-imbursement-routing.module';
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
import { ReImbursementComponent } from './re-imbursement/re-imbursement.component';
import { DxDataGridModule } from 'devextreme-angular';
import { UploadBillComponent } from './upload-bill/upload-bill.component';
import { MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';
import { AggregateService, FilterService, GridModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';


@NgModule({
  declarations: [
    ReImbursementComponent,
    UploadBillComponent
  ],
  imports: [
    ReImbursementRoutingModule,
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
    DxDataGridModule,
    GridModule,
    MultiSelectModule
  ],
  providers: [FilterService, PageService ,SortService,AggregateService]
})
export class ReImbursementModule { }
