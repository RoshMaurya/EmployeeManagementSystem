import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { loginCredentials } from '../models/loginCredentials.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  isLoginValid  = false;

  constructor(private httpclient: HttpClient) { }

  validateCredentials(credentials: loginCredentials){
    return this.httpclient.post('https://localhost:44345/api/Login', credentials, { responseType: 'text' })   
  }

  setLoginStatus(isLoginValid : boolean){
      this.isLoginValid = isLoginValid;
      // console.log(isLoginValid);
  }

  getLoginStatus() : boolean{return this.isLoginValid} 
}
