import { Injectable, OnInit } from "@angular/core";
import { BehaviorSubject } from "rxjs";

@Injectable()
export class DataService implements OnInit {
  private notifications = new BehaviorSubject<any>(null);
  private userCount = new BehaviorSubject<any>(null);
  private reviewData = new BehaviorSubject<any>(null);
  private departmentId = new BehaviorSubject<any>(null);
  private designationId = new BehaviorSubject<any>(null);
  private employeeSlno = new BehaviorSubject<any>(null);

  constructor() {}
  ngOnInit(): void {}

  setReviewData(data: any) {
    
    this.reviewData.next(data);
  }
  setNotifications(data: any) {
    this.notifications.next(data);
  }

  setUserCount(userCount: any) {
    this.userCount.next(userCount);
  }
  setDepartment(data: any){
    
    return this.departmentId.next(data);
  }
  setDesignation(data: any){
    return this.designationId.next(data);
  }
  setEmployeeSlno(data: any) {
    return this.employeeSlno.next(data);
  }

  getReviewData() {
    
    return this.reviewData.asObservable();
  }
  getNotifications() {
    return this.notifications.asObservable();
  }

  getUserCount() {
    return this.userCount.asObservable();
  }

  getDepartment(){
    
    return this.departmentId.asObservable();
  }
  getDesignation(){
    return this.designationId.asObservable();
  }
  getEmployeeSlno() {
    return this.employeeSlno.asObservable();
  }

}
