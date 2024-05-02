import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
import { catchError, map, retry } from 'rxjs/operators';
import { throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class HelpDocuments {
  public baseHttpUrl: any;
  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl = environment.ApplicationUrl + 'HelpDocuments/';
  }

  getHelpDocuments(OfficeTypeSlno: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetActiveHelpDocs';
    var params = { officeTypeSLNO: OfficeTypeSlno };
    return this.http.get<any>(apiUrl, { params });
  }

  downloadDocument(helpDocumnet: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'DownloadDocument';
    return this.http.post(apiUrl, helpDocumnet, { responseType: 'blob' });
  }
}
