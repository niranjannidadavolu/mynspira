import { StatusType } from './../../../core/enum/application-enums';
import { EarlyLogoutTimeComponent } from './../../leave-management/early-logout-time/early-logout-time.component';
import { AfterViewInit, Component, OnInit, SimpleChanges } from '@angular/core';
import { circle, latLng, tileLayer } from 'leaflet';
import { SwiperOptions } from 'swiper';
import { BestSelling, TopSelling, RecentSelling, statData } from './data';
import { ChartType } from './dashboard.model';
import { Router } from '@angular/router';
import { EmployeeService, EmployeeVerificationService, StorageService } from 'src/app/core/services';
import { finalize } from 'rxjs/operators';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import { EmployeeHolidaysComponent } from 'src/app/shared/app-components/employee-holidays/employee-holidays.component';
import flatpickr from "flatpickr";
import { formatDate } from '@angular/common';
import { CompOffLeaveComponent } from '../../leave-management/comp-off-leave/comp-off-leave.component';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Subscription } from 'rxjs';
import { DisableWeekdays } from 'src/app/core/constants/leave-status.constant';
import Swal from 'sweetalert2';
import { LoaderService } from 'src/app/core/services/helper/loader-service.service';

// declare the javascript function here
// declare function openEqualGateway(client_id: any, idempotency_id: any, token: any, mobile: any): any;
declare var require: any;
const myFunctions = require('src/assets/app-js/equal.in.js');
declare global {
  interface Window {
    CustomEvent: typeof CustomEvent;
  }
}
@Component({
  selector: 'app-dash-board',
  templateUrl: './dash-board.component.html',
  styleUrls: ['./dash-board.component.scss']
})
export class DashBoardComponent implements OnInit, AfterViewInit {

  // bread crumb items
  breadCrumbItems!: Array<{}>;
  analyticsChart!: ChartType;
  BestSelling: any;
  TopSelling: any;
  RecentSelling: any;
  SalesCategoryChart!: ChartType;
  statData!: any;

  pageSize!: number;
  page!: number;
  loggedInUser: any;
  attendance: any = [];
  pageIndex: number | undefined;
  processed: boolean | undefined;
  holidays: any = [];
  greeting: any;
  employeeProfile: any;
  isSubmitted: boolean;
  isMangerRole: boolean = false;
  refreshData: boolean = false;
  isManagerAvailable: boolean = false;
  minheight: boolean = false;
  canApplyCompOff: boolean = false;
  canApplyEarlyLogOut: boolean = false;
  upComingHolidays: any = [];
  subscriptionName: Subscription;
  canApplyLeave: boolean = true;

