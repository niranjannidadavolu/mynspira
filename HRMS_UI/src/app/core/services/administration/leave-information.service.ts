import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';

@Injectable({
    providedIn: 'root'
})


export class LeaveInformationService {
    public baseHttpUrl: any;
    constructor(private readonly http: HttpClient) {

        this.baseHttpUrl = environment.ApplicationUrl + 'LeaveInformation/';
    }

    getLeaveInformation(employeeSLNo?: any): Observable<any> {
        //var params = { employeeSLNo: employeeSLNo };
        const apiUrl = this.baseHttpUrl + 'GetLeaveInformation';
        return this.http.get<any>(apiUrl);
    }
    getALLLeaveInformation(): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetLeaveInformation';
        return this.http.get<any>(apiUrl);
    }
    savedLeaveInformation(formData: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'SavedLeaveInformation';
        return this.http.post(apiUrl, formData);
    }
    updateLeaveInformation(formData: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'UpdateLeaveInformation';
        return this.http.post(apiUrl, formData);
    }
    deleteLeaveInformation(leaveInformationId: any) {
        const apiUrl = this.baseHttpUrl + 'DeleteLeaveInformation';
        var params = { LeaveInformationID: leaveInformationId };
        return this.http.delete<any>(apiUrl, { params });
    }
    getLeaveTypeInformation(officeTypeSlno: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetLeaveInformationByOfc';
        var params = { officeTypeSlno: officeTypeSlno };
        return this.http.get<any>(apiUrl, { params });
    }
}