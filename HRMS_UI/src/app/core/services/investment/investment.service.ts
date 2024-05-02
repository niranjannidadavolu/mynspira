import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
import { catchError, map, retry } from 'rxjs/operators';
import { throwError } from 'rxjs';
import { InvestmentDeclaration } from '../../models/investments/investmentDeclaration.models';

@Injectable({
  providedIn: 'root'
})
export class InvestmentService {
  
  public baseHttpUrl: any;
  constructor(private readonly http: HttpClient) {

    this.baseHttpUrl = environment.ApplicationUrl + 'investment/';
  }

  getAssesseeTypeDetails(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetAssesmentTypes';
    return this.http.get(apiUrl).pipe(
      retry(1),
      catchError((error: HttpErrorResponse) => {
        return throwError(error);
      })
    );
  }

  getHraLocations(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetHRALocations';
    return this.http.get(apiUrl).pipe(
      retry(1),
      catchError((error: HttpErrorResponse) => {
        return throwError(error);
      })
    );
  }
  getInvestmentDetails(finSLNo: number, employeeSLNo: number): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetInvestmentDeclaration';
    let queryParams = new HttpParams();
    queryParams = queryParams.append("finSLNo", finSLNo);
    queryParams = queryParams.append("employeeSLNo", employeeSLNo)
    return this.http.get(apiUrl, { params: queryParams }).pipe(
      retry(1),
      catchError((error: HttpErrorResponse) => {
        return throwError(error);
      })
    );  //, {params:queryParams}
  }

  saveInvestmentDeclarations(investmentDeclaration: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'SaveInvestmentDeclarations';
    return this.http.post(apiUrl, investmentDeclaration);
  }
  
  getIncomeTaxPaymentDetails(employeeSLNo: number): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetIncomeTaxPaymentDetails';
    let queryParams = new HttpParams();
    queryParams = queryParams.append("employeeSLNo", employeeSLNo)
    return this.http.get(apiUrl, { params: queryParams });
  }

  getChapter6Files(chapter6DetailId: any): any {
    const apiUrl = this.baseHttpUrl + 'GetChapter6Files';
    let queryParams = new HttpParams();
    queryParams = queryParams.append("Chapter6DetailId", chapter6DetailId)
    return this.http.get(apiUrl, { params: queryParams });
  }
  
}

