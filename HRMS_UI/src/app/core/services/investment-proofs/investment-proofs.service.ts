import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class InvestmentProofsService {


  public baseHttpUrl: any;
  private isInvestmentProofRequest = new Subject<boolean>();

  constructor(private readonly http: HttpClient) {

    this.baseHttpUrl = environment.ApplicationUrl + 'InvestmentProofs/';
  }

  InvestmentFilesCommon(apiUrl: string, params: any): Observable<any> {
    return this.http.get<any>(apiUrl, { params });
  }
  getChapt6Files(chapter6DetailId: number): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetChapter6Files';
    var params = { chapter6DetailId: chapter6DetailId };
    return this.http.get<any>(apiUrl, { params });
  }

  getHouseIncomeFiles(houseIncomeDetailId: number): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetHouseIncomeFiles';
    var params = { houseIncomeDetailId: houseIncomeDetailId };
    return this.http.get<any>(apiUrl, { params });
  }

  getHouseRentAllowancFiles(rentPaymentId: number): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetHouseRentAllowancFiles';
    var params = { rentPaymentId: rentPaymentId };
    return this.http.get<any>(apiUrl, { params });
  }

  getOtherIncomeFiles(otherIncomeDetailId: number): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetOtherIncomeFiles';
    var params = { otherIncomeDetailId: otherIncomeDetailId };
    return this.http.get<any>(apiUrl, { params });
  }
  getSection80GFiles(TDS80GSLNO: number): any {
    const apiUrl = this.baseHttpUrl + 'GetSection80GFiles';
    var params = { TDS80GSLNO: TDS80GSLNO };
    return this.http.get<any>(apiUrl, { params });
  }
  uploadHraFile(hraFileDetails: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UploadHouseRentAllowanceFile';
    return this.http.post(apiUrl, hraFileDetails);
  }
  uploadChapter6File(chapter6FileDetails: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UploadChapter6File';
    return this.http.post(apiUrl, chapter6FileDetails);
  }

  uploadHouseIncomeFile(houseIncomeFile: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UploadHouseIncomeFile';
    return this.http.post(apiUrl, houseIncomeFile);
  }
  uploadOtherIncomeFile(otherIncomeDetails: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UploadOtherIncomeFile';
    return this.http.post(apiUrl, otherIncomeDetails);
  }
  uploadSection80GFile(section80GFile: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UploadSection80GFile';
    return this.http.post(apiUrl, section80GFile);
  }
  removeHouseRentAllowanceFile(fileId: number) {
    const apiUrl = this.baseHttpUrl + 'RemoveHouseRentAllowanceFile';
    var params = { hraFileId: fileId };
    return this.http.get<any>(apiUrl, { params });
  }
  removeChapt6File(fileId: number) {
    const apiUrl = this.baseHttpUrl + 'RemoveChapter6File';
    var params = { chapter6FileId: fileId };
    return this.http.get<any>(apiUrl, { params });
  }

  removeHouseIncomeFile(fileId: number) {
    const apiUrl = this.baseHttpUrl + 'RemoveHouseIncomeFile';
    var params = { houseIncomeFileId: fileId };
    return this.http.get<any>(apiUrl, { params });
  }

  removeOtherIncomeFile(fileId: number) {
    const apiUrl = this.baseHttpUrl + 'RemoveOtherIncomeFile';
    var params = { otherIncomeFileId: fileId };
    return this.http.get<any>(apiUrl, { params });
  }

  saveInvestmentDeclarations(investmentDeclaration: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'SaveInvestmentDeclarations';
    return this.http.post(apiUrl, investmentDeclaration);
  }

  downloadFile(fileUrl: string): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'DownloadFile';
    let body = new HttpParams();
    body = body.set('fileUrl', fileUrl);
    return this.http.post(apiUrl, body, { responseType: 'blob' });;
  }

  sendRefreshRquest(isRefreshRequest: boolean) { //the component that wants to update something, calls this fn
    this.isInvestmentProofRequest.next(isRefreshRequest); //next() will feed the value in Subject
  }
  getRefreshRequest(): Observable<boolean> { //the receiver component calls this function 
    return this.isInvestmentProofRequest.asObservable(); //it returns as an observable to which the receiver funtion will subscribe
  }

  verifyPanNumber(hraId: any, panNumber: any) {
    const apiUrl = this.baseHttpUrl + 'VerifyPanNumber';
    var params = { hraId: hraId, panNumber: panNumber };
    return this.http.get<any>(apiUrl, { params });
  }

}

