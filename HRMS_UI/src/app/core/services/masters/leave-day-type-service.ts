import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';


@Injectable()
export class LeaveDayTypeService {
  public baseHttpUrl: any;
   constructor(private readonly http: HttpClient) {
       
        this.baseHttpUrl = environment.ApplicationUrl + 'LeaveDayType/';
    }

    getLeaveDayTypes(): any {
      const apiUrl = this.baseHttpUrl + 'GetLeaveDayTypes';
      return this.http.get(apiUrl);
  }
}
