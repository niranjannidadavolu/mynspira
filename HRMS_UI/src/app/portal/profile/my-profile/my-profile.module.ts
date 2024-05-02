import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MyProfileRoutingModule } from './my-profile-routing.module';
import { MyProfileComponent } from './my-profile/my-profile.component';
import { NgbDropdownModule, NgbAccordionModule, NgbTooltipModule, NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { NgSelectModule } from '@ng-select/ng-select';
import { FlatpickrModule } from 'angularx-flatpickr';
import { SwiperModule } from 'ngx-swiper-wrapper';
import { SharedModule } from 'src/app/shared/shared.module';
import { DxDataGridModule, DxLoadIndicatorModule, DxSelectBoxModule, DxTextAreaModule, DxValidatorModule } from 'devextreme-angular';
import { ExperienceComponent } from './experience/experience.component';
import { FamilyComponent } from './family/family.component';
import { EducationComponent } from './education/education.component';
import { MyTeamMembersComponent } from './my-team-members/my-team-members.component';
import { TeamAttendanceComponent } from './team-attendance/team-attendance.component';
import { EmployeeProfileInfoComponent } from './employee-profile-info/employee-profile-info.component';
import { NomineeComponent } from './nominee/nominee.component';
import { EmployeeAssetsComponent } from './employee-assets/employee-assets.component';
import { EditService, FilterService, GridModule, PageService, SortService, ToolbarService } from '@syncfusion/ej2-angular-grids';
import { DropDownListAllModule, DropDownListModule, MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';
import { CheckBoxModule } from '@syncfusion/ej2-angular-buttons';
import { CreateExprienceComponent } from './experience/create-exprience/create-exprience.component';
import { CreateEducationDetailsComponent } from './education/create-education-details/create-education-details.component';

@NgModule({
  declarations: [
    MyProfileComponent,
    ExperienceComponent,
    FamilyComponent,
    EducationComponent,
    MyTeamMembersComponent,
    TeamAttendanceComponent,
    EmployeeProfileInfoComponent,
    NomineeComponent,
    EmployeeAssetsComponent,
    CreateExprienceComponent,
    CreateEducationDetailsComponent,
    
  ],
  imports: [
    CommonModule,    
    SharedModule,
    NgbModule,  
    NgbDropdownModule,
    NgbAccordionModule,
    NgbTooltipModule,
    SwiperModule,
    NgSelectModule,
    FlatpickrModule,
    DxDataGridModule,
    MyProfileRoutingModule,  
    DxDataGridModule,
    DxSelectBoxModule,
    DxLoadIndicatorModule,
    DxValidatorModule,
    DxTextAreaModule,
    ReactiveFormsModule,
    GridModule,
    MultiSelectModule,
    DropDownListModule ,
    CheckBoxModule ,
    DropDownListAllModule,
  ],
  providers: [EditService, FilterService,ToolbarService, SortService, PageService]
})
export class MyProfileModule { }
