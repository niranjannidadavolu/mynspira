import { Component, Input, OnInit } from '@angular/core';
import { LEAVE_STATUS_ID } from 'src/app/core/constants/leave-status.constant';
@Component({
  selector: 'app-workflow-tracker',
  templateUrl: './workflow-tracker.component.html',
  styleUrls: ['./workflow-tracker.component.scss']
})
export class WorkflowTrackerComponent implements OnInit {
  @Input()
  public trackerEntities: Array<any> = [];
  @Input() totalDaysTaken: any;
  leaveStaus = LEAVE_STATUS_ID;
  constructor() { }
  ngOnInit(): void {
    this.trackerEntities?.map((e, i) => {
      
      // 
      e.isVisible = true;
      // if(this.totalDaysTaken <= 2 && i == 0 ){
      //   e.isVisible = true;
      // }
      // if(this.totalDaysTaken <= 4 && this.totalDaysTaken > 2 && i <= 1 ){
      //   e.isVisible = true;
      // }
      // if(this.totalDaysTaken > 4  ){
      //   e.isVisible = true;
      // }
    })
  }
}
