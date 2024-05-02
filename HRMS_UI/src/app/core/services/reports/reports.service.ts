import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ReportsService {
  
  public baseHttpUrl: any;

  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl = environment.ApplicationUrl + 'Reports/';
   }

   
   getLeaveReport(filterObj: any) {
    const apiUrl = this.baseHttpUrl + 'GetLeaveReport';
    // var params = { employeeSLNo: filter.employeeSLNo, pBranchSlno: filter.pBranchSlno, statusId: filter.statusId, fromDate: filter.fromDate, toDate: filter.toDate };
    return this.http.post<any>(apiUrl, filterObj);
  }

  getLeavesForHRApproval(filterObj: any) {
    const apiUrl = this.baseHttpUrl + 'GetLeavesForHRApproval';
    // var params = { employeeSLNo: filter.employeeSLNo, pBranchSlno: filter.pBranchSlno, statusId: filter.statusId, fromDate: filter.fromDate, toDate: filter.toDate };
    return this.http.post<any>(apiUrl, filterObj);
  }
  getAllLeavesReport(filterObj: any) {
    const apiUrl = this.baseHttpUrl + 'GetAllLeaves';
    // var params = { employeeSLNo: filter.employeeSLNo, pBranchSlno: filter.pBranchSlno, statusId: filter.statusId, fromDate: filter.fromDate, toDate: filter.toDate };
    return this.http.post<any>(apiUrl, filterObj);
  }
  getAutoApprovalReport(filterObj: any) {
    const apiUrl = this.baseHttpUrl + 'GetAutoApprovalReport';
    // var params = { employeeSLNo: filter.employeeSLNo, pBranchSlno: filter.pBranchSlno, statusId: filter.statusId, fromDate: filter.fromDate, toDate: filter.toDate };
    return this.http.post<any>(apiUrl, filterObj);
  }
  getLeaveTransactions(filterObj: any) {
    const apiUrl = this.baseHttpUrl + 'GetLeaveTransactions';
    return this.http.post<any>(apiUrl, filterObj);
  }
  getEmployeeVerificationReport(filterObj: any) {
    const apiUrl = this.baseHttpUrl + 'GetEmployeeVerificationReport';
    // var params = { employeeSLNo: filter.employeeSLNo, pBranchSlno: filter.pBranchSlno, statusId: filter.statusId, fromDate: filter.fromDate, toDate: filter.toDate };
    return this.http.post<any>(apiUrl, filterObj);
  }
  getEmployeeITRReport(filterObj: any) {
    const apiUrl = this.baseHttpUrl + 'GetEmployeeITRReport';
    return this.http.post<any>(apiUrl, filterObj);
  }
  getEmployeePanVerificationReport(filterObj: any) {
    const apiUrl = this.baseHttpUrl + 'GetEmployeePanVerificationReport';
    return this.http.post<any>(apiUrl, filterObj);
  }

  
}
