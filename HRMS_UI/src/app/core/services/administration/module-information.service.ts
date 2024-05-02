import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../environments/environment';
import { map, filter } from 'rxjs/operators';

@Injectable()
export class ModuleInformationService {
    baseHttpUrl: string;
    constructor(
        private readonly http: HttpClient,
    ) {
        this.baseHttpUrl = `${environment.ApplicationUrl}ModuleInformation/`;
    }

    loadActiveModuleInformations(): Observable<any> {
        
        let apiUrl = this.baseHttpUrl + "LoadActiveModuleInformations";
        return this.http.get<any>(apiUrl)
            .pipe(map(moduleTree => {
                
                let data =  moduleTree;
                return data; 
            }));
    }

    loadModuleInformations(): Observable<any> {
        
        let apiUrl = this.baseHttpUrl + "LoadActiveModuleInformations";
        return this.http.get<any>(apiUrl)
            .pipe(map(moduleTree => {
                
                let data =  moduleTree;
                return data; 
            }));
    }   
}
