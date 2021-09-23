import { Injectable } from '@angular/core';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';

import { LoginService } from './login.service';

@Injectable({ providedIn: 'root' })
export class AuthGuard implements CanActivate {
    constructor(
        private router: Router,
        private loginService: LoginService
    ) { }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
        const user = this.loginService.userValue;
        if (Object.keys(user).length === 0) {
            // not logged in so redirect to login page with the return url
            this.router.navigate(['/login']);
            //console.log(false);
            return false;
        }
        // authorised so return true
        //console.log(user);
        return true;

    }
}