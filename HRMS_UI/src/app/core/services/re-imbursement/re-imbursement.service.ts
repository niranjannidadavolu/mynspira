import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { throwError } from 'rxjs';
import { Observable } from 'rxjs/internal/Observable';
import { catchError, retry } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { UploadReimbursement } from '../../models/re-imbursement/upload-re-imbursement.model';
import { StorageService } from '../helper/storage-service';

@Injectable({
  providedIn: 'root'
})
export class ReimbursementService {
  


  public baseHttpUrl: any;

  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl = environment.ApplicationUrl + 'reimbursement/';
  }

  getApprovedBills(employeeSlno: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetApprovedBills';
    var params = { employeeNumber: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }

  getPendingBills(employeeSlno: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetPendingBills';
    var params = { employeeNumber: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }

  deleteReimbursementBill(recordId: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'DeleteReimbursementBill';
    var params = { reimbursementId: recordId };
    return this.http.get<any>(apiUrl, { params });
  }

  uploadReimbursementDetails(uploadReimbursementDetails: UploadReimbursement): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UploadReimbursement';
    return this.http.post(apiUrl, uploadReimbursementDetails)
      .pipe(
        //retry(1),
        catchError((error: HttpErrorResponse) => {
          return throwError(error);
        })
      );
  }
  downloadFile(fileUrl: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'DownloadFile';
    let body = new HttpParams();
    body = body.set('fileUrl', fileUrl);
    return  this.http.post(apiUrl, body,{responseType: 'blob'});;
  }

}
