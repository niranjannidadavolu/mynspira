import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProjectsRoutingModule } from './projects-routing.module';
import { AddProjectComponent } from './add-project/add-project.component';
import { AssignResourceComponent } from './assign-resource/assign-resource.component';
import { ProjectsComponent } from '../projects/projects.component';


@NgModule({
  declarations: [
    AddProjectComponent,
    AssignResourceComponent,
    ProjectsComponent
  ],
  imports: [
    CommonModule,
    ProjectsRoutingModule
  ]
})
export class ProjectsModule { }
