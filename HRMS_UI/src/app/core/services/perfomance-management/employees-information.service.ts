import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';
@Injectable({
  providedIn: 'root'
})
export class EmployeesInformationService {

  public baseHttpUrl: any;

  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl = environment.ApplicationUrl + 'EmployeeInformation/';
  }
  GetAllEmployeesByDesignationAndDepartment(data: any): Observable<any> {
    const apiUrl = this.baseHttpUrl + 'GetAllEmployees';
    var params = { Departments: data.selectedDepartments, Designations: data.selectedDesignations };
    return this.http.get<any>(apiUrl, { params });
  }
}
