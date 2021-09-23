import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AddEmp } from '../models/addemptoproj';
import { Project } from '../models/project.model';

@Injectable({
  providedIn: 'root'
})
export class ProjectserviceService {

  pId: string = " ";

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    })
  };
  constructor(
    private httpClient: HttpClient
  ) { }

  getProjects(): Observable<Project[]> {
    return this.httpClient.get<Project[]>("https://localhost:44345/api/Project/GetProject");
  }

  getProject(id: any): Observable<Project> {
    return this.httpClient.get<Project>('https://localhost:44345/api/Project/GetProjectById/' + id);
  }



  addProject(project: Project) {
    console.log(project);

    return this.httpClient.post<Project>("https://localhost:44345/api/Project/AddProject", project, this.httpOptions);
    // .subscribe(
    //   (response) => console.log(response),
    //   (error) => console.log(error.error)
    // );
  }


  updateProject(project: Project) {

    //console.log(project);
    return this.httpClient.put<Project>("https://localhost:44345/api/Project/UpdateProject", project, this.httpOptions)
    // .subscribe(
    //   (response) => console.log(response),
    //   (error) => console.log(error.error.text)
    // );
  }
  deleteProject(id: string) {
    const deleteProj = 'https://localhost:44345/api/Project/DeleteProject/' + id;
    return this.httpClient.delete(deleteProj, { responseType: 'text' });
  }

  addEmptoproj(emp: AddEmp) {
    this.httpClient.post<AddEmp>("https://localhost:44345/api/Project/AEmpProject", emp, this.httpOptions)
      .subscribe(
        (response) => console.log(response),
        (error) => console.log(error)
      );
  }

  GetEmpProject(id: string): Observable<AddEmp[]> {
    return this.httpClient.get<AddEmp[]>('https://localhost:44345/api/Project/GetEmpProject/' + id);
  }

  getProjectByName(name: string): Observable<Project[]> {
    // return this.listEmployees.find(e => e.employeeId == id)
    //console.log(id)
    return this.httpClient.get<Project[]>('https://localhost:44345/api/Project/GetProjectByName/' + name);
  }

  getEmployeeNot(): Observable<AddEmp[]> {
    // return this.listEmployees.find(e => e.employeeId == id)
    //console.log(id)
    return this.httpClient.get<AddEmp[]>('https://localhost:44345/api/Project/GetEmpNotProject/');
  }
}



