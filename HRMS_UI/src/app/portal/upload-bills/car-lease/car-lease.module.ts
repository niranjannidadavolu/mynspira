import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CarLeaseRoutingModule } from './car-lease-routing.module';
import { NgbAccordionModule, NgbDropdownModule, NgbModule, NgbTooltipModule } from '@ng-bootstrap/ng-bootstrap';
import { SharedModule } from 'src/app/shared/shared.module';
import { NgSelectModule } from '@ng-select/ng-select';
import { FlatpickrModule } from 'angularx-flatpickr';
import { SwiperModule } from 'ngx-swiper-wrapper';
import { CarLeaseComponent } from './car-lease/car-lease.component';
import { LeafletModule } from '@asymmetrik/ngx-leaflet';
import { NgbToastModule,  NgbNavModule,  NgbAlertModule, NgbCarouselModule, NgbModalModule, NgbProgressbarModule, NgbPopoverModule, NgbPaginationModule, NgbCollapseModule } from '@ng-bootstrap/ng-bootstrap';
import { CountToModule } from 'angular-count-to';
import { FeatherModule } from 'angular-feather';
import { allIcons } from 'angular-feather/icons';
import { NgApexchartsModule } from 'ng-apexcharts';
import { SimplebarAngularModule } from 'simplebar-angular';
import { WidgetModule } from 'src/app/shared/widget/widget.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { CarLeaseAgreementBillsComponent } from './agreement-bills/agreement-bills.component';
import { DxButtonModule, DxDataGridModule, DxFileUploaderModule } from 'devextreme-angular';
import { UploadNewBillComponent } from './maintenance-bill/upload-new-bill/upload-new-bill.component';
import { MaintenanceBillComponent } from './maintenance-bill/maintenance-bill.component';
import { UploadAgreementBillsComponent } from './agreement-bills/upload-agreement-bills/upload-agreement-bills.component';
import { FilterService, GridModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';
import { MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';

@NgModule({
  declarations: [
    CarLeaseComponent,
    CarLeaseAgreementBillsComponent,
    UploadNewBillComponent,
    MaintenanceBillComponent,
    UploadAgreementBillsComponent
  ],
  imports: [
    CommonModule,
    CarLeaseRoutingModule,
    SharedModule,
    NgbModule,
    NgbDropdownModule,
    NgbAccordionModule,
    NgbTooltipModule,
    SwiperModule,
    NgSelectModule,    
    FormsModule,
    ReactiveFormsModule,
    NgbToastModule,
    FeatherModule.pick(allIcons),
    CountToModule,
    LeafletModule,    
    NgbNavModule,
    SimplebarAngularModule,
    NgApexchartsModule,
    FlatpickrModule.forRoot(),    
    WidgetModule,    
    NgbAlertModule,
    NgbCarouselModule,
    NgbModalModule,
    NgbProgressbarModule,    
    NgbPopoverModule,
    NgbPaginationModule,
    NgbCollapseModule,
    GridModule,
    MultiSelectModule
  ],
  providers: [FilterService, PageService ,SortService]
})
export class CarLeaseModule { }
