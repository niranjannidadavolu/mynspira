import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DocumentManagementRoutingModule } from './document-management-routing.module';
import { DxFileManagerModule } from 'devextreme-angular';
import { SharedModule } from 'src/app/shared/shared.module';


@NgModule({
  declarations: [
  ],
  imports: [    
    CommonModule,
    SharedModule,
    DocumentManagementRoutingModule,
    DxFileManagerModule
  ]
})
export class DocumentManagementModule { }
