import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NgbNavModule, NgbAccordionModule, NgbPaginationModule } from '@ng-bootstrap/ng-bootstrap';

// Swiper Slider
import { SwiperModule } from 'ngx-swiper-wrapper';
import { SwiperConfigInterface } from 'ngx-swiper-wrapper';

// Counter
import { CountToModule } from 'angular-count-to';

import { BreadcrumbsComponent } from './breadcrumbs/breadcrumbs.component';
import { ClientLogoComponent } from './landing/client-logo/client-logo.component';
import { ServicesComponent } from './landing/services/services.component';
import { CollectionComponent } from './landing/collection/collection.component';
import { CtaComponent } from './landing/cta/cta.component';
import { DesignedComponent } from './landing/designed/designed.component';
import { PlanComponent } from './landing/plan/plan.component';
import { FaqsComponent } from './landing/faqs/faqs.component';
import { ReviewComponent } from './landing/review/review.component';
import { CounterComponent } from './landing/counter/counter.component';
import { WorkProcessComponent } from './landing/work-process/work-process.component';
import { TeamComponent } from './landing/team/team.component';
import { ContactComponent } from './landing/contact/contact.component';
import { FooterComponent } from './landing/footer/footer.component';
import { ScrollspyDirective } from './scrollspy.directive';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgSelectModule } from '@ng-select/ng-select';
import { NgOptionHighlightModule } from '@ng-select/ng-option-highlight';
import { Chapter6Component, HousePropertyIncomeComponent, HouseRentAllowanceComponent, InvestmentDetailsComponent, LoginFooterComponent, OtherIncomeComponent } from './app-components';
import { IndiaCurrencyPipe } from '../core/pipes/indian-currency-formatter.pipe';
import { EmployeeCardComponent } from './app-components/employee-card';
import { PendingBillsUploadComponent } from './app-components/re-imbursement';
import { DxDataGridModule, DxFileUploaderModule, DxTemplateModule, DxTooltipModule } from 'devextreme-angular';
import { LeaveTypesDashboardComponent } from './app-components/leave-management/leave-types-dashboard/leave-types-dashboard.component';
import { MyLeavesStatusComponent } from './app-components/leave-management/my-leaves-status/my-leaves-status.component';
import { PendingForApprovalComponent } from './app-components/leave-management/pending-for-approval/pending-for-approval.component';
import { TeamUpcomingLeavesComponent } from './app-components/leave-management/team-upcoming-leaves/team-upcoming-leaves.component';
import { FeatherModule } from 'angular-feather';
import { allIcons } from 'angular-feather/icons';
import { DashboardLeavesComponent } from './app-components/leave-management/dashboard-leaves/dashboard-leaves.component';
import { SwiperSliderComponent } from './app-components/swiper-slider/swiper-slider.component';
import { FileUploadComponent } from './app-components/file-upload/file-upload.component';
import { EmployeeHolidaysComponent } from './app-components/employee-holidays/employee-holidays.component';
import { FlatpickrModule } from 'angularx-flatpickr';
import { EmployeeEmailVerifyComponent } from './app-components/employee-email-verify/employee-email-verify.component';
import { NgxDocViewerModule } from 'ngx-doc-viewer';
import { VgCoreModule } from '@videogular/ngx-videogular/core';
import { VgControlsModule } from '@videogular/ngx-videogular/controls';
import { VgOverlayPlayModule } from '@videogular/ngx-videogular/overlay-play';
import { VgBufferingModule } from '@videogular/ngx-videogular/buffering';
import { PancardVerficationComponent } from './app-components/pancard-verfication/pancard-verfication.component';
import { AlphanumericDirective } from './directives/alphanumeric.directive';
import { UpperCaseInputDirective } from './directives/upper-case-input.directive';
import {
  PdfViewerModule, LinkAnnotationService, BookmarkViewService, MagnificationService, ThumbnailViewService,
  ToolbarService, NavigationService, TextSearchService, TextSelectionService, PrintService
} from '@syncfusion/ej2-angular-pdfviewer';
import { Section80GComponent } from './app-components/investment/section80G/section80G.component';
import { UploadChapter6ProofsComponent } from './app-components/investment/chapter6/upload-chapter6-proofs/upload-chapter6-proofs.component';
import { UploadHousePropertyIncomeComponent } from './app-components/investment/house-property-income/upload-house-property-income/upload-house-property-income.component';
import { UploadHouseRentAllowanceComponent } from './app-components/investment/house-rent-allowance/upload-house-rent-allowance/upload-house-rent-allowance.component';
import { UploadOtherIncomeProofComponent } from './app-components/investment/other-income/upload-other-income-proof/upload-other-income-proof.component';
import { UploadSection80GProofComponent } from './app-components/investment/section80G/upload-section80G-proof/upload-section80G-proof.component';
import { TeamLeavesForApprovalModule } from './app-components/leave-management/team-leaves-for-approval/team-leaves-for-approval.module';
import { WorkflowTrackerModule } from './app-components/workflow-tracker/workflow-tracker.module';
import { EmployeePersonalEmailVerifyComponent } from './app-components/employee-personal-email-verify/employee-personal-email-verify.component';
import { VideoPlayerComponent } from './app-components/video-player/video-player.component';
import { YoutubeVideoPlayerComponent } from './app-components/youtube-video-player/youtube-video-player.component';

