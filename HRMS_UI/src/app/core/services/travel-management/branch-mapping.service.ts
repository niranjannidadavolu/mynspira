import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';

@Injectable({
    providedIn: 'root'
})
export class BranchMappingService {



    public baseHttpUrl: any;
    constructor(private readonly http: HttpClient) {
        this.baseHttpUrl = environment.ApplicationUrl + 'BranchMapping/';
    }

    getTravelLocationDetails(searchCriteria: any) {
        const apiUrl = this.baseHttpUrl + 'GetTravelLocationDetails';
        return this.http.post(apiUrl, searchCriteria);
    }
    loadAllBranchMappings() {
        
        const apiUrl = this.baseHttpUrl + 'LoadAllBranchMappings';
        return this.http.get(apiUrl);
    }
    saveLocationDetails(locationDetail: any) {
        const apiUrl = this.baseHttpUrl + 'SaveLocationDetails';
        return this.http.post(apiUrl, locationDetail);
    }

    getBranchMappings(fromLocationId: any): any {
        
        const apiUrl = this.baseHttpUrl + 'GetMappedLocationsByLocationId';
        var params = { fromLocationId: fromLocationId };
        return this.http.get(apiUrl, { params });
    }

    saveBranchMappings(branchMappingData: any): any {
        const apiUrl = this.baseHttpUrl + 'SaveBranchMappings';
        return this.http.post(apiUrl, branchMappingData);
    }
}

