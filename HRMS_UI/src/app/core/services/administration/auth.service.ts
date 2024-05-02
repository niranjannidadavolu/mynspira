import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { UserInformation } from '../../models/administration/user-information.model';
import { User } from '../../models/auth.models';
import { EmployeeInformation } from '../../models/employee/employee-information.model';
import { TokenStorageService } from '../helper';

@Injectable({ providedIn: 'root' })

/**
 * Auth-service Component
 */
export class AuthenticationService {
    loggedInUser: User;
    currentUserValue: any;
    public baseHttpUrl: any;

    constructor(private readonly router: Router,
        private readonly http: HttpClient,
        private readonly tokenStorageService: TokenStorageService) {
        this.loggedInUser = {};
        this.baseHttpUrl = environment.ApplicationUrl + 'Authentication/';
    }
    login(loginInformation: any): Observable<UserInformation> {
        const apiUrl = this.baseHttpUrl + 'AuthenticateUser';
        return this.http.post(apiUrl, loginInformation)
            .pipe(map(data => {
                let user = data as UserInformation;
                this.tokenStorageService.saveToken(user.Token);
                return user;
            }));
    }

    autoLogin(userName: any): Observable<UserInformation> {
        const apiUrl = this.baseHttpUrl + 'ValidateAndAuthenticateUser';        
        var params = { userName: userName };
        return this.http.get<any>(apiUrl, { params })
        .pipe(map(data => {
            let user = data as UserInformation;
            this.tokenStorageService.saveToken(user.Token);
            return user;
        }));
    }
    validateRefreshToken(user: any): Observable<UserInformation> {
        const apiUrl = this.baseHttpUrl + 'AuthenticateRefreshToken';      
       let headers={
            headers: new HttpHeaders({
                'Content-Type': 'application/json'
            })
        }  
        return this.http.post(apiUrl, user,headers)
        .pipe(map(data => {
            let user = data as UserInformation;
            this.tokenStorageService.saveToken(user.Token);
            return user;
        }));
    }
    // getEmployeeProfile1(employeeSlno: any): Observable<any> {
    //     const apiUrl = this.baseHttpUrl + 'GetEmployeeProfile';       
    //     var params = { employeeSLNo: employeeSlno };
    //     return this.http.get(apiUrl, { params }).pipe(map(data => {
    //         return data;
    //     }));
    // }
}

