import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class RoleInformationService {



    private readonly baseHttpUrl: any;
    constructor(private http: HttpClient) {

        this.baseHttpUrl = environment.ApplicationUrl + 'RoleInformation/';
    }

    getAllActiveRoles(): any {
        const apiUrl = this.baseHttpUrl + 'GetAllActiveRoles';
        return this.http.get(apiUrl);
    }

    searchRoles(searchCritera: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'SearchRoles';
        return this.http.post(apiUrl, searchCritera);
    }

    deActivateRole(roleSlno: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'DeActivateRole';
        var params = { roleSlno: roleSlno };
        return this.http.get<any>(apiUrl, { params });
    }
    activateRole(roleSlno: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'ActivateRole';
        var params = { roleSlno: roleSlno };
        return this.http.get<any>(apiUrl, { params });
    }

    getRoleInformation(selectedRoleId: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'GetRoleInformation';
        var params = { roleSlno: selectedRoleId };
        return this.http.get<any>(apiUrl, { params });
    }

    saveRoleInformation(saveObject: any): Observable<any> {
        const apiUrl = this.baseHttpUrl + 'SaveRoleInformation';
        return this.http.post(apiUrl, saveObject);
    }
}
