import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import * as signalR from '@microsoft/signalr';
import { BehaviorSubject } from 'rxjs';
import { environment } from 'src/environments/environment';
import { StorageService } from '../services';
import { DataService } from '../services/helper/data-service';
@Injectable({
  providedIn: 'root'
})
export class SignalrService {
  
  connection: signalR.HubConnection | undefined;
  hubHelloMessage: BehaviorSubject<string>;
  progressPercentage: BehaviorSubject<number>;
  progressMessage: BehaviorSubject<string>;
  public loggedInUserId: any;
  loggedInUser: any;

  constructor(
    private readonly storageService: StorageService,
    private readonly dataService: DataService) {
    this.hubHelloMessage = new BehaviorSubject<string>('');
    this.progressPercentage = new BehaviorSubject<number>(0);
    this.progressMessage = new BehaviorSubject<string>('');

    let value = this.storageService.get("LoggedInUser", 1);
    if (value) {
      this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
      this.initiateSignalrConnection();
    }
  }
  
  // Establish a connection to the SignalR server hub
  private initiateSignalrConnection() {
    this.connection = new signalR.HubConnectionBuilder()
      .withUrl(environment.signalrHubUrl + "?loggedInUserId=" + this.loggedInUser.EmployeeSlno) // the SignalR server url as set in the .NET Project properties and Startup class
      .build();
    this.setSignalrClientMethods();

    this.connection
      .start()
      .then(() => {
        //console.log(
          `SignalR connection success! connectionId: ${this.connection?.connectionId} `
        //);
        //resolve();
      })
      .catch((error) => {
        //console.log(`SignalR connection error: ${error}`);
        //reject();
      });
  }

  // This method will implement the methods defined in the ISignalrDemoHub interface in the SignalrDemo.Server .NET solution
  private setSignalrClientMethods(): void {
    this.connection?.on('DisplayMessage', (message: string) => {
      ////
      this.hubHelloMessage.next(message);
    });

    this.connection?.on('UpdateProgressBar', (percentage: number) => {
      this.progressPercentage.next(percentage);
    });

    this.connection?.on('DisplayProgressMessage', (message: string) => {
      this.progressMessage.next(message);
    });
    this.connection?.on('ShowNotifications', (notifications: any) => {
      ////
      let value = notifications;
      this.dataService.setNotifications(notifications);
      //alert(value.length);

    });
    this.connection?.on('GetVisitorCount', (userCount: any) => {
      ////
      let value = userCount;
      this.dataService.setUserCount(userCount);
    });
  }
}