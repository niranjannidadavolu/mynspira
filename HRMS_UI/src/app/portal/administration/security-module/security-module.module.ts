import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SecurityModuleRoutingModule } from './security-module-routing.module';
import { SecurityModuleComponent } from './security-module/security-module.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { DxCheckBoxModule, DxColorBoxModule, DxDataGridModule, DxListModule, DxPopoverModule, DxSelectBoxModule, DxSwitchModule, DxTabPanelModule, DxTemplateModule, DxTreeViewModule } from 'devextreme-angular';
import { SharedModule } from 'src/app/shared/shared.module';
import { ModuleInformationService, SecurityModuleService } from 'src/app/core/services';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    SecurityModuleComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    NgbModule,
    ReactiveFormsModule,
    FormsModule,
    DxDataGridModule,
    DxSwitchModule,
    DxPopoverModule,
    DxTemplateModule,
    DxColorBoxModule, DxTreeViewModule, DxSelectBoxModule, DxTabPanelModule, DxCheckBoxModule, DxListModule,
    SecurityModuleRoutingModule
  ],
  providers:[ModuleInformationService, SecurityModuleService  ]
})
export class SecurityModuleModule { }
