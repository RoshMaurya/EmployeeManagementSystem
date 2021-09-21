import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { loginCredentials } from '../models/loginCredentials.model';
import { LoginService } from '../services/login.service';
import {Output, EventEmitter} from '@angular/core'

@Component({
  selector: 'app-admin-login',
  templateUrl: './admin-login.component.html',
  styleUrls: ['./admin-login.component.css']
})
export class AdminLoginComponent implements OnInit {

  credentials: loginCredentials = {
    EmployeeId: 0,
    Username: "",
    Password: null
  }
  username = "";

  isLoginValid: boolean = true;

  constructor(private router: Router, private loginService: LoginService) {
  }

  ngOnInit(): void {
  }

  onSubmit() {
    this.loginService.validateCredentials(this.credentials).subscribe(
      (response) => {
        this.username = response;
        // console.log(this.username);
        this.validateCredentials();
      },
      (error) => {
        this.displayError();
      }
    );
  }

  validateCredentials() {
    // console.log(this.credentials.Username);

    if (this.credentials.Username == this.username) {
      this.loginService.setLoginStatus(true);
      alert("Loged in");
      this.isLoginValid = true;
      this.router.navigate(['/nav/dashboard']);
    }
  }

  displayError() {
    alert("Invalid Credentials");
    location.reload();
  }
}
