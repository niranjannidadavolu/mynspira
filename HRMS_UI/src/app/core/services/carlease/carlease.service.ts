import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { throwError } from 'rxjs';
import { Observable } from 'rxjs/internal/Observable';
import { catchError, retry } from 'rxjs/operators';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CarLeaseService {

  public baseHttpUrl: any;
  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl = environment.ApplicationUrl + 'CarLease/';
  }

  getApprovedBills(employeeSlno: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetCarLeaseMaintenanceBalance';
    var params = { empSLNo: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }

  getPendingBills(empSLNo: number): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetCarLeaseMaintenancePendingBills';
    var params = { empSLNo: empSLNo };
    return this.http.get<any>(apiUrl, { params });
  }

  getCarLeaseBillNames(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetCarLeaseBillNames';
    let queryParams = new HttpParams();
    return this.http.get(apiUrl, { params: queryParams }).pipe(
      catchError((error: HttpErrorResponse) => {
        return throwError(error);
      })
    );
  }

  UploadCarLeaseMaintenance(formData: FormData): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UploadCarLeaseMaintenance';
    return this.http.post(apiUrl, formData);
  }


  getCarLeaseAgreementBills(employeeSlno: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetCarLeaseAgreementBills';
    var params = { employeeSLNo: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }

  uploadAgreementBills(agreementDetails: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UploadCarLeaseAgreementBill';
    return this.http.post(apiUrl, agreementDetails);      
  }

  deleteMaintenenceBill(recordId: number): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'deleteMaintenenceBill';
    var params = { recordId: recordId };
    return this.http.delete<any>(apiUrl, { params });
  }

  
  downloadFile(fileUrl: string): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'DownloadFile';
    let body = new HttpParams();
    body = body.set('fileUrl', fileUrl);
    return  this.http.post(apiUrl, body,{responseType: 'blob'});;
  }

}
