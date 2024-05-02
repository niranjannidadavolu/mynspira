import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
    providedIn: 'root'
})


export class DocumentManagementService {
    public baseHttpUrl: any;
    constructor(private readonly http: HttpClient) {

        this.baseHttpUrl = environment.ApplicationUrl + 'DocumentManagement/';
    }

    getAllFiles(folderName: any): any {
        const apiUrl = this.baseHttpUrl + 'GetAllFiles';
        var params = { folderName:  folderName};
        return this.http.get<any>(apiUrl, { params });
    }
    
    downloadFile(fileName: any): any {
        const apiUrl = this.baseHttpUrl + 'DownloadFiles';
        var params = { fileKey: fileName };
        const headers = new HttpHeaders({
            'Content-Type': 'application/octet-stream',
            'Accept': 'application/octet-stream'
            // 'Authorization': 'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJOU1A3MDAzMDA3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIwNTc5NGYwYy1jNDE5LTQ5MGMtYjM2Mi01YWI1NDViMWNjZDYiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy91cG4iOiJOU1A3MDAzMDA3IiwiZXhwIjoxNjg3Mzg2ODc0LCJpc3MiOiJodHRwczovL215bnNwaXJhLmluIiwiYXVkIjoiaHR0cHM6Ly9teW5zcGlyYS5pbiJ9.upEBASbVlFB74iRJJltupWGsfBEIy5IgF-CPQRoc7gA'
          });
        return this.http.get(apiUrl, {
            headers: headers,
            params: params,
            responseType: 'arraybuffer'
          })
        // return this.http.get<any>(apiUrl, { params });
    }
}