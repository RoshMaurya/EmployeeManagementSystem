import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal, ModalDismissReasons, NgbModalOptions } from '@ng-bootstrap/ng-bootstrap';
import { EmployeeService } from '../../services/employee.service';
import { Employee } from '../../models/employee.model';
import { LoginService } from '../../services/login.service';

@Component({
  selector: 'app-list-employees',
  templateUrl: './list-employees.component.html',
  styleUrls: ['./list-employees.component.css']
})
export class ListEmployeesComponent implements OnInit {

  employees: Employee[] = [];
  nameOfEmployeeToDelete = '';
  employee! : Employee;

  constructor(
    private _employeeService: EmployeeService,
    private modalService: NgbModal,
    private _router : Router,
    private _loginService : LoginService
  ) { }

  ngOnInit(): void {
    this._employeeService.getEmployees().subscribe(res => {
      this.employees = res;
    });
  }

  // delete modal call

  opendeleteModal(deletModal: any, id: number, name: string) {
    this.nameOfEmployeeToDelete = name;
    const modalRef = this.modalService.open(deletModal).result.then(() => {
      this.deleteEmployee(id);
    }, (reason) => {
      console.log(reason);
    });
  }


  deleteEmployee(id: number) {
    // this._employeeService.deleteEmployee(id);
    console.log(id);
    this._employeeService.deleteEmployee(id).subscribe(data => {console.log(data)});
    location.reload();
  }

  //view Modal call

  openViewModal(viewModal: any, employee : Employee) {
    this.employee = employee;
    const modalRef = this.modalService.open(viewModal, {size : 'lg'}).result.then(() => {
      console.log(employee);
    }, (reason) => {
      console.log(reason);
    });
  }

  //edit employee method

  editEmployee(employee : Employee){
    this.employee = employee;
    this._router.navigate(['/nav/editEmployee', this.employee.employeeId])
  }

  //serach
  search(event: any){
    //this.nameOfEmployeeToDelete = event.target.value;
    console.log(event.target.value)
    if(event.target.value ===''){
      location.reload();
    }else{
      this._employeeService.getEmployeeByName(event.target.value).subscribe(res => {
        this.employees = res;
        //console.log(this.employees);
        //console.log(this._loginService.getUserStatus()); 
      });
    }
  } 
}
