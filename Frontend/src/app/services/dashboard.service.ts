import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs';
import { dashboardData } from '../models/dashboardData.model';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {


  constructor(
    private _httpClient: HttpClient
  ) { }

  getGender(): Observable<dashboardData[]> {
    return this._httpClient.get<dashboardData[]>('https://localhost:44345/api/Dashboard/GetGender');
  }

  getDepartment(): Observable<dashboardData[]> {
    return this._httpClient.get<dashboardData[]>('https://localhost:44345/api/Dashboard/GetDepartment');
  }
  getPosition(): Observable<dashboardData[]> {
    return this._httpClient.get<dashboardData[]>('https://localhost:44345/api/Dashboard/GetPosition');
  }
  getAgeGroups(): Observable<dashboardData[]> {
    return this._httpClient.get<dashboardData[]>('https://localhost:44345/api/Dashboard/GetAgeGroup');
  }

}
