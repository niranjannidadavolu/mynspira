import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
import { EmpLeaveRequest } from '../../models/leave-management/emp-leave-request.model';

@Injectable({
    providedIn: 'root'
})


export class LeavePolicyService {
    public baseHttpUrl: any;
    constructor(private readonly http: HttpClient) {

        this.baseHttpUrl = environment.ApplicationUrl + 'LeavePolicyInformation/';
    }

    getLeavePloicyInformation(): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetLeavePolicyInformation';
        return this.http.get<any>(apiUrl);
    }

    updateLeavePolicyInformation(formData: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'UpdateLeavePolicyInformation';
        return this.http.post(apiUrl, formData);
    }

    saveLeavePolicyInformation(formData: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'SaveLeavePolicyInformation';
        return this.http.post(apiUrl, formData);
    }
    deleteLeavePolicyInformation(policyId: any) {
        const apiUrl = this.baseHttpUrl + 'DeleteLeavePolicyInformation';
        var params = { PolicyID: policyId };
        return this.http.delete<any>(apiUrl, { params });
    }

}