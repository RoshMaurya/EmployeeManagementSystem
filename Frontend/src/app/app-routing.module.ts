import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddEmployeeComponent } from './employeeModule/add-employee/add-employee.component';
import { AddEmptoprojectComponent } from './projectModule/add-emptoproject/add-emptoproject.component';
import { AddProjectComponent } from './projectModule/add-project/add-project.component';
import { AdminLoginComponent } from './admin-login/admin-login.component';
import { AppComponent } from './app.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { EditEmployeeComponent } from './employeeModule/edit-employee/edit-employee.component';
import { EditProjectComponent } from './projectModule/edit-project/edit-project.component';

import { ListEmployeesComponent } from './employeeModule/list-employees/list-employees.component';
import { ListProjectsComponent } from './projectModule/list-projects/list-projects.component';
import { NavbarComponent } from './navbar/navbar.component';
import { AuthGuard } from './services/auth.guard';

const routes: Routes = [

  { path: 'login', component: AdminLoginComponent },
  // { path: 'dashboard', component: DashboardComponent },
  // { path: 'employees', component: ListEmployeesComponent },
  // { path: 'createEmployee', component: AddEmployeeComponent },
  // { path: 'editEmployee/:id', component: EditEmployeeComponent },
  { path: 'app', component: AppComponent },
  { path: '', component: AdminLoginComponent },
  {
    path: 'nav',
    component: NavbarComponent,canActivate: [AuthGuard],
    children: [
      { path: 'dashboard', component: DashboardComponent ,canActivate: [AuthGuard] },
      { path: 'employees', component: ListEmployeesComponent,canActivate: [AuthGuard] },
      { path: 'createEmployee', component: AddEmployeeComponent,canActivate: [AuthGuard] },
      { path: 'editEmployee/:id', component: EditEmployeeComponent,canActivate: [AuthGuard] },
      {path : 'createproject', component:AddProjectComponent,canActivate: [AuthGuard]},
      {path : 'editproject/:id', component:EditProjectComponent,canActivate: [AuthGuard]},
      {path: 'projects',component:ListProjectsComponent,canActivate: [AuthGuard]},
      {path: 'addemp/:id',component:AddEmptoprojectComponent,canActivate: [AuthGuard]}
      
    ]
  }
  // { path : '**'}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
