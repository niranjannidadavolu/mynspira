import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Observable } from 'rxjs/internal/Observable';
import { environment } from 'src/environments/environment';

@Injectable({
    providedIn: 'root'
})
export class LocationMasterService {
    


    public baseHttpUrl: any;
    constructor(private readonly http: HttpClient) {
        this.baseHttpUrl = environment.ApplicationUrl + 'LocationDetail/';
    }

    getTravelLocationDetails(searchCriteria: any) {
        const apiUrl = this.baseHttpUrl + 'GetTravelLocationDetails';
        return this.http.post(apiUrl, searchCriteria);
    }

    saveLocationDetails(locationDetail: any) {
        const apiUrl = this.baseHttpUrl + 'SaveLocationDetails';
        return this.http.post(apiUrl, locationDetail);
    }

    getTravelLocations(): any {
        const apiUrl = this.baseHttpUrl + 'GetTravelLocations';
        return this.http.get(apiUrl);
    }
}

