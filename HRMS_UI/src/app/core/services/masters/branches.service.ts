import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class BranchesService {
  public baseHttpUrl: any;

  constructor(private readonly http: HttpClient) {
    this.baseHttpUrl = environment.ApplicationUrl + 'Branch/';

  }
  getAllBranches(): any {
    const apiUrl = this.baseHttpUrl + 'GetAllBranches';
    return this.http.get(apiUrl);
  }
  getHrBranches(employeeSLNo: any) {
    const apiUrl = this.baseHttpUrl + 'GetHRBranch';
    var params = { employeeSlno: employeeSLNo };
    return this.http.get<any>(apiUrl, { params });
  }
  GetBranchesByOfcType(object: any): any {
    const apiUrl = this.baseHttpUrl + 'GetBranchesByOfcType';
    var params = { officeTypeSlno: object.officeTypeSlno, employeeSlno: object.employeeSlno };
    return this.http.get(apiUrl, { params });
  }
  GetOfficeType() {
    const apiUrl = this.baseHttpUrl + 'GetOfficeType';
    return this.http.get(apiUrl);
  }
}
