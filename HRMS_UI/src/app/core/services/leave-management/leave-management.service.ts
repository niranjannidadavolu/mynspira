import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
import { EmpLeaveRequest } from '../../models/leave-management/emp-leave-request.model';

@Injectable({
    providedIn: 'root'
})
export class LeaveManagementService {
 
    

    private isLeaveApply = new Subject<boolean>();
    private isCompOff_EarlyLogout_LeaveApply = new Subject<boolean>();

    public baseHttpUrl: any;
    constructor(private readonly http: HttpClient) {

        this.baseHttpUrl = environment.ApplicationUrl + 'LeaveManagement/';
    }
    getEmployeeLeaveBalance(employeeSLNo: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetEmployeeLeaveBalance';
        var params = { employeeSLNo: employeeSLNo };
        return this.http.get<any>(apiUrl, { params });
    }
    getMyLeaves(employeeSLNo: any, statusId: any, isDashBoard: any): Observable<any> {
        var params = { employeeSLNo: employeeSLNo, statusId: statusId, isDashBoard: isDashBoard };
        let apiUrl = this.baseHttpUrl + "GetEmployeeLeaves";
        return this.http.get<any>(apiUrl, { params });
    }

    getPendingLeaves(searchCriteria: any): any {
        const apiUrl = this.baseHttpUrl + 'GetLeavesWaitingForApproval'// + employee;
        return this.http.post<any>(apiUrl,searchCriteria);
    }

    getTeamLeaves(employee: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetTeamLeaves'// + employee;
        return this.http.post<any>(apiUrl,employee);
    }
    GetMyTeamEmployeeLeaves(employee: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetMyTeamEmployeeLeaves'// + employee;
        return this.http.post<any>(apiUrl,employee);
    }

    getUtilizedOnDuties(employeeSLNo: any): Observable<any> {
        var params = { employeeSLNo: employeeSLNo };
        let apiUrl = this.baseHttpUrl + "GetUtilizedOnDuties";
        return this.http.get<any>(apiUrl, { params });
    }

    getLeaveTypesByLeaveId(leaveId: number): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetEmpLeavesbyId';
        var params = { leaveId: leaveId };
        return this.http.get<any>(apiUrl, { params});
    }

    getLeaveDayTypes(): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetLeaveDayType';
        return this.http.get<any>(apiUrl);
    }

    applyLeave(empLeaveRequest: EmpLeaveRequest): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'SaveEmployeeLeave';
        return this.http.post(apiUrl, empLeaveRequest);
    }

    cancelEmpLeave(leaveId: any, updatedBy: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'CancelLeave';
        var params = { leaveId: leaveId ,updatedBy : updatedBy};
        return this.http.delete<any>(apiUrl, { params });
    }

    sendUpdate(isLeaveApply: boolean) { //the component that wants to update something, calls this fn
        this.isLeaveApply.next(isLeaveApply); //next() will feed the value in Subject
    }
    getUpdate(): Observable<boolean> { //the receiver component calls this function 
        return this.isLeaveApply.asObservable(); //it returns as an observable to which the receiver funtion will subscribe
    }
   
    approveLeave(leaveDetails: any) {
        const apiUrl = this.baseHttpUrl + 'UpdateEmployeeLeaveStatus';
        return this.http.post(apiUrl, leaveDetails);
    }
    rejectLeave(leaveDetails: any) {
        const apiUrl = this.baseHttpUrl + 'UpdateEmployeeLeaveStatus';
        return this.http.post(apiUrl, leaveDetails);
    }
    UpdateTeamLeaves(leaveDetails: any) {
        const apiUrl = this.baseHttpUrl + 'UpdateTeamLeaves';
        return this.http.post(apiUrl, leaveDetails);
    }

    updateTeamLeavesByHR(selectedLeaves: any): any {
        const apiUrl = this.baseHttpUrl + 'UpdateTeamLeavesByHR';
        return this.http.post(apiUrl, selectedLeaves);
      }

    getUpComingLeaves(employeeSlno: any) {
        const apiUrl = this.baseHttpUrl + 'GetManagerApprovalLeaves';
        let queryParams = new HttpParams();
        queryParams = queryParams.append("employeeSlno", employeeSlno);
        return this.http.get<any>(apiUrl, { params: queryParams });
    }

    getLeaveFiles(leaveId: number): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetEmpLeaveFiles';
        var params = { leaveId: leaveId };
        return this.http.get<any>(apiUrl, { params });
    }

    downloadFile(fileUrl: string): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'DownloadFile';
        let body = new HttpParams();
        body = body.set('fileUrl', fileUrl);
        return this.http.post(apiUrl, body, { responseType: 'blob' });;
    }

    getLeaveBalancesReport(searchCriteria: any): any {
        const apiUrl = this.baseHttpUrl + 'GetLeaveBalancesReport';
        return this.http.post<any>(apiUrl, searchCriteria);
      }
      getEmployeeLeaveReport(searchCriteria: any): any {
        const apiUrl = this.baseHttpUrl + 'GetEmployeeLeaveReport';
        return this.http.post<any>(apiUrl, searchCriteria);
      }
      getEmployeeLeaveEntitlementReport(searchCriteria: any): any {
        const apiUrl = this.baseHttpUrl + 'GetLeaveEntitlementReport';
        return this.http.post<any>(apiUrl, searchCriteria);
      }
}

