import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs/internal/Observable";
import { environment } from "src/environments/environment";

@Injectable()
export class ManagerPerformanceEvaluationService {
  public baseHttpUrl: any;
  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl =
      environment.ApplicationUrl + "ManagerPerformanceEvaluation/";
  }
  GetAssignedDepartmentInformations(employeeSlno: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + "GetMyAssignedDepartments";
    let params = { employeeSlno: employeeSlno };
    return this.http.get<any>(apiUrl, { params });
  }
}
