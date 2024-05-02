import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from '../../models/auth.models';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';

@Injectable()
export class ErrorLogService {
    private readonly baseHttpUrl: any;
    constructor(private http: HttpClient) {

        this.baseHttpUrl = environment.ApplicationUrl + 'LogFile/';
    }
   getAllLogs(): any {
        const apiUrl = this.baseHttpUrl + 'GetLogFiles';
        return this.http.get<any>(apiUrl);
    }
      download(fileUrl: string) { 
        return this.http.get(`${this.baseHttpUrl}DownloadLogFile?fileUrl=${fileUrl}`, {
          reportProgress: true,
          observe: 'events',
          responseType: 'blob'
        }); 
      }
}
