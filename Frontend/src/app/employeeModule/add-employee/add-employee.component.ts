import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { EmployeeService } from '../../services/employee.service';
import { Employee } from '../../models/employee.model';


@Component({
  selector: 'app-add-employee',
  templateUrl: './add-employee.component.html',
  styleUrls: ['./add-employee.component.css']
})
export class AddEmployeeComponent implements OnInit {

  Title: string = "Enter Details";

  // id: number = 0;
  // firstname: string = " ";
  // lastname: string = " ";
  // gender: string = " ";
  // DOB: Date = new Date("Dec 2 1998");
  // DOJ = new Date("Dec 2 1998");
  // email: string = " ";
  // phone: number = 0;
  // street: string =  "";
  // city:  string =  "";
  // state:  string =  "";
  // zipCode:  number =  0;
  // Job_title: string = " ";
  // employee!: Employee;

 
  employee : Employee = {
    employeeId: 0,
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
    this.employeeservice.addEmployee(this.employee);

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
