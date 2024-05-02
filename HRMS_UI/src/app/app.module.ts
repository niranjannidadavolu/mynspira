import { APP_INITIALIZER, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { LayoutsModule } from "./layouts/layouts.module";
// import { PagesModule } from "./pages/pages.module";

// Auth            /
import { HttpClientModule, HttpClient, HTTP_INTERCEPTORS } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FakeBackendInterceptor } from './core/helpers/fake-backend';
import { ErrorInterceptor } from './core/helpers/error.interceptor';
import { JwtInterceptor } from './core/helpers/jwt.interceptor';

// Language
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { TranslateModule, TranslateLoader } from '@ngx-translate/core';


import { NgIdleKeepaliveModule } from '@ng-idle/keepalive'; // this includes the core NgIdleModule but includes keepalive providers for easy wireup
import { MomentModule } from 'angular2-moment'; // optional, provides moment-style pipes for date formatting 
import { LoaderInterceptor } from './core/helpers/loader.interceptor';
import { LoadingComponent } from './shared/loading/loading.component';
import { SignalrService } from './core/hub/signalr.service';
import { DataService } from './core/services/helper/data-service';
import { ToastrModule } from 'ngx-toastr';
import { AuthenticationService, EmployeeService } from './core/services';
import { LeaveDayTypeService, LeaveTypeService } from './core/services/masters';
import { DatePipe } from '@angular/common';
import { NgSelectModule } from '@ng-select/ng-select';
import { FlatpickrDefaults } from 'angularx-flatpickr';
import { FilterService, GridModule, PageService, SortService } from '@syncfusion/ej2-angular-grids';
import { MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';

import { loadCldr, setCulture, setCurrencyCode, L10n } from '@syncfusion/ej2-base';

import * as numbers from "cldr-data/main/en-in/numbers.json";
import * as currencies from "cldr-data/main/en-in/currencies.json";
import * as detimeZoneNames from "cldr-data/main/en-in/dateFields.json";
import * as timeZoneNames from "cldr-data/main/en-in/timeZoneNames.json";
import * as caTimeZoneNames from "cldr-data/main/en-in/ca-gregorian.json";

export function createTranslateLoader(http: HttpClient): any {
  return new TranslateHttpLoader(http, 'assets/i18n/', '.json');
}

@NgModule({
  declarations: [
    AppComponent,
    LoadingComponent
  ],
  imports: [
    NgIdleKeepaliveModule.forRoot(),
    MomentModule,
    TranslateModule.forRoot({
      defaultLanguage: 'en',
      loader: {
        provide: TranslateLoader,
        useFactory: (createTranslateLoader),
        deps: [HttpClient]
      }
    }),
    BrowserAnimationsModule,
    HttpClientModule,
    BrowserModule,
    AppRoutingModule,
    LayoutsModule,
    NgSelectModule,
    // PagesModule,
    ToastrModule.forRoot({
      timeOut: 3500,
      preventDuplicates: true,
    }),
    GridModule,
    MultiSelectModule
  ],
  providers: [
    AuthenticationService,
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: FakeBackendInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: LoaderInterceptor, multi: true },
    SignalrService,
    DataService,
    EmployeeService,
    LeaveTypeService,
    LeaveDayTypeService,
    DatePipe,
    FlatpickrDefaults,
    FilterService, PageService, SortService
    // {
    //   provide: APP_INITIALIZER, useClass: SignalrService, multi: true },
  ],
  bootstrap: [AppComponent]
})
export class AppModule {

  constructor() {
    loadCldr(numbers, currencies, detimeZoneNames, timeZoneNames, caTimeZoneNames);
    setCulture('en-IN');
    setCurrencyCode('INR');
  }
}
