import { Injectable } from '@angular/core';
import { User } from '../models/auth.models';

@Injectable({ providedIn: 'root' })

/**
 * Auth-service Component
 */
export class BaseService {

    loggedInUser: User;
    currentUserValue: any;
    public baseHttpUrl: any;
    constructor() {
        this.loggedInUser = {};
     }
}

