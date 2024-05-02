import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
@Injectable({
  providedIn: 'root'
})
export class FrequencyInformationService {
  public baseHttpUrl: any;

  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl = environment.ApplicationUrl + 'FrequencyInformation/';
  }
  
  getFrequencies(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'LoadAllFrequencies';
    return this.http.get<any>(apiUrl);
  }

}
