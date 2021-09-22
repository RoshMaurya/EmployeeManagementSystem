import { Component, OnInit } from '@angular/core';
import { Color } from '@swimlane/ngx-charts';
import { dashboardData } from '../models/dashboardData.model';
import { DashboardService } from '../services/dashboard.service';
import { LoginService } from '../services/login.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  ageGrp : dashboardData[] = [];
  genderData : dashboardData[] = [];
  departmentData : dashboardData[] = [];
  positionData : dashboardData[] = [];

  constructor(
    private _loginService: LoginService,
    private _dashboardService: DashboardService
  ) { }

  ngOnInit() {
    
    //console.log(this._loginService.getLoginStatus());
    // this.ageGroups =
    this._dashboardService.getAgeGroups().subscribe(
      (res) => {this.ageGrp = res
      console.log(this.ageGrp)},  
      (error) => console.log(error)
    );
    this._dashboardService.getGender().subscribe(
      (res) => this.genderData = res,  
      (error) => console.log(error)
    );
    this._dashboardService.getDepartment().subscribe(
      (res) => this.departmentData = res,  
      (error) => console.log(error)
    );
    this._dashboardService.getPosition().subscribe(
      (res) => this.positionData = res,  
      (error) => console.log(error)
    );
  }



  view: [number, number] = [670, 370];

  // options
  legendTitle: string = 'Positiosn';
  legendPosition: any = 'right'; // ['right', 'below']
  legend: boolean = true;

  xAxis: boolean = true;
  yAxis: boolean = true;

  yAxisLabel: string = 'Age';
  xAxisLabel: string = 'Age Groups';
  showXAxisLabel: boolean = true;
  showYAxisLabel: boolean = true;

  maxXAxisTickLength: number = 30;
  maxYAxisTickLength: number = 30;
  trimXAxisTicks: boolean = false;
  trimYAxisTicks: boolean = false;
  rotateXAxisTicks: boolean = false;

  xAxisTicks: any[] = ['Genre 1', 'Genre 2', 'Genre 3', 'Genre 4', 'Genre 5', 'Genre 6', 'Genre 7']
  yAxisTicks: any[] = [5, 10, 15, 20, 25, 30]

  animations: boolean = true; // animations on load

  showGridLines: boolean = true; // grid lines

  showDataLabel: boolean = true; // numbers on bars

  gradient: boolean = false;

  schemeType: any = 'ordinal'; // 'ordinal' or 'linear'

  activeEntries: any[] = ['book']
  barPadding: number = 5
  tooltipDisabled: boolean = false;

  yScaleMax: number = 9000;

  roundEdges: boolean = false;


  //pie properties

  showLegend: boolean = true;
  showLabels: boolean = true;
  isDoughnut: boolean = false;



  onSelect(event: any) {
    console.log(event);
  }

  onActivate(data: any): void {
    console.log('Activate', JSON.parse(JSON.stringify(data)));
  }

  onDeactivate(data: any): void {
    console.log('Deactivate', JSON.parse(JSON.stringify(data)));
  }

  formatString(input: string): string {
    return input.toUpperCase()
  }

  formatNumber(input: number): number {
    return input
  }

}

//ng add @ng-bootstrap/ng-bootstrap
// npm install @swimlane/ngx-charts --save
// npm i @angular/cdk installation