  constructor(
    private readonly modalService: NgbModal,
    private readonly router: Router,
    private readonly employeeService: EmployeeService,
    private readonly leaveService: LeaveManagementService,
    private readonly storageService: StorageService,
    private readonly employeeVerificationService: EmployeeVerificationService,
    private loaderService: LoaderService
    ) {
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    if (this.employeeProfile) {
      this.isMangerRole = this.employeeProfile.ReporteeCount > 0 ? true : false;
    }
    // this.employeeService.getCheckEmployeeEligibility().subscribe(data => {
    //   if (data) {
    //    this.canApplyLeave = data.some((s:any) => s.EmpId == this.employeeProfile.EmpId);
    //   }
    // });
    this.isSubmitted = false;
    this.toggleActivity();
    this.pageIndex = 1;
    this.pageSize = 10;
    let value = this.storageService.get("LoggedInUser", 1);
    if (value) {
      this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
      let equalData = {
        client_id: this.loggedInUser.ClientId,
        idempotency_id: this.loggedInUser.IdempotencyId,
        token: this.loggedInUser.EqualToken,
        mobile: this.employeeProfile.Mobile,
        employeeSlno: this.loggedInUser.EmployeeSlno
      }
      if (!this.loggedInUser.IsVerified) {
        myFunctions.openEqualGateway(equalData);
        window.addEventListener('fetchEmployeeVerifyData', (event: any) => {
          if (event.detail.message.includes("Successfully")) {
            // sucess
            this.loaderService.isLoading.next(true);
            setTimeout(() => {
              this.employeeVerificationService.saveEmployeeVerifiedData(equalData).subscribe(data => {
                
                if (data) {
                  Swal.fire({
                    title: 'Well done !',
                    html: 'Aww yeah, your demographic data verified successfully.',
                    icon: 'success',
                    confirmButtonColor: 'rgb(54, 69, 116)',
                    confirmButtonText: 'Ok'
                  });
            this.loaderService.isLoading.next(false);
                  this.loggedInUser.IsVerified = true;
                  this.storageService.save("LoggedInUser", JSON.stringify(this.loggedInUser), 1);
                } else {
                  Swal.fire({
                    title: 'Error!!',
                    html: 'Aww No, you did not provided some details.  Plesae validate and re verify.',
                    icon: 'error',
                    confirmButtonColor: 'rgb(54, 69, 116)',
                    confirmButtonText: 'Ok'
                  });
                }

              });
            }, 30000);

          }
          else {
            Swal.fire({
              title: 'Error!!',
              html: 'Aww No, you did not provided some details.  Plesae validate and re verify.',
              icon: 'error',
              confirmButtonColor: 'rgb(54, 69, 116)',
              confirmButtonText: 'Ok'
            });
          }
        });
        // window.addEventListener('dataReceived', (event: any) => {
        //   //console.log(event);
        //   if (event.detail.status == 200) {
        //     // sucess
        //     Swal.fire({
        //       title: 'Well done !',
        //       html: 'Aww yeah, your demographic data verified successfully.',
        //       icon: 'success',
        //       confirmButtonColor: 'rgb(54, 69, 116)',
        //       confirmButtonText: 'Ok'
        //     });
        //     this.loggedInUser.IsVerified = true;
        //     this.storageService.save("LoggedInUser", JSON.stringify(this.loggedInUser), 1);
        //   }
        //   else { 
        //     Swal.fire({
        //       title: 'Error!!',
        //       html: 'Aww No, you did not provided some details.  Plesae validate and re verify.',
        //       icon: 'error',
        //       confirmButtonColor: 'rgb(54, 69, 116)',
        //       confirmButtonText: 'Ok'
        //     });
        //   }
        // });
      }
    }

    this.getEmployeeProfile();
    this.getGreetingText();
    this.getEmployeeTimeSheet();
    this.subscriptionName = new Subscription();
  }
  ngAfterViewInit(): void {
     
    // let client_id = this.loggedInUser.ClientId;
    // let idempotency_id = this.loggedInUser.EmployeeId;
    // let token = this.loggedInUser.EqualToken;
    // let mobile = this.employeeProfile.Mobile;
    // openEqualGateway(client_id, idempotency_id, token, mobile);
  }

  // Employee Information get
  getEmployeeProfile() {
    let profile = this.storageService.get("EmployeeProfile", 1);
    if (profile) {
      this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
      this.isManagerAvailable = this.employeeProfile.ReportingManagerId > 0;
    }
    else {
      let employeeSlno = this.loggedInUser.EmployeeSlno;
      this.employeeService.getEmployeeMinimumProfile(employeeSlno).subscribe(data => {
        this.employeeProfile = data;
        this.isManagerAvailable = this.employeeProfile.ReportingManagerId > 0;
      });
    }
  }
  ngOnChanges(changes: SimpleChanges): void {
    if (this.refreshData) {
      this.getEmployeeTimeSheet();
    }
  }
  ngOnInit(): void {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Dashboard', active: true }
    ];
    this.subscriptionName = this.leaveService.getUpdate().subscribe
      ((isApplyLeave: boolean) => { //message contains the data sent from service
        if (isApplyLeave) {
          this.getEmployeeTimeSheet();
        }
      });


    /**
    * Fetches the data
    */
    this.fetchData();

    // Chart Color Data Get Function
    this._analyticsChart('["--vz-warning", "--vz-primary", "--vz-danger"]');
    this._SalesCategoryChart('["--vz-primary", "--vz-success", "--vz-warning", "--vz-danger", "--vz-info"]');

