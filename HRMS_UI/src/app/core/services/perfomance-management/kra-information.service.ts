import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';

@Injectable()
export class KraInformationService {


  public baseHttpUrl: any;
  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl = environment.ApplicationUrl + 'KraInformation/';
  }
  saveKraInformationDetails(params: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'SaveKRAInformation';
    return this.http.post(apiUrl, params);
  }
  getAllKraInformations(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetAllKRAInformations';
    return this.http.get<any>(apiUrl);
  }
  deleteKRAInformation(kraslno: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'DeleteKRAInformation';
    var params = { kraslno: kraslno };
    return this.http.delete<any>(apiUrl, { params });
  }
  getKraInformations(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetKraInformations';
    return this.http.get<any>(apiUrl);
  }

  checkForDuplicacy(value: any, kraslno: any): any {
    const apiUrl = this.baseHttpUrl + 'CheckDuplicateKra';
    var params = { kraslno: kraslno, kraName: value };
    return this.http.get<any>(apiUrl, {params});
  }

  getAllFinalInitiationReviews() {
    const apiUrl = this.baseHttpUrl + 'GetAllPendingInitiationReviews';
    return this.http.get<any>(apiUrl);
  }
  getAllPendingInitiationReviews() {
    const apiUrl = this.baseHttpUrl + 'GetAllFinalInitiationReviews';
    return this.http.get<any>(apiUrl);
  }

}
