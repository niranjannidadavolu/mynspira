import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';


@Injectable()

/**
 * Auth-service Component
 */
export class EmployeeVerificationService {
  baseHttpUrl: string;

  constructor(
    private readonly http: HttpClient,) {
    this.baseHttpUrl = environment.ApplicationUrl + 'EmployeeVerification/';
  }
  saveEmployeeVerifiedData(data: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'SaveEmployeeVerifiedData';
    var params = { idempotencyId: data.idempotency_id, employeeSlno: data.employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }
  getVerifiedResult(idempotencyId: any, employeeSlno: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetVerifiedResult';
    var params = { idempotencyId: idempotencyId, employeeSlno: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }
  updateEmpployeeVerificationStatus(filterObj: any) {
    const apiUrl = this.baseHttpUrl + 'UpdateEmployeeVerificationStatus';
    return this.http.put<any>(apiUrl, filterObj);
  }
}