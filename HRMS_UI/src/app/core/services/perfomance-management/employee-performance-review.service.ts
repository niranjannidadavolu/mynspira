import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

import { environment } from 'src/environments/environment';
@Injectable()
export class EmployeePerformanceReviewService {

  public baseHttpUrl: any;
  maxScore: any;

  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl =
      environment.ApplicationUrl + "EmployeePerformanceReview/";
  }

  getEmployeeReviewInformations(employeeSlno: any) {
    const apiUrl = this.baseHttpUrl + "GetEmployeeReviewInformations";
    var params = { employeeSlno: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }
  getEmployeePendingReviewDetails(reviewId: any) {
    const apiUrl = this.baseHttpUrl + "GetEmployeePendingReviewDetails";
    var params = { reviewId: reviewId };
    return this.http.get<any>(apiUrl, { params });
  }
  getEmployeeNonSubmittedDetails(managerId: any) {
    const apiUrl = this.baseHttpUrl + "GetEmployeeNonSubmittedDetails";
    var params = { managerId: managerId };
    return this.http.get<any>(apiUrl, { params });
  }
  getEmployeeReviewInformation(kraInformationId: any) {
   
    const apiUrl = this.baseHttpUrl + "GetEmployeeReviewInformation";
    var params = { kraInformationId: kraInformationId };
    return this.http.get<any>(apiUrl, { params });
  }

  getPendingReviewInformations(employeeSlno: any, reviewerType: any) {
   
    const apiUrl = this.baseHttpUrl + "GetPendingReviewInformations";
    var params = { employeeSlno: employeeSlno, reviewerType:  reviewerType};
    return this.http.get<any>(apiUrl, { params });
  }

  getEmployeeFinalReviewInformations(employeeSlno: any) {
    const apiUrl = this.baseHttpUrl + "GetEmployeeFinalReviewInformations";
    var params = { employeeSlno: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }

  getAppraiserPendingReviewInformations(employeeSlno: any) {
    const apiUrl = this.baseHttpUrl + "GetAppraiserPendingReviewInformations";
    var params = { employeeSlno: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }

  saveEmployeePerformanceReview(kraInformation: any, reviewerType: any): any {
    const apiUrl = this.baseHttpUrl + 'SaveEmployeePerformanceReview';
    var params = { reviewerType: reviewerType };
    return this.http.post(apiUrl, kraInformation, { params });
  }
}