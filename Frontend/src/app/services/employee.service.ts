import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Employee } from '../models/employee.model';
import { catchError, map, tap } from 'rxjs/operators';
import { AEmployee } from '../models/aemployee.model';


@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  // private listEmployees: Employee[] = [
  //   {
  //     employeeId: 1001,
  //     fName: 'Omkar',
  //     lName: 'Jagtap',
  //     gender: 'Male',
  //     dateOfBirth: new Date('12/14/1998'),
  //     dateJoined: new Date('01/06/2021'),
  //     phone: 7387633292,
  //     email: 'jagtapomkar555@gmail.com',
  //     street: 'Alandi road',
  //     city: 'Pune',
  //     state: 'Maharashtra',
  //     zipCode: 411039,
  //     dName: 'Software Developers',
  //     position: 'Trainee SDE'

  //   },
  //   {
  //     employeeId: 1002,
  //     fName: 'Ronda',
  //     lName: 'Norona',
  //     gender: 'Female',
  //     dateOfBirth: new Date('1999/05/19'),
  //     dateJoined: new Date('2021-08-09'),
  //     phone: 9988776655,
  //     email: 'johncena99@gmail.com',
  //     street: 'Los Angeles',
  //     city: 'West Newbury',
  //     state: 'Massacuhusetts',
  //     zipCode: 12234,
  //     dName: 'Software Developers',
  //     position: 'Trainee SDE'

  //   },
  //   {
  //     employeeId: 1001,
  //     fName: 'Omkar',
  //     lName: 'Jagtap',
  //     gender: 'male',
  //     dateOfBirth: new Date('12/14/1998'),
  //     dateJoined: new Date('01/06/2021'),
  //     phone: 7387633292,
  //     email: 'jagtapomkar555@gmail.com',
  //     street: 'Alandi road',
  //     city: 'Pune',
  //     state: 'Maharashtra',
  //     zipCode: 411039,
  //     dName: 'Software Developers',
  //     position: 'Trainee SDE'

  //   },
  //   {
  //     employeeId: 1001,
  //     fName: 'Omkar',
  //     lName: 'Jagtap',
  //     gender: 'male',
  //     dateOfBirth: new Date('14/12/1998'),
  //     dateJoined: new Date('01/06/2021'),
  //     phone: 7387633292,
  //     email: 'jagtapomkar555@gmail.com',
  //     street: 'Alandi road',
  //     city: 'Pune',
  //     state: 'Maharashtra',
  //     zipCode: 411039,
  //     dName: 'Software Developers',
  //     position: 'Trainee SDE'

  //   },
  //   {
  //     employeeId: 1001,
  //     fName: 'Omkar',
  //     lName: 'Jagtap',
  //     gender: 'male',
  //     dateOfBirth: new Date('14/12/1998'),
  //     dateJoined: new Date('01/06/2021'),
  //     phone: 7387633292,
  //     email: 'jagtapomkar555@gmail.com',
  //     street: 'Alandi road',
  //     city: 'Pune',
  //     state: 'Maharashtra',
  //     zipCode: 411039,
  //     dName: 'Software Developers',
  //     position: 'Trainee SDE'

  //   },
  // ];

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    })
  };

  constructor(
    private httpClient: HttpClient
  ) { }

  getEmployees(): Observable<Employee[]> {
    return this.httpClient.get<Employee[]>("https://localhost:44345/api/Employees/GetEmployees")
  }

  getEmployee(id: any): Observable<Employee> {
    // return this.listEmployees.find(e => e.employeeId == id)
    //console.log(id)
    return this.httpClient.get<Employee>('https://localhost:44345/api/Employees/GetEmployeeById/' + id);
  }



  addEmployee(employee: AEmployee) {
    // this.listEmployees.push(employee);
    //console.log(employee);
    return this.httpClient.post<AEmployee>("https://localhost:44345/api/Employees/AddEmployee", employee, this.httpOptions)
      // .subscribe(
      //   (response) => console.log(response),
      //   (error) => console.log(error)
      // );
  }




  updateEmployee(employee: Employee) {

    //console.log(employee);
    return this.httpClient.put<Employee>("https://localhost:44345/api/Employees/UpdateEmployee", employee, this.httpOptions)
      // .subscribe(
      //   (response) => console.log(response),
      //   (error) => console.log(error)
      // );

  }

  deleteEmployee(id: number) {
    const deleteEmp = 'https://localhost:44345/api/Employees/DeleteEmployee/' + id;
    return this.httpClient.delete(deleteEmp, { responseType: 'text' });
  }

  getEmployeeByName(name: string): Observable<Employee[]> {
    // return this.listEmployees.find(e => e.employeeId == id)
    //console.log(id)
    return this.httpClient.get<Employee[]>('https://localhost:44345/api/Employees/GetEmployeeByName/' + name);
  }
}
