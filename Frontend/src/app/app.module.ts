import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import {HttpClientModule} from '@angular/common/http';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {NgxChartsModule} from '@swimlane/ngx-charts';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AdminLoginComponent } from './admin-login/admin-login.component';
import { ListEmployeesComponent } from './employeeModule/list-employees/list-employees.component';
import { EmployeeService } from './services/employee.service';
import { AddEmployeeComponent } from './employeeModule/add-employee/add-employee.component';
import { EditEmployeeComponent } from './employeeModule/edit-employee/edit-employee.component';
import { NavbarComponent } from './navbar/navbar.component';
import { AddEmptoprojectComponent } from './projectModule/add-emptoproject/add-emptoproject.component';
import { AddProjectComponent } from './projectModule/add-project/add-project.component';
import { EditProjectComponent } from './projectModule/edit-project/edit-project.component';
import { ListProjectsComponent } from './projectModule/list-projects/list-projects.component';

@NgModule({
  declarations: [
    AppComponent,
    DashboardComponent,
    AdminLoginComponent,
    ListEmployeesComponent,
    AddEmployeeComponent,
    EditEmployeeComponent,
    NavbarComponent,
    AddEmptoprojectComponent,
    AddProjectComponent,
    EditProjectComponent,
    ListProjectsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    FormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    NgxChartsModule,
  ],
  providers: [EmployeeService],
  bootstrap: [AppComponent]
})
export class AppModule { }
