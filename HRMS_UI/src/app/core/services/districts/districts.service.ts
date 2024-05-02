import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { throwError } from 'rxjs';
import { Observable } from 'rxjs/internal/Observable';
import { catchError, retry } from 'rxjs/operators';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class DistrictsService {
  public baseHttpUrl: any;
   constructor(private readonly http: HttpClient) {
       
        this.baseHttpUrl = environment.ApplicationUrl + 'districts/';
    }

    getDistricts(stateSlNo:number): Observable<any> {

      const apiUrl = this.baseHttpUrl + 'GetDistricts?stateSlNo='+stateSlNo;
      return this.http.get(apiUrl).pipe(
        retry(1),
        catchError((error:HttpErrorResponse)=>{
          return throwError(error);
        })
      );  //, {params:queryParams}
          
    
    }
}
