import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from '../../models/auth.models';
import { environment } from 'src/environments/environment';

@Injectable({ providedIn: 'root' })
export class UserInformationService {
   



    private readonly baseHttpUrl: any;
    constructor(private http: HttpClient) {

        this.baseHttpUrl = environment.ApplicationUrl + 'UserInformation/';
    }

    deActivateUser(employeeSlno: any) {
        const apiUrl = this.baseHttpUrl + 'DeActivateUser';
        var params = { employeeSlno: employeeSlno };
        return this.http.get<any>(apiUrl, { params });
    }
    activateUser(employeeSlno: any) {
        const apiUrl = this.baseHttpUrl + 'ActivateUser';
        var params = { employeeSlno: employeeSlno };
        return this.http.get<any>(apiUrl, { params });
    }

    getAll() {
        return this.http.get<User[]>(`api/users`);
    }

    getAllActiveUsers(): any {
        const apiUrl = this.baseHttpUrl + 'GetAllActiveUsers';
        return this.http.get<any>(apiUrl);
    }

    register(user: User) {
        return this.http.post(`/users/register`, user);
    }

    changePassword(userInformation: any) {
        const apiUrl = this.baseHttpUrl + 'ChangePassword';
        return this.http.post(apiUrl, userInformation);
    }


    getOtp(userName: any) {
        const apiUrl = this.baseHttpUrl + 'GetOtp';
        var params = { userName: userName };
        return this.http.get<any>(apiUrl, { params });
    }

    validateOtp(userName: any, otpValue: any) {
        const apiUrl = this.baseHttpUrl + 'ValidateOtp';
        var params = { userName: userName, otpValue: otpValue };
        return this.http.get<any>(apiUrl, { params });
    }

    forgotPassword(userInformation: any) {
        const apiUrl = this.baseHttpUrl + 'ForgotPassword';
        return this.http.post(apiUrl, userInformation);
    }

    signUpUser(userName: any) {
        const apiUrl = this.baseHttpUrl + 'SignUp';
        var params = { userName: userName };
        return this.http.get<any>(apiUrl, { params });
    }

    saveAndUpdateUserInformation(userInformation: any): any {
        const apiUrl = this.baseHttpUrl + 'SaveOrUpdateUser';
        return this.http.post(apiUrl, userInformation);
    }

    getMappedRoles(selectedUserId: any): any {
        const apiUrl = this.baseHttpUrl + 'GetMappedRoles';
        var params = { employeeSlno: selectedUserId };
        return this.http.get<any>(apiUrl, { params });
      }
}
