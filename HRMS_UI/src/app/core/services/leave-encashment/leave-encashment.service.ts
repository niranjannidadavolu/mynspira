import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';

@Injectable({
    providedIn: 'root'
})
export class LeaveEncashmentService {
    
    public baseHttpUrl: any;
    constructor(private readonly http: HttpClient) {

        this.baseHttpUrl = environment.ApplicationUrl + 'LeaveEncashment/';
    }
    getLeaveEncashment(employeeSLNo: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetLeaveEncashment';
        var params = { employeeSlno: employeeSLNo };
        return this.http.get<any>(apiUrl, { params });
    }
    getLeaveEncashmentApproval(employeeSLNo: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetLeavesEncashmentApproval';
        var params = { employeeSlno: employeeSLNo };
        return this.http.get<any>(apiUrl, { params });
    }
    getTdsAmount(obj: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetEmployeeTDSAmountDetails';
        return this.http.post(apiUrl, obj);
    }
    applyLeaveEncashment(obj: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'SaveLeaveEncashment';
        return this.http.post(apiUrl, obj);
    }
    updateLeaveEncashment(obj: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'UpdateEmployeeEncashmentStatus';
        return this.http.post(apiUrl, obj);
    }
    cancelEncashment(obj: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'DeleteLeaveEncashment';
       
        return this.http.post(apiUrl, obj);
    }
}