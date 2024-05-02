import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class StatesService {
  public baseHttpUrl: any;
   constructor(private readonly http: HttpClient) {
       
        this.baseHttpUrl = environment.ApplicationUrl + 'states/';
    }

    getStates(): Observable<any> {

      const apiUrl = this.baseHttpUrl + 'GetStates';
      let queryParams = new HttpParams();
      //queryParams = queryParams.append("page",1);
      return this.http.get(apiUrl); //, {params:queryParams}
          
    
    }
}
