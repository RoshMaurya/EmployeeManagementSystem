import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal, ModalDismissReasons, NgbModalOptions } from '@ng-bootstrap/ng-bootstrap';
import { AddEmp } from '../../models/addemptoproj';
import { Project } from '../../models/project.model';
import { ProjectserviceService } from '../../services/projectservice.service';

@Component({
  selector: 'app-list-projects',
  templateUrl: './list-projects.component.html',
  styleUrls: ['./list-projects.component.css']
})
export class ListProjectsComponent implements OnInit {

    projects: Project[] = [];
    nameOfProjectToDelete = '';
    project! : Project;
    addempp!: AddEmp[];
    addemp!:AddEmp;
    addEmpNot!: AddEmp[];

    constructor(
      private _projectService: ProjectserviceService,
      private modalService: NgbModal,
      private _router : Router
    ) { }

    ngOnInit(): void {
      this._projectService.getProjects().subscribe(res => {
       // console.log(res);
      this.projects = res;
      //console.log(this.projects);
    });
    this._projectService.getEmployeeNot().subscribe(res => {
      this.addEmpNot = res;
      //console.log(this.employees2);
       });
  }
    opendeleteModal(deletModal: any, id: string, name: string) {
      this.nameOfProjectToDelete = name;
      const modalRef = this.modalService.open(deletModal).result.then(() => {
        this. deleteProject(id);
      }, (reason) => {
        console.log(reason);
      });
    }
    deleteProject(id: string) {
      //this._projectService.deleteProject(id);
      console.log(id);
      this._projectService.deleteProject(id).subscribe(data => {console.log(data)});
      location.reload();
    }
    //view Modal call
    openViewModal(viewModal: any, project : Project, addemp:AddEmp) {
      this.project = project;
      this.addemp = addemp;
      console.log(project.pId);
      this._projectService.GetEmpProject(project.pId).subscribe(
        res =>{
          this.addempp=res,
          console.log(this.addempp);
        }
      );
      const modalRef = this.modalService.open(viewModal, {size : 'lg'}).result.then(() => {
        console.log(project);
        console.log(addemp.employeeId);
      }, (reason) => {
        console.log(reason);
      });
    }
    //edit project method
    editProject(project : Project){
      this.project = project;
      this._router.navigate(['/nav/editproject', this.project.pId])
    }
    AddComp(project:Project)
    {
      this.project = project;
      this._router.navigate(['/nav/addemp', this.project.pId])
    }

    //serach
  search(event: any){
    //this.nameOfEmployeeToDelete = event.target.value;
    console.log(event.target.value)
    if(event.target.value ===''){
      location.reload();
    }else{
      this._projectService.getProjectByName(event.target.value).subscribe(res => {
        this.projects = res;
        //console.log(this.employees);
        //console.log(this._loginService.getUserStatus()); 
      });
    }
  } 
}

