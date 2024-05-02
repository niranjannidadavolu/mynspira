import { Injectable } from '@angular/core';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, CanActivateChild, UrlTree } from '@angular/router';
import { StorageService } from '../services/helper';

@Injectable({ providedIn: 'root' })
export class AuthGuard implements CanActivate, CanActivateChild {
    constructor(
        private readonly router: Router,
        private readonly storageService: StorageService) {
    }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
        let userData = this.storageService.get("LoggedInUser", 1);
        if (userData) {
            const currentUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
            if (currentUser) {
                return true;
        //       let screens =  this.setArray(currentUser.MappedScreens);              
        //       // if(screens.length){
        //          let check  =  screens.some((s: any) => s.ScreenRoute === state.url);
        //          if(check){                  
        //           return true;
        //          }else{
        // this.router.navigate(['/unauthorized']);
        //           return false;
        //          }
        //         // }
            }
        }
        //not logged in so redirect to login page with the return url
        this.router.navigate(['/account/login']);
        return false;
    }

    setArray(data: any){
        var flatArray: any = [];
        for (var index = 0; index < data.length; index++) {
            var main = data[index];
            if(main.SubItems.length){
             let subItem =  this.setArray(main.SubItems);
             for (let index = 0; index < subItem.length; index++) {
              const element = subItem[index];
              flatArray.push(element);
            }
                // for (var prop = 0; prop < main.SubItems.length; prop++) {
                //     var value = main.SubItems[prop];
                //     if (value.SubItems.length) {
                //       for (var i = 0; i < value.length; i++) {
                //     var child = value.SubItems[i];
                //     // if (child.SubItems.length) {
                //     // }else{
                //       flatArray.push(child);
                //     // }
                //       }
                //     }else{
                //       flatArray.push(value);
                //     }
                //   }
            }else{
            flatArray.push(main);
            }
        }
        return flatArray;
    }
    canActivateChild(childRoute: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
       return this.canActivate(childRoute, state) 
    }
}
