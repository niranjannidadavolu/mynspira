import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';

@Injectable()
export class KpiInformationService {


  public baseHttpUrl: any;
  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl = environment.ApplicationUrl + 'KpiInformation/';
  }

  

  getAllKpiInformations(): any {
    const apiUrl = this.baseHttpUrl + 'GetAllKpiInformations';
    return this.http.get<any>(apiUrl);
  }

  saveKpiinfromation(formData: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'SaveKPIInformation';
    return this.http.post(apiUrl, formData);
  }
  getKpinfromation(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetKPIInformation';
    return this.http.get<any>(apiUrl);
  }
  deleteKpiInformation(kpislno: any): any {
    const apiUrl = this.baseHttpUrl + 'DeleteKpiInformation';
    var params = { kpiId: kpislno };
    return this.http.delete<any>(apiUrl, { params });
  }

  checkForDuplicacy(kpiName: any, kpiId: any): any {
    const apiUrl = this.baseHttpUrl + 'CheckDuplicateKpi';
    var params = { kpiId: kpiId, kpiName: kpiName };
    return this.http.get<any>(apiUrl, { params });
  }
}
