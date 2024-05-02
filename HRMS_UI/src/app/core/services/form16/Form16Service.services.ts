import { HttpClient, HttpParams,HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
import { catchError, retry } from 'rxjs/operators';
import { throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class Form16Service{
  public baseHttpUrl: any;
   constructor(private readonly http: HttpClient) {       
        this.baseHttpUrl = environment.ApplicationUrl + 'Form16/';
    }

    downLoadForm16(taxDocument: any) : Observable<any> {
      const apiUrl = this.baseHttpUrl + 'downLoadForm16';
      return this.http.post(apiUrl, taxDocument,{responseType: 'blob'});
    }
    
    getForm16(panNumber: any) : Observable<any> {
      const apiUrl = this.baseHttpUrl + 'GetForm16';
        var params = { panNo: panNumber };
        return this.http.get<any>(apiUrl, { params });
    }

    updateItrUploads(chapter6FileDetails: any): Observable<any> {
      const apiUrl = this.baseHttpUrl + 'UpdateItrUploads';
      return this.http.post(apiUrl, chapter6FileDetails);
    }
    getMyITRFiles(employeeSlno: any) : Observable<any> {
      const apiUrl = this.baseHttpUrl + 'GetMyITRDetails';
        var params = { EmployeeSlno: employeeSlno };
        return this.http.get<any>(apiUrl, { params });
    }
    updateITRApprovalStatus(filterObj: any) {
      const apiUrl = this.baseHttpUrl + 'UpdateITRApprovalStatus';
      return this.http.put<any>(apiUrl, filterObj);
    }
}
