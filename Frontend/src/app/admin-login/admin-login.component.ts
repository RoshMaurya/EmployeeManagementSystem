import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { loginCredentials } from '../models/loginCredentials.model';
import { LoginService } from '../services/login.service';
import {Output, EventEmitter} from '@angular/core'
import { isNull } from '@angular/compiler/src/output/output_ast';
import { isEmpty } from 'rxjs/operators';

@Component({
  selector: 'app-admin-login',
  templateUrl: './admin-login.component.html',
  styleUrls: ['./admin-login.component.css']
})
export class AdminLoginComponent implements OnInit {

  credentials: loginCredentials = {
    EmployeeId: 0,
    Username: "",
    Password: ""
  }
  loading = false;
  username = "";

  //isLoginValid: boolean = true;

  constructor(private router: Router, private loginService: LoginService) {
    
  }

  ngOnInit(){
    this.loginService.logout();
  }

  onSubmit() {
    this.loading = true;
    this.loginService.login(this.credentials.Username,this.credentials.Password).subscribe(
      (response) => {
        // console.log(this.username);
        this.router.navigate(['nav/dashboard']);
      },
      (error) => {
        this.displayError();
      }
    );
  }  
  displayError() {
    alert("Invalid Credentials");
    location.reload();
  }

  // validateCredentials() {
  //   // console.log(this.credentials.Username);

  //   if (this.credentials.Username == this.username) {
  //     this.loginService.setLoginStatus(true);
  //     alert("Loged in");
  //     this.isLoginValid = true;
  //     this.router.navigate(['/nav/dashboard']);
  //   }
  // }

  
}
