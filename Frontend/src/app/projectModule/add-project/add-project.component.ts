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
  
    this.projectservice.addProject(this.project);
    this.router.navigate(['/nav/projects']);
  }
  ngOnInit(): void {

  }
}

