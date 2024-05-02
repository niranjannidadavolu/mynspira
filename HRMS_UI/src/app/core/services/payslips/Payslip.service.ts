import { HttpClient, HttpParams,HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
import { catchError, retry } from 'rxjs/operators';
import { throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PayslipService{
  public baseHttpUrl: any;
   constructor(private readonly http: HttpClient) {       
        this.baseHttpUrl = environment.ApplicationUrl + 'Payslips/';
    }
    getMyPaySlips(employeeSlno:any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetEmployeePaylips?employeeSlno='+ employeeSlno;
        return this.http.get(apiUrl).pipe(
          retry(1),
          catchError((error:HttpErrorResponse)=>{
            return throwError(error);
          })
        ); 
      }

   downloadPayslip(employeeSlno: any):Observable<Blob> 
    {
      return this.http.get(this.baseHttpUrl + 'DownloadPaySlip?employeeSlno='+ employeeSlno, { responseType: 'blob' }).pipe(
        retry(1),
        catchError((error:HttpErrorResponse)=>{
          return throwError(error);
        })
      );
    }
}
