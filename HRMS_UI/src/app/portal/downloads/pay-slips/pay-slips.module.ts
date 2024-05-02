import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PaySlipsRoutingModule } from './pay-slips-routing.module';
import { PaySlipsComponent } from './pay-slips/pay-slips.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { NgbAccordionModule, NgbDropdownModule, NgbModule, NgbTooltipModule } from '@ng-bootstrap/ng-bootstrap';
import { NgSelectModule } from '@ng-select/ng-select';
import { FlatpickrModule } from 'angularx-flatpickr';
import { SwiperModule } from 'ngx-swiper-wrapper';
import { DxButtonModule, DxDataGridModule, DxFileUploaderModule } from 'devextreme-angular';
import { UploadItrFileComponent } from './pay-slips/upload-itr-file/upload-itr-file.component';
import { ReactiveFormsModule } from '@angular/forms';
import { MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';
import { FilterService, GridModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';


@NgModule({
  declarations: [
    PaySlipsComponent,
    UploadItrFileComponent
  ],
  imports: [
    CommonModule,  
    ReactiveFormsModule,  
    SharedModule,
    NgbModule,  
    NgbDropdownModule,
    NgbAccordionModule,
    NgbTooltipModule,
    SwiperModule,
    NgSelectModule,
    FlatpickrModule,
    PaySlipsRoutingModule,
    DxDataGridModule,
    DxFileUploaderModule,
    DxButtonModule,
    GridModule,
    MultiSelectModule
  ],
  providers: [FilterService, PageService ,SortService]
})
export class PaySlipsModule { }
