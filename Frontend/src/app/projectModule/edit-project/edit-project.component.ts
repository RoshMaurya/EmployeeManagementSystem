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
    this.projectservice.updateProject(this.project);
    //console.error(this.employee.firstName);
    this._router.navigate(['/nav/projects']);
  }
}

