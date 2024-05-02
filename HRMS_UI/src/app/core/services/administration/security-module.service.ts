import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../environments/environment';
import { map } from 'rxjs/operators';

@Injectable()
export class SecurityModuleService {
    
    baseHttpUrl: string;
    constructor(
        private readonly http: HttpClient,
    ) {
        this.baseHttpUrl = `${environment.ApplicationUrl}SecurityModule/`;
    }

    loadRoleLevelAccessPermisssions(): Observable<any> {
        
        let apiUrl = this.baseHttpUrl + "LoadRoleLevelAccessPermisssions";
        return this.http.get<any>(apiUrl)
            .pipe(map(moduleTree => {
                
                let data =  moduleTree;
                return data; 
            }));
    }
    SavePermissions(userRolePermission: any): any {
        let apiUrl = this.baseHttpUrl + "SavePermissions";
        return this.http.post<any>(apiUrl, userRolePermission)
            .pipe(map(user => { return user; }));
    }
    LoadMappedPermissions(roleId: any): any {
        
        var params = { roleId: roleId };
        let apiUrl = this.baseHttpUrl + "LoadMappedPermissions";
        return this.http.get<any>(apiUrl, { params }).pipe(map(Data => { return Data; }));
    }   
}
