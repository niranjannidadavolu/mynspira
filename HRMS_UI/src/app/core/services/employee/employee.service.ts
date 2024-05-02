import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable, Subject } from 'rxjs';
import { environment } from 'src/environments/environment';
import { BioMetric } from '../../models/attendance/bio-metric.model';
import { User } from '../../models/auth.models';
import { TokenStorageService } from '../helper';

@Injectable()

/**
 * Auth-service Component
 */
export class EmployeeService {






  loggedInUser: User;
  currentUserValue: any;
  public baseHttpUrl: any;
  private isDataUpdate = new Subject<boolean>();

  constructor(private readonly router: Router,
    private readonly http: HttpClient,
    private readonly tokenStorageService: TokenStorageService) {
    this.loggedInUser = {};
    this.baseHttpUrl = environment.ApplicationUrl + 'EmployeeInformation/';
  }
  sendUpdate(response: boolean) {
    this.isDataUpdate.next(response);
  }
  getUpdate(): Observable<boolean> {
    return this.isDataUpdate.asObservable();
  }
  getCheckEmployeeEligibility(): Observable<BioMetric[]> {
    return this.http.get<any>("assets/config/config.json");
  }
  getMyAttendance(employeeSlno: any): Observable<BioMetric[]> {
    const apiUrl = this.baseHttpUrl + 'GetEmployeeTimeSheet';
    var params = { employeeId: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }
  getTeamAttendance(employee: any): Observable<BioMetric[]> {
    const apiUrl = this.baseHttpUrl + 'GetReporteeTimeSheet';
    return this.http.post<any>(apiUrl, employee);
  }
  getMyprofile(employeeSlno: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetMyProfile';
    var params = { employeeSlno: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }

  getEmployeeProfile(employeeId: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetEmployeeProfile';
    var params = { employeeId: employeeId };
    return this.http.get<any>(apiUrl, { params });
  }
  getEmployeeHolidays(employeeId: any) {
    const apiUrl = this.baseHttpUrl + 'GetEmployeeHolidays';
    var params = { employeeId: employeeId };
    return this.http.get<any>(apiUrl, { params });
  }

  searchEmployees(searchCritera: any): Observable<any> {
    ////
    const apiUrl = this.baseHttpUrl + 'SearchEmployeeInformations';
    return this.http.post(apiUrl, searchCritera);
  }

  getMyTeamMembers(searchCritera: any): Observable<any> {
    ////
    const apiUrl = this.baseHttpUrl + 'GetMyTeamMembers';
    return this.http.post(apiUrl, searchCritera);
  }

  getEmployeeMinimumProfile(employeeSlno: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetEmployeeMinimumProfile';
    var params = { employeeSlno: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }

  GetUpdateEmployeeEmailAddressOtp(formData: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetUpdateEmployeeEmailAddressOtp';
    return this.http.post(apiUrl, formData);
  }
  VerifyUpdateEmployeeEmailAddressOtp(formData: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'VerifyUpdateEmployeeEmailAddressOtp';
    return this.http.post(apiUrl, formData);
  }
  UpdateEmployeePanDetails(formData: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UpdateEmployeePanDetails';
    return this.http.post(apiUrl, formData);
  }
  updateEmployeeFamilyDetails(formData: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UpdateEmployeeFamilyDetails';
    return this.http.post(apiUrl, formData);
  }

  updateEmployeeEducationDetails(formData: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UpdateEmployeeEducationDetails';
    return this.http.post(apiUrl, formData);
  }

  updateEmployeeExperienceDetails(formData: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UpdateEmployeeExperienceDetails';
    return this.http.post(apiUrl, formData);
  }


  getFamilyBloodRelationDetails(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetFamilyBloodRelationDetails';
    return this.http.get<any>(apiUrl, {});
  }

  getEducationDetails(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetEducationDetails';
    return this.http.get<any>(apiUrl, {});
  }

  getAdditionalQualification(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetAdditionalQualification';
    return this.http.get<any>(apiUrl, {});
  }

  getEducationCourseDetails(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetEducationCourseDetails';
    return this.http.get<any>(apiUrl, {});
  }
  // getEducationCourseDetails(slno:any): Observable<any>  {
  //   const apiUrl = this.baseHttpUrl + 'CourseFilter/'+slno;       
  //   return this.http.get<any>(apiUrl, { });
  // }

  getBloodGroup(): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetBloodGroup';
    return this.http.get<any>(apiUrl, {});
  }

  deleteSelectedFamilyMember(recordId: number): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'DeleteEmployeeFamilyDetails';
    var params = { empFamSlno: recordId };
    return this.http.delete<any>(apiUrl, { params });
  }

  deleteExceperienceDetails(recordId: number): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'DeleteEmployeeExperienceDetails';
    var params = { empExSlno: recordId };
    return this.http.delete<any>(apiUrl, { params });
  }

  deleteEducationDetails(recordId: number): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'DeleteEmployeeEducationDetails';
    var params = { empEduSlno: recordId };
    return this.http.delete<any>(apiUrl, { params });
  }
  updateEmployeePanDetails(formData: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'UpdateEmployeePanDetails';
    return this.http.post(apiUrl, formData);
  }
  updateEmployeePanStatus(filterObj: any) {
    const apiUrl = this.baseHttpUrl + 'UpdateEmployeePanStatus';
    return this.http.get<any>(apiUrl, filterObj);
  }

  getEmployeeReportingStructure(searchCriteria: any): any {
    const apiUrl = this.baseHttpUrl + 'GetEmployeeReportingStructure';
    return this.http.post(apiUrl, searchCriteria);
  }

  getEmployees(departmentId: any, designationId: any): any {
    const apiUrl = this.baseHttpUrl + 'GetEmployees';
    var params = { departmentId: departmentId, designationId: designationId };
    return this.http.get<any>(apiUrl, { params });
  }

  getEmployeeDetails(employeeId: any): any {
    throw new Error('Method not implemented.');
  }

  getEmployeesByBranch(selectedBranches: any) {
    const apiUrl = this.baseHttpUrl + 'GetEmployeesByBranch';
    return this.http.post<any>(apiUrl, selectedBranches);
  }
}

