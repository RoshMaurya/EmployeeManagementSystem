import { Component, OnInit } from '@angular/core';
import { Router} from '@angular/router';
import { ProjectserviceService } from '../../services/projectservice.service';
import { Project } from '../../models/project.model';

@Component({
  selector: 'app-add-project',
  templateUrl: './add-project.component.html',
  styleUrls: ['./add-project.component.css']
})
export class AddProjectComponent implements OnInit {
  Title: string = "Enter Details";

  project : Project = {
  pId: " ",
  pName: " ",
  pDetail: " ",
  supervisorEmployeeId:0,
  }

  constructor(private projectservice: ProjectserviceService, private router: Router) {}

  saveProject() {
  
    this.projectservice.addProject(this.project)
    .subscribe(
      (response) => console.log(response),
      (error) =>
      {
        //console.log(error.error);
        switch ( error.status ){
          case 200:if(error.error.text.indexOf('Sucessfully') !== -1){
                      alert(error.error.text);
                    }
                    break;
          case 400: if(error.error.indexOf('duplicate') !== -1){
                      alert("Project with Id" + this.project.pId + " is already present");
                    }else{
                      alert(error.error);
                    } 
                    break;       
        }
      }
    );    
    this.router.navigate(['/nav/projects']);
  }
  ngOnInit(): void {

  }
}

