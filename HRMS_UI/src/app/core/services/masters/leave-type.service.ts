import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';


@Injectable()
export class LeaveTypeService {
  public baseHttpUrl: any;
  constructor(private readonly http: HttpClient) {

    this.baseHttpUrl = environment.ApplicationUrl + 'LeaveType/';
  }

  getAssignedLeaveTypes(employeeSLNo: any) {
    const apiUrl = this.baseHttpUrl + 'GetAssignedLeaveTypes';
    var params = { employeeSlno: employeeSLNo };
    return this.http.get<any>(apiUrl, { params });
  }
  getAllLeaveTypes() {
    const apiUrl = this.baseHttpUrl + 'GetLeaveTypes';
    return this.http.get<any>(apiUrl);
  }
}
