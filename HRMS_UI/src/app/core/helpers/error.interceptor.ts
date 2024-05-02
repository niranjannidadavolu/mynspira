import { StorageService } from 'src/app/core/services';
import { Router } from '@angular/router';
import { Injectable } from '@angular/core';
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import Swal from 'sweetalert2';
import { AuthenticationService } from '../services/administration/auth.service';

@Injectable()
export class ErrorInterceptor implements HttpInterceptor {

    constructor(private authenticationService: AuthenticationService, private router: Router,
        private readonly storageService: StorageService,
    ) { }

    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        return next.handle(request).pipe(catchError(err => {
            if (err.status === 401) {

                // auto logout if 401 response returned from api
                // this.authenticationService.logout();
                // location.reload();

                sessionStorage.clear();
                localStorage.clear();
                this.router.navigate(['/account/login']);
                // let user = this.storageService.get('LoggedInUser', 1);
                // this.authenticationService.validateRefreshToken(user).subscribe(data => {
                //     if (!data) {
                //         this.storageService.save("LoggedInUser", JSON.stringify(data), 1);
                //     } else {
                //         sessionStorage.clear();
                //         localStorage.clear();
                //         this.router.navigate(['/account/login']);
                //     }
                // });
            }
            if (err.status === 400 && err.error.hasOwnProperty('ErrorCode')) {
                Swal.fire({
                    title: err.error.Title,
                    text: err.error.Message,
                    icon: 'warning',
                    confirmButtonColor: 'rgb(54, 69, 116)',
                    confirmButtonText: 'Ok'
                });
            }
            const error = err.error.message || err.statusText;
            return throwError(error);
        }))
    }
}
