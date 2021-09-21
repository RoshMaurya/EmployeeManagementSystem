import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
//import { AddempserviceService } from '../addempservice.service';
import { AddEmp } from '../../models/addemptoproj';
import { Project } from '../../models/project.model';
import { ProjectserviceService } from '../../services/projectservice.service';

@Component({
  selector: 'app-add-emptoproject',
  templateUrl: './add-emptoproject.component.html',
  styleUrls: ['./add-emptoproject.component.css']
})
export class AddEmptoprojectComponent implements OnInit {

  Title:string="Enter Details";

  //id:string=" ";
  PID:string=" ";
  EmployeeId:number=0;

  addemp!: AddEmp;
  project!: Project;

  constructor(private projectservice:ProjectserviceService, private router: Router, private _route: ActivatedRoute) {

  }

  saveEmp() {
    this.addemp = new AddEmp(this.project.pId,this.EmployeeId);
    console.log(this.addemp);
    this.projectservice.addEmptoproj(this.addemp);
    (this.addemp);
    this.router.navigate(['/nav/projects']);
  }
  ngOnInit(): void {

    this._route.paramMap.subscribe(parametermMap => {
    const PID = parametermMap.get('id');
    console.log(this.PID);
    this.projectservice.getProject(PID).subscribe(
      (response: any) => this.project = response,
      (error: any) => console.log(error),
      );
    });

}
}
