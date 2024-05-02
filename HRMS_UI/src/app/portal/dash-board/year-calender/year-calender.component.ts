import { Component, OnInit } from '@angular/core';
import { finalize } from 'rxjs/operators';
import { EmployeeService, StorageService } from 'src/app/core/services';

@Component({
  selector: 'app-year-calender',
  templateUrl: './year-calender.component.html',
  styleUrls: ['./year-calender.component.scss']
})
export class YearCalenderComponent implements OnInit {


  now: Date = new Date();
  currentValue: Date ;
  firstDay = 0;
  minDateValue: Date
  maxDateValue: Date 
  disabledDates: any | null = null;

  zoomLevels: string[] = [
    'month', 'year', 'decade', 'century',
  ];

  cellTemplate = 'cell';
  loggedInUser: any;
  processed: boolean=false;
  holidays: any;
  //holydays: any = [[1, 0], [4, 6], [25, 11]];
  constructor(private readonly employeeService: EmployeeService,
    private readonly storageService: StorageService) { 
    this.currentValue=new Date();
    this.minDateValue=new Date();
    this.maxDateValue=new Date();
    let value = this.storageService.get("LoggedInUser", 1);
    if (value) {
      this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    }
    this.getEmployeeHolidays();
  }

  ngOnInit(): void {
  }

  isWeekend(date:Date) {
    const day = date.getDay();

    return day === 0 || day === 6;
  }



  disableWeekend(e:any) {
    if (e.value) {
      const that = this;
      that.disabledDates = function (data:any) {
        return data.view === 'month' && that.isWeekend(data.date);
      };
    } 
  }

  

  useCellTemplate(e:any) {
    if (e.value) {
      this.cellTemplate = 'custom';
    } else {
      this.cellTemplate = 'cell';
    }
  }

  getCellCssClass(cellData:any): string {
    let cssClass = '';

    if (cellData.view === 'month') {
      if (this.isWeekend(cellData.date)) { cssClass = 'weekend'; }

      this.holidays.array.forEach((item:any) => {
        
        if (cellData.date.getDate() === item.HolidayDate ) {
          cssClass = 'holyday';
          return false;
        }
        return true;
      });
    }

    return cssClass;
  }

  getEmployeeHolidays() {
    if (this.loggedInUser) {
      let employeeId = this.loggedInUser.EmployeeSlno;
      this.employeeService.getEmployeeHolidays(employeeId)
        .pipe(finalize(() => this.processed = true))
        .subscribe(data => {
          if (data) {
            this.holidays = data;   
          }
        });
    }
  }

}
