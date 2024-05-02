import { Injectable } from '@angular/core';
import {
    HttpRequest,
    HttpHandler,
    HttpEvent,
    HttpInterceptor,
} from '@angular/common/http';
import { Observable } from 'rxjs';
import { StorageService } from '../services/helper';
import { switchMap } from 'rxjs/operators';
import { AuthenticationService } from '../services';

@Injectable()
export class JwtInterceptor implements HttpInterceptor {
    constructor(private readonly storageService: StorageService, private authenticationService: AuthenticationService) {

    }

    intercept(
        request: HttpRequest<any>,
        next: HttpHandler
    ): Observable<HttpEvent<any>> {
        //
        let userData = this.storageService.get("LoggedInUser", 1);
        const clientDate = new Date(); // Replace with code to get the client-side date.
        // clientDate.setDate(clientDate.getDate() - 1)
        if (userData) {
            let currentUser = JSON.parse(userData);
            if (currentUser && currentUser.Token) { // && !this.isTokenExpired(currentUser.Token)
                request = request.clone({
                    setHeaders: {
                        Authorization: `Bearer ${currentUser.Token}`,
                        'X-Client-Date': clientDate.toISOString()
                    },
                });
                return next.handle(request);
            }
            // else{
            //     let user = this.storageService.get('LoggedInUser', 1);
            //     return this.authenticationService.validateRefreshToken(user).pipe(
            //                 switchMap((newToken: any) => {
            //                     //console.log(newToken);

            //                   const authRequest = request.clone({
            //                     setHeaders: {
            //                       Authorization: `Bearer ${newToken.Token}`
            //                     }
            //                   });
            //                   return next.handle(authRequest);
            //                 })
            //               );
            // }
        }
        return next.handle(request);
    }
    private isTokenExpired(token: string): boolean {
        const decodedToken = this.decodeToken(token);

        const now = Date.now() / 1000;
        return decodedToken.exp < now;
    }
    decodeToken(token: string): any {
        const base64Url = token.split('.')[1];
        const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
        const jsonPayload = decodeURIComponent(atob(base64).split('').map((c: string) => `%${('00' + c.charCodeAt(0).toString(16)).slice(-2)}`).join(''));

        return JSON.parse(jsonPayload);
    }
}