    this.SidebarHide();
  }

  // Display Greetings
  getGreetingText() {
    let myDate = new Date();
    let hrs = myDate.getHours();
    if (hrs < 12)
      this.greeting = 'Good Morning';
    else if (hrs >= 12 && hrs < 17)
      this.greeting = 'Good Afternoon';
    else if (hrs >= 17 && hrs <= 24)
      this.greeting = 'Good Evening';
  }

  // Time Management
  getEmployeeTimeSheet() {
    if (this.loggedInUser) {
      let employeeId = this.loggedInUser.EmployeeSlno;
      this.employeeService.getMyAttendance(employeeId)
        .pipe(finalize(() => this.processed = true))
        .subscribe(data => {
          if (data) {
            this.attendance = data;
            this.getEmployeeHolidays();
          }
        });
    }
    else {
      this.router.navigate(['/account/login']);
    }
  }
  checkTotalTime(data: any)
  {
    let minutes = this.convertH2M(data.TotalTime);
    let check = false;
    if (minutes >= 540) {
      check = true;
    }
    return check;
  }
  // Open Comp-Off leave 
  compOffLeave(rowData: any) {
    const modalRef = this.modalService.open(CompOffLeaveComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = rowData.data;
    modalRef.result.then(() => {
      this.refreshData = true;
      this.getEmployeeTimeSheet();
    });
  }

  // Open Early LogOut Time Request 
  earlyLogOut(rowData: any) {
    const modalRef = this.modalService.open(EarlyLogoutTimeComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = rowData.data;
    modalRef.result.then(() => {
      this.refreshData = true;
      this.getEmployeeTimeSheet();
    });
  }

  // Check Eligibility for appling Early LogOut Time
  checkEarlyLogOut(data: any) {
    let minutes = this.convertH2M(data.TotalTime);
    let check = false;
    if (minutes >= 480 && minutes < 540) {
      check = true;
    }
    return check;
  }

  // convertt HH:MM to minutes
  convertH2M(timeInHour: any) {
    var timeParts = timeInHour.split(":");
    return Number(timeParts[0]) * 60 + Number(timeParts[1]);
  }

  minHeight(event: boolean) {
    this.minheight = event;
  }
  getUpcomingHolidays(data: any) {
    this.holidays = JSON.parse(JSON.stringify(data));
    this.holidays = this.holidays.filter((x: any) => x.HolidayName !== DisableWeekdays.SUNDAY);
    this.holidays = this.holidays.filter((x: any) => x.HolidayName !== DisableWeekdays.MONDAY);
    this.holidays = this.holidays.filter((x: any) => formatDate(x.HolidayDate, 'MM-dd-yyyy', 'en') >= formatDate(new Date(), 'MM-dd-yyyy', 'en'));
  }
  // Get Employee year calender holidays 
  getEmployeeHolidays() {
    if (this.loggedInUser) {
      let employeeId = this.loggedInUser.EmployeeSlno;
      this.employeeService.getEmployeeHolidays(employeeId)
        .pipe(finalize(() => this.processed = true))
        .subscribe(data => {
          if (data) {
            this.getUpcomingHolidays(data);
            // this.holidays = data.filter((x: any) => formatDate(x.HolidayDate, 'MM-dd-yyyy', 'en') >= formatDate(new Date(), 'MM-dd-yyyy', 'en'));;
            let holidays: any = data;
            let timeSheet: any = [];
            if (this.attendance.length) {
              timeSheet = this.attendance;
            }
            this.storageService.save("HoliDays", JSON.stringify(data), 1);
            flatpickr("#inline-cal", {
              inline: true,
              onDayCreate: function (dObj, dStr, fp, dayElem) {
                var curDate = +dayElem.dateObj;
                let data = holidays.find((s: any) => formatDate(s.HolidayDate, 'MM-dd-yyyy', 'en') == formatDate(curDate, 'MM-dd-yyyy', 'en'));
                if (data) {
                  dayElem.className += ' ' + 'flatpickr-f_holiday';
                  dayElem.title += ' ' + data.HolidayName;
                }
                let tabsent = timeSheet.find((s: any) => formatDate(s.AttendanceDate, 'MM-dd-yyyy', 'en') == formatDate(curDate, 'MM-dd-yyyy', 'en'));
                if (tabsent) {
                  dayElem.className += ' ' + tabsent.ClassName;
                  dayElem.title += ' ' + tabsent?.First_Half + ',' + tabsent?.Second_Half;
                }
              },
              minDate: new Date(timeSheet[timeSheet.length - 1].AttendanceDate)
              // disable: [
              //   function (date) {
              //     return (date.getDay() === 0);
              //   }
              // ],
            });

          }
        });
    }
    else {
      this.router.navigate(['/account/login']);
    }
  }

  // Disabled sundays in dashboard calender
  // disabledDay(date: any) {
  //   var showDay = false;
  //   if (date.getDay() == 0) {
  //     showDay = true;
  //   }
  //   return (date.getDay() == 0);
  // }

  // isCloneIconVisible(e: any) {
  //   let employeeProfile;
  //   let profile = this.storageService.get("EmployeeProfile", 1);
  //   if (profile) {
  //     employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
  //   }
  //   if (employeeProfile && employeeProfile.ReportingManagerId > 0) {
  //     return true;
  //   }
  //   return false;
  // }
  // cloneIconClick(e: any) {
  //   if (this.isManagerAvailable) {
  //     this.applyOnDuty(e.row.data);
  //     e.event.preventDefault();
  //   }
  //   else {

  //   }
  // }

  // FIrst_Half and Second_ Half colors apply
  onCellPrepared(e: any) {
    if (e.rowType === "data" && (e.column.dataField === "First_Half" || e.column.dataField === "Second_Half")) {
      if (e.data.First_Half !== 'ABSENT') {
        if (e.data.Holiday_Type === 1) {
          e.cellElement.style.color = 'blue';
        }
        else {
          if (e.data.First_Half === 'ON DUTY') {
            e.cellElement.style.color = '#00cc00';
          }
        }
      }
      else {
        e.cellElement.style.color = 'red';
      }

      if (e.data.Second_Half !== 'ABSENT') {
        if (e.data.Holiday_Type === 1) {
          e.cellElement.style.color = 'blue';
        }
        else {
          if (e.data.Second_Half === 'ON DUTY') {
            e.cellElement.style.color = '#00cc00';
          }
        }
      }
      else {
        e.cellElement.style.color = 'red';
      }
    }
  }

  // Chart Colors Set
  private getChartColorsArray(colors: any) {
    colors = JSON.parse(colors);
    return colors.map(function (value: any) {
      var newValue = value.replace(" ", "");
      if (newValue.indexOf(",") === -1) {
        var color = getComputedStyle(document.documentElement).getPropertyValue(newValue);
        if (color) {
          color = color.replace(" ", "");
          return color;
        }
        else return newValue;;
      } else {
        var val = value.split(',');
        if (val.length == 2) {
          var rgbaColor = getComputedStyle(document.documentElement).getPropertyValue(val[0]);
          rgbaColor = "rgba(" + rgbaColor + "," + val[1] + ")";
          return rgbaColor;
        } else {
          return newValue;
        }
      }
    });
  }

  /**
 * Sales Analytics Chart
 */
  private _analyticsChart(colors: any) {
    colors = this.getChartColorsArray(colors);
    this.analyticsChart = {
      chart: {
        height: 370,
        type: "line",
        toolbar: {
          show: false,
        },
      },
      stroke: {
        curve: "straight",
        dashArray: [0, 0, 8],
        width: [2, 0, 2.2],
      },
      colors: colors,
      series: [{
        name: 'Orders',
        type: 'area',
        data: [34, 65, 46, 68, 49, 61, 42, 44, 78, 52, 63, 67]
      }, {
        name: 'Earnings',
        type: 'bar',
        data: [89.25, 98.58, 68.74, 108.87, 77.54, 84.03, 51.24, 28.57, 92.57, 42.36,
          88.51, 36.57]
      }, {
        name: 'Refunds',
        type: 'line',
        data: [8, 12, 7, 17, 21, 11, 5, 9, 7, 29, 12, 35]
      }],
      fill: {
        opacity: [0.1, 0.9, 1],
      },
      labels: ['01/01/2003', '02/01/2003', '03/01/2003', '04/01/2003', '05/01/2003', '06/01/2003', '07/01/2003', '08/01/2003', '09/01/2003', '10/01/2003', '11/01/2003'],
      markers: {
        size: [0, 0, 0],
        strokeWidth: 2,
        hover: {
          size: 4,
        },
      },
      xaxis: {
        categories: [
          "Jan",
          "Feb",
          "Mar",
          "Apr",
          "May",
          "Jun",
          "Jul",
          "Aug",
          "Sep",
          "Oct",
          "Nov",
          "Dec",
        ],
        axisTicks: {
          show: false,
        },
        axisBorder: {
          show: false,
        },
      },
      grid: {
        show: true,
        xaxis: {
          lines: {
            show: true,
          },
        },
        yaxis: {
          lines: {
            show: false,
          },
        },
        padding: {
          top: 0,
          right: -2,
          bottom: 15,
          left: 10,
        },
      },
      legend: {
        show: true,
        horizontalAlign: "center",
        offsetX: 0,
        offsetY: -5,
        markers: {
          width: 9,
          height: 9,
          radius: 6,
        },
        itemMargin: {
          horizontal: 10,
          vertical: 0,
        },
      },
      plotOptions: {
        bar: {
          columnWidth: "30%",
          barHeight: "70%",
        },
      },
    };
  }

  /**
 *  Sales Category
 */
  private _SalesCategoryChart(colors: any) {
    colors = this.getChartColorsArray(colors);
    this.SalesCategoryChart = {
      series: [44, 55, 41, 17, 15],
      labels: ["Direct", "Social", "Email", "Other", "Referrals"],
      chart: {
        height: 333,
        type: "donut",
      },
      legend: {
        position: "bottom",
      },
      stroke: {
        show: false
      },
      dataLabels: {
        dropShadow: {
          enabled: false,
        },
      },
      colors: colors
    };
  }

  /**
  * Fetches the data
  */
  private fetchData() {
    this.BestSelling = BestSelling;
    this.TopSelling = TopSelling;
    this.RecentSelling = RecentSelling;
    this.statData = statData;
  }

  /**
 * Sale Location Map
 */
  options = {
    layers: [
      tileLayer("https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw", {
        id: "mapbox/light-v9",
        tileSize: 512,
        zoomOffset: -1,
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      })
    ],
    zoom: 1.1,
    center: latLng(28, 1.5)
  };
  layers = [
    circle([41.9, 12.45], { color: "#435fe3", opacity: 0.5, weight: 10, fillColor: "#435fe3", fillOpacity: 1, radius: 400000, }),
    circle([12.05, -61.75], { color: "#435fe3", opacity: 0.5, weight: 10, fillColor: "#435fe3", fillOpacity: 1, radius: 400000, }),
    circle([1.3, 103.8], { color: "#435fe3", opacity: 0.5, weight: 10, fillColor: "#435fe3", fillOpacity: 1, radius: 400000, }),
  ];

  /**
* Swiper Vertical  
  */
  public Vertical: SwiperOptions = {
    a11y: { enabled: true },
    direction: 'vertical',
    slidesPerView: 2,
    pagination: true,
  };

  /**
   * Recent Activity
   */
  toggleActivity() {
    const recentActivity = document.querySelector('.layout-rightside-col');
    if (recentActivity != null) {
      recentActivity.classList.toggle('d-none');
    }

    if (window.screen.width <= 767) {
      const recentActivity = document.querySelector('.layout-rightside-col');
      if (recentActivity != null) {
        recentActivity.classList.add('d-none');
        //recentActivity.classList.remove('d-none');
      }
    }

  }

  /**
   * SidebarHide modal
   * @param content modal content
   */
  SidebarHide() {
    const recentActivity = document.querySelector('.layout-rightside-col');
    if (recentActivity != null) {
      recentActivity.classList.remove('d-none');
    }
  }
  viewHolidays() {
    const modalRef = this.modalService.open(EmployeeHolidaysComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.holidays = this.holidays;
    modalRef.result.then(() => {
    });
  }


}
