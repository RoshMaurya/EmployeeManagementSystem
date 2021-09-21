import { Component, OnInit } from '@angular/core';
import { loginCredentials } from './models/loginCredentials.model';
import { LoginService } from './services/login.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

  title = 'EmployeeManagementSystem';
  user!:loginCredentials
  uservalue : boolean = false ;

  //isLoginVaild : boolean = true;

  constructor(private loginService : LoginService) {
    // this.user = this.loginService.userValue;
    // console.log(this.uservalue)
    // if(Object.keys(this.user).length === 0){
    //   this.uservalue = false;
    // }else{
    //   this.uservalue = true;
    // }
    // this.loginService.user.subscribe(res => {
    //   this.user = res;
    //   console.log(this.user); 
    // });
   }

  ngOnInit(): void {
    //this.isLoginVaild =  this.loginService.getLoginStatus();
    //console.log(this.isLoginVaild);
    
  }
}
