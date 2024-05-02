import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
    providedIn: 'root'
})
export class AssignBranchesService {



    public baseHttpUrl: any;
    constructor(private readonly http: HttpClient) {
        this.baseHttpUrl = environment.ApplicationUrl + 'AssignBranch/';
    }

    getAllEmployeeBranchMappings(): any {
        const apiUrl = this.baseHttpUrl + 'GetAllEmployeeBranchMappings';
        return this.http.get(apiUrl);
    }

    getEmployeeBranchMappings(employeeId: any) {
        const apiUrl = this.baseHttpUrl + 'GetEmployeeBranchMappings';
        var params = { employeeId: employeeId };
        return this.http.get(apiUrl, { params });
    }
}

