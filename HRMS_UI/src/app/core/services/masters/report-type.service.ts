import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ReportTypeService {

  public baseHttpUrl: any;
  constructor(private readonly http: HttpClient) {

    this.baseHttpUrl = environment.ApplicationUrl + 'AttendanceReportType/';
  }

  GetAttendanceReportTypes() {
    const apiUrl = this.baseHttpUrl + 'GetAttendanceReportTypes';
    return this.http.get<any>(apiUrl);
  }

}
