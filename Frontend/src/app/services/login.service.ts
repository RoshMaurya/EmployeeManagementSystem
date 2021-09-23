import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { loginCredentials } from '../models/loginCredentials.model';
import { BehaviorSubject, Observable } from 'rxjs';
import { Router } from '@angular/router';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  private userSubject: BehaviorSubject<loginCredentials>;
  public user: Observable<loginCredentials>;

  constructor(private router: Router, private httpclient: HttpClient) {
    this.userSubject = new BehaviorSubject<loginCredentials>(JSON.parse(localStorage.getItem('user') || "{}"));
    this.user = this.userSubject.asObservable();
  }

  public get userValue(): loginCredentials {
    return this.userSubject.value;
  }

  login(username: string, password: string) {
    return this.httpclient.post<loginCredentials>('https://localhost:44345/api/Login', { username: username, password: password }).pipe(map(user => {
      // store user details and jwt token in local storage to keep user logged in between page refreshes
      localStorage.setItem('user', JSON.stringify(user));
      this.userSubject.next(user);
      return user;
    }));
  }

  logout() {
    // remove user from local storage and set current user to null
    localStorage.removeItem('user');
    this.router.navigate(['/login']);
  }
}