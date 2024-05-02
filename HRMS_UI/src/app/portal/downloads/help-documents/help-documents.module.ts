import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HelpDocumentsRoutingModule } from './help-documents-routing.module';
import { HelpDocumentsComponent } from './help-documents/help-documents.component';

import { SharedModule } from 'src/app/shared/shared.module';
import { NgbAccordionModule, NgbDropdownModule, NgbModule, NgbTooltipModule } from '@ng-bootstrap/ng-bootstrap';
import { NgSelectModule } from '@ng-select/ng-select';
import { FlatpickrModule } from 'angularx-flatpickr';
import { SwiperModule } from 'ngx-swiper-wrapper';
import { PlayVideoComponent } from './help-documents/play-video/play-video.component';
import {VgCoreModule} from '@videogular/ngx-videogular/core';
import {VgControlsModule} from '@videogular/ngx-videogular/controls';
import {VgOverlayPlayModule} from '@videogular/ngx-videogular/overlay-play';
import {VgBufferingModule} from '@videogular/ngx-videogular/buffering';

@NgModule({
  declarations: [
    HelpDocumentsComponent,
    PlayVideoComponent
  ],
  imports: [
    CommonModule,
    HelpDocumentsRoutingModule,
    CommonModule,    
    SharedModule,
    NgbModule,  
    NgbDropdownModule,
    NgbAccordionModule,
    NgbTooltipModule,
    SwiperModule,
    NgSelectModule,
    FlatpickrModule,
    VgCoreModule,
    VgControlsModule,
    VgOverlayPlayModule,
    VgBufferingModule 
  ]
})
export class HelpDocumentsModule { }
