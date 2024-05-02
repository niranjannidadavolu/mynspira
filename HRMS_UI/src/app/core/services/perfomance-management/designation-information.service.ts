import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
@Injectable({
  providedIn: 'root'
})
export class DesignationInformationService {

  public baseHttpUrl: any;

  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl = environment.ApplicationUrl + 'DesignationInformation/';
  }

  GetDesignationInformations(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetDesignationInformations';
    return this.http.get<any>(apiUrl);
  }

  getDesignationsByDepartment(departmentSlno: any): any {
    const apiUrl = this.baseHttpUrl + 'GetDesignationInformationsByDepartment';
    let params = { departmentSlno: departmentSlno };
    return this.http.get<any>(apiUrl, { params });
  }

}
