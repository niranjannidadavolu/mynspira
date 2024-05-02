import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MyDocumentsRoutingModule } from './my-documents-routing.module';
import { SharedModule } from 'src/app/shared/shared.module';
import { DxFileManagerModule } from 'devextreme-angular';
import { MyDocumentsComponent } from './my-documents.component';
import { DocumentManagementService } from 'src/app/core/services';


@NgModule({
  declarations: [
    MyDocumentsComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    MyDocumentsRoutingModule,
    DxFileManagerModule
  ],
  providers:[
    DocumentManagementService
  ]
})
export class MyDocumentsModule { }
