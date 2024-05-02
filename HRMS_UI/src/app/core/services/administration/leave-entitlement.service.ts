import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class LeaveEntitlementService {

  public baseHttpUrl: any;
  constructor(private readonly http: HttpClient) {

    this.baseHttpUrl = environment.ApplicationUrl + 'LeaveEntitlement/';
  }
  getLeaveEntitlement(filterObject: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetLeaveEntitlement';
    return this.http.post(apiUrl, filterObject);
  }
  UpdateLeaveEntitlement(formData: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UpdateLeaveEntitlement';
    return this.http.post(apiUrl, formData);
  }  
  SaveLeaveEntitlement(formData: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'SaveLeaveEntitlement';
    return this.http.post(apiUrl, formData);
  }   
  deleteLeaveEntitlement(object: any): Observable<any>{
    const apiUrl = this.baseHttpUrl + 'DeleteLeaveEntitlement';
        return this.http.post(apiUrl, object);
  }
}
