import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
@Injectable()
export class AssignKraService {


  public baseHttpUrl: any;

  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl = environment.ApplicationUrl + 'AssignKRA/';
  }

  getAssignedKpiInformations(departmentId: any, designationId: any): any {
    const apiUrl = this.baseHttpUrl + 'GetAssignedKpiInformations';
    var params = { departmentId: departmentId, designationId: designationId };
    return this.http.get<any>(apiUrl, { params });
  }

  assignKraInformation(data: any): any {
    const apiUrl = this.baseHttpUrl + 'AssignKraInformation';
    return this.http.post(apiUrl, data);
  }

  getAssignedKpiInformationsOfDesignation(designationId: any): any {
    const apiUrl = this.baseHttpUrl + 'GetAssignedKpiInformationsOfDesignation';
    var params = { designationId: designationId };
    return this.http.get<any>(apiUrl, { params });
  }

  getAssignedKpiInformationsForEmployee(employeeSlno: any): any {
    const apiUrl = this.baseHttpUrl + 'GetAssignedKpiInformationsForEmployee';
    var params = { employeeSlno: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }

  assignKraKpiInformation(departmentId: any, designationId: any, createdBy: any, isDraft: any, keyPerformanceIndices: any): any {
    const apiUrl = this.baseHttpUrl + 'AssignKpiInformations';
    var params = { createdBy: createdBy, isDraft: isDraft };
    return this.http.post(apiUrl, keyPerformanceIndices, { params });
  }

  assignKraKpiInformationToEmployee(data: any): any {
    const apiUrl = this.baseHttpUrl + 'AssignKraInformationToEmployee';
    return this.http.post(apiUrl, data);
  }

}
