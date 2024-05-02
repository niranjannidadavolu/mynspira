import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PortalSettingsRoutingModule } from './portal-settings-routing.module';
import { PortalSettingsComponent } from './portal-settings/portal-settings.component';


@NgModule({
  declarations: [
    PortalSettingsComponent
  ],
  imports: [
    CommonModule,
    PortalSettingsRoutingModule
  ]
})
export class PortalSettingsModule { }
