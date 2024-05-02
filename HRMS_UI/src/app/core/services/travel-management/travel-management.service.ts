import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Subject } from 'rxjs';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
import { EmpLeaveRequest } from '../../models/leave-management/emp-leave-request.model';

@Injectable({
    providedIn: 'root'
})
export class TravelManagementService {
    private travelplan = new BehaviorSubject<any>('');
    private approveTravelplan = new BehaviorSubject<any>('');

    public baseHttpUrl: any;
    constructor(private readonly http: HttpClient) {
        this.baseHttpUrl = environment.ApplicationUrl + 'TravelManagement/';
    }
    setTravelPlane(value: any) {
        this.travelplan.next(value);
    }

    getTravelPlane() {
        return this.travelplan.asObservable();
    }
    setApprovelTravelPlane(value: any) {
        this.approveTravelplan.next(value);
    }
    getApproveTravelPlane() {
        return this.approveTravelplan.asObservable();
    }
    // GetEmployeeTravelDetails
    getEmployeeTravelDetails(): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetEmployeeTravelDetails';
        return this.http.get<any>(apiUrl);
    }
    //FromLocation
    getFromLocationDetails(): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetFromLocationDetails';
        //var params = { employeeSLNo: employeeSLNo };
        return this.http.get<any>(apiUrl);
    }
    //ToLocation
    getToLocationDetails(): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetToLocationDetails';
        // var params = { BranchSlno: pbrnchslno };
        return this.http.get<any>(apiUrl);
        //return this.http.get<any>(apiUrl,{params});
    }
    //Employeewise Location
    getEmployeLocationDetails(employeeSLNo: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetEmployeeLocation';
        var params = { employeeSLNo: employeeSLNo };
        return this.http.get<any>(apiUrl, { params });
    }

    getMyTravels(employeeSlno: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetMyTravels';
        var params = { EmployeeSlno: employeeSlno };
        return this.http.get<any>(apiUrl, { params });
    }
    getEmployeeMappedBranches(employeeSlno: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetEmployeeMappedBranches';
        var params = { EmployeeSlno: employeeSlno };
        return this.http.get<any>(apiUrl, { params });
    }
    createVisitPlan(obj: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'CreateVisitPlan';
        return this.http.post(apiUrl, obj);
    }

    SaveBranchMappingDetails(obj: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'SaveBranchMappingDetails';
        return this.http.post(apiUrl, obj);
    }
    UpdateBranchMappingDetails(obj: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'UpdateBranchMappingDetails';
        return this.http.post(apiUrl, obj);
    }
    // GetEmployeeMappedBranchesDetails
    getEmployeeMappedBranchesDetails(employeeSlno: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetEmployeeMappedBranchesDetails';
        var params = { Employeeslno: employeeSlno };
        return this.http.get<any>(apiUrl, { params });
    }
    //DeleteBranchMappingDetails
    deleteEmployeeMappedBranchesDetails(recordID: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'DeleteBranchMapping';
        var params = { Record_id: recordID };
        return this.http.delete<any>(apiUrl, { params });
    }
    SaveVisitPlanDetails(obj: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'SaveVisitPlanDetails';
        return this.http.post(apiUrl, obj);
    }
    //my-travels GetApprovalVisitPlan
    getApprovalVisitPlan(employeeSlno: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetApprovalVisitPlan';
        var params = { Employeeslno: employeeSlno };
        return this.http.get<any>(apiUrl, { params });
    }
    //DeleteVisitPlanEmployeeByID
    deleteVisitEmployeeByID(travelID: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'DeleteVisitPlanEmployeeByID';
        var params = { TravelID: travelID };
        return this.http.delete<any>(apiUrl, { params });
    }
   // GetEmployeeTravelByTravelID
   getEmployeeTravelbyID(travelID: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetEmployeeTravelByTravelID';
    var params = { TravelID: travelID };
    return this.http.get<any>(apiUrl, { params });
    }
    //GetEmployeeApporvalTravelByID
    getEmployeeApporvalTravelByID(travelID: any,employeeSlno :any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetEmployeeApporvalTravelByID';
        var params = { TravelID: travelID ,EmployeeSlno: employeeSlno};
        return this.http.get<any>(apiUrl, { params });
    }
    //GetEmployeeToLocationByID
    getEmployeeToLocationByID(fromLocationid: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetEmployeeToLocationByID';
        var params = { FromLocationID: fromLocationid };
        return this.http.get<any>(apiUrl, { params });
    }
    //UpdateVisitPlanApproval
    updateVisitPlanApproval(obj: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'UpdateVisitPlanApproval';
        return this.http.post(apiUrl, obj);
    }
}

