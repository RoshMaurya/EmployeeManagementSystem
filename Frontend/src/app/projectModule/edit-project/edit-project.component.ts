import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Project } from '../../models/project.model';
import { ProjectserviceService } from '../../services/projectservice.service';

@Component({
  selector: 'app-edit-project',
  templateUrl: './edit-project.component.html',
  styleUrls: ['./edit-project.component.css']
})
export class EditProjectComponent implements OnInit {

  Title: string = "Update Details ";

  project: Project = {
    pId: " ",
    pName: " ",
    pDetail: " ",
    supervisorEmployeeId: 0,
  }

  constructor(
    private projectservice: ProjectserviceService,
    private _route: ActivatedRoute,
    private _router: Router
  ) { }

  ngOnInit(): void {
    this._route.paramMap.subscribe(parametermMap => {
      const id = parametermMap.get('id');
      this.projectservice.getProject(id).subscribe(
        (response: any) => this.project = response,
        (error: any) => console.log(error),
      );
    });
  }


  updateProject() {
    this.projectservice.updateProject(this.project)
    .subscribe(
        (response) => console.log(response),
        (error) => {
          //console.log(error.error.text)
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

      );
    //console.error(this.employee.firstName);
    this._router.navigate(['/nav/projects']);
  }
}

