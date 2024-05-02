import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';


@Injectable({
  providedIn: 'root'
})
export class MandalsService {
  public baseHttpUrl: any;
   constructor(private readonly http: HttpClient) {
       
        this.baseHttpUrl = environment.ApplicationUrl + 'mandals/';
    }

    getMandals(districtSlNo:number): Observable<any> {
      const apiUrl = this.baseHttpUrl + 'GetMandals';
      var params = { districtSlNo: districtSlNo };
      return this.http.get<any>(apiUrl, { params });
    }
}