const DEFAULT_SWIPER_CONFIG: SwiperConfigInterface = {
  direction: 'horizontal',
  slidesPerView: 'auto'
};

@NgModule({
  declarations: [
    BreadcrumbsComponent,
    ClientLogoComponent,
    ServicesComponent,
    CollectionComponent,
    CtaComponent,
    DesignedComponent,
    PlanComponent,
    FaqsComponent,
    ReviewComponent,
    CounterComponent,
    WorkProcessComponent,
    TeamComponent,
    ContactComponent,
    FooterComponent,
    ScrollspyDirective,
    EmployeeCardComponent,
    HouseRentAllowanceComponent,
    Chapter6Component,
    Section80GComponent,
    HousePropertyIncomeComponent,
    OtherIncomeComponent,
    InvestmentDetailsComponent,
    PendingBillsUploadComponent,
    LoginFooterComponent,
    LeaveTypesDashboardComponent,
    IndiaCurrencyPipe,
    MyLeavesStatusComponent,
    PendingForApprovalComponent,
    TeamUpcomingLeavesComponent,
    DashboardLeavesComponent,
    SwiperSliderComponent,
    FileUploadComponent,
    EmployeeHolidaysComponent,
    EmployeeEmailVerifyComponent,
    PancardVerficationComponent,

    //directives
    AlphanumericDirective,
    UpperCaseInputDirective,
    UploadChapter6ProofsComponent,
    UploadHousePropertyIncomeComponent,
    UploadHouseRentAllowanceComponent,
    UploadOtherIncomeProofComponent,
    UploadSection80GProofComponent,
    EmployeePersonalEmailVerifyComponent,
    VideoPlayerComponent,
    YoutubeVideoPlayerComponent,
  ],
  imports: [
    CommonModule,
    FeatherModule.pick(allIcons),
    NgbNavModule,
    NgbAccordionModule,
    SwiperModule,
    CountToModule,
    FormsModule,
    ReactiveFormsModule,
    NgSelectModule,
    NgOptionHighlightModule,
    NgbPaginationModule,
    DxDataGridModule,
    DxTooltipModule,
    DxTemplateModule,
    FlatpickrModule,
    NgxDocViewerModule,
    VgCoreModule,
    VgControlsModule,
    VgOverlayPlayModule,
    VgBufferingModule,
    PdfViewerModule,
    DxFileUploaderModule,
    TeamLeavesForApprovalModule,
    WorkflowTrackerModule,
  ],
  exports: [
    FlatpickrModule,
    HouseRentAllowanceComponent,
    Chapter6Component, HousePropertyIncomeComponent, OtherIncomeComponent, InvestmentDetailsComponent, Section80GComponent, EmployeeCardComponent,
    BreadcrumbsComponent, ClientLogoComponent, ServicesComponent, CollectionComponent, CtaComponent, DesignedComponent,
    PlanComponent, FaqsComponent, ReviewComponent, CounterComponent,
    WorkProcessComponent, TeamComponent, ContactComponent, FooterComponent, ScrollspyDirective,
    LoginFooterComponent, LeaveTypesDashboardComponent, MyLeavesStatusComponent,
    PendingForApprovalComponent, TeamUpcomingLeavesComponent, DashboardLeavesComponent, IndiaCurrencyPipe, FileUploadComponent, 
    AlphanumericDirective,
    UpperCaseInputDirective,
    UploadChapter6ProofsComponent,
    UploadHousePropertyIncomeComponent,
    UploadHouseRentAllowanceComponent,
    UploadOtherIncomeProofComponent,
    UploadSection80GProofComponent,
    VideoPlayerComponent,
    YoutubeVideoPlayerComponent
  ],
  providers: [LinkAnnotationService, BookmarkViewService, MagnificationService,
    ThumbnailViewService, ToolbarService, NavigationService, TextSearchService, TextSelectionService, PrintService]
})
export class SharedModule { }
