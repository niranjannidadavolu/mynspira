import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class SiteNotificationsService {

  public baseHttpUrl: any;
  constructor(private readonly http: HttpClient) {

    this.baseHttpUrl = environment.ApplicationUrl + 'SiteNotification/';
  }
  getNotificationMessage(officeTypeSlno: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetSiteNotifications';
    var params = { officeTypeSlno: officeTypeSlno };
    return this.http.get<any>(apiUrl, { params });
  }
  sendFeedback(objRequest: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'SaveEmployeeFeedback';
    return this.http.post(apiUrl, objRequest);
  }
}
