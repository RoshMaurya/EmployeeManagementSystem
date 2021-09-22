import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { EmployeeService } from '../../services/employee.service';
import { Employee } from '../../models/employee.model';
import { AEmployee } from 'src/app/models/aemployee.model';


@Component({
  selector: 'app-add-employee',
  templateUrl: './add-employee.component.html',
  styleUrls: ['./add-employee.component.css']
})
export class AddEmployeeComponent implements OnInit {

  Title: string = "Enter Details";
  errormsg! : string ;
  employee : AEmployee = {
    fName: "",
    lName: "",
    gender: "",
    dateOfBirth: new Date("Dec 2 1998"),
    dateJoined: new Date("Dec 2 1998"),
    email: "",
    phone: "0",
    street: "",
    city: "",
    state: "",
    zipCode: "0",
    code: "",
  }

  profileForm!: FormGroup;
  // Services injected in constructor
  constructor(private employeeservice: EmployeeService, private router: Router) {
  }
  // Method to save an employee
  saveEmployee() {
    this.employeeservice.addEmployee(this.employee)
    .subscribe(
      (response) => console.log(response),
      (error) => {
        console.log(error);
        console.log(error.error.text)
        console.log(error.status)
        switch ( error.status ){
          case 200:if(error.error.text.indexOf('Sucessfully') !== -1){
                      alert(error.error.text);
                    }
                    break;
          case 400: if(error.error.indexOf('Violation of UNIQUE KEY') !== -1){
                      alert("Entered Email Address is already present in the system");
                    } 
                    else{
                      alert(error.error);
                    } 
                    break;       
        }
      }
    );;

    this.router.navigate(['/nav/employees']);
  }


  ngOnInit(): void {
    this.profileForm = new FormGroup({
      Name: new FormControl('', [Validators.required, Validators.minLength(4)]),
      Email: new FormControl('', [Validators.required,]),
      DOB: new FormControl('', [Validators.required,]),
      Mobile: new FormControl('', [Validators.required, Validators.maxLength(10)]),
      City: new FormControl('', [Validators.required,]),
      State: new FormControl('', [Validators.required,]),
      Pincode: new FormControl('', [Validators.required, Validators.maxLength(6)]),
      Gender: new FormControl('', [Validators.required,]),
      Favlan: new FormControl('', [Validators.required,])
    });
  }


}
