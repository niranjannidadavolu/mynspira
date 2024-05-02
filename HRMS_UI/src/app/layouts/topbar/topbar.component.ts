import { ApproveLeaveComponent } from './../../portal/leave-management/approve-leave/approve-leave.component';
import { Component, OnInit, EventEmitter, Output, Inject } from '@angular/core';
import { DOCUMENT } from '@angular/common';
import { EventService } from '../../core/services/event.service';

//Logout
import { environment } from '../../../environments/environment';
import { AuthenticationService } from '../../core/services/auth.service';
import { AuthfakeauthenticationService } from '../../core/services/authfake.service';
import { Router } from '@angular/router';

// Language
import { CookieService } from 'ngx-cookie-service';
import { LanguageService } from '../../core/services/language.service';
import { TranslateService } from '@ngx-translate/core';
import { EmployeeService, StorageService, UserInformationService } from 'src/app/core/services';
import { FormBuilder } from '@angular/forms';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { DataService } from 'src/app/core/services/helper/data-service';
import { ToastrService } from 'ngx-toastr';
import { approveLeaveBtnShow } from 'src/app/core/constants/leave-status.constant';

@Component({
  selector: 'app-topbar',
  templateUrl: './topbar.component.html',
  styleUrls: ['./topbar.component.scss']
})
export class TopbarComponent implements OnInit {

  element: any;
  mode: string | undefined;
  @Output() mobileMenuButtonClicked = new EventEmitter();

  flagvalue: any;
  valueset: any;
  countryName: any;
  cookieValue: any;
  lastLoginTime: any;
  loggedInUser: any;
  employeeProfile: any;
  notifications: any;
  firstNotification: any;
  newNotificationCount: any;
  leaveAction = approveLeaveBtnShow;
  loggedInUsers: any;

  constructor(
    @Inject(DOCUMENT) private document: any,
    private router: Router,
    private readonly formBuilder: FormBuilder,
    public languageService: LanguageService,
    public _cookiesService: CookieService,
    public translate: TranslateService,
    private eventService: EventService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal,
    private readonly userInformationService: UserInformationService,
    private readonly employeeService: EmployeeService,
    private readonly dataService: DataService,
    private toastr: ToastrService
  ) {

    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.lastLoginTime = this.loggedInUser?.LastLoginTime;
  }

  ngOnInit(): void {
    this.element = document.documentElement;

    // Cookies wise Language set
    this.cookieValue = this._cookiesService.get('lang');
    const val = this.listLang.filter(x => x.lang === this.cookieValue);
    this.countryName = val.map(element => element.text);
    if (val.length === 0) {
      if (this.flagvalue === undefined) { this.valueset = 'assets/images/flags/us.svg'; }
    } else {
      this.flagvalue = val.map(element => element.flag);
    }
    this.getEmployeeProfile();
    this.dataService.getNotifications().subscribe(data => {
      this.notifications = data;
      //
      if (data) {
        //
        this.firstNotification = data[0];
        if (this.firstNotification) {
          if (this.newNotificationCount != this.firstNotification.new_Notification_Count) {
            this.toastr.warning('You have a new notification', 'MY NSPIRA');
          }
          this.newNotificationCount = this.firstNotification.new_Notification_Count;
          this.notifications = data.slice(0, 5);
        }
        else{
          this.notifications = null;
          this.newNotificationCount = 0;
        }
      }
      else {
        this.newNotificationCount = 0;
      }
    });
    
    //this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile"));
  }


  getEmployeeProfile() {
    let profile = this.storageService.get("EmployeeProfile", 1);
    if (profile) {
      this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    }
    else {
      let employeeSlno = this.loggedInUser.EmployeeSlno;
      this.employeeService.getEmployeeMinimumProfile(employeeSlno).subscribe(data => {

        this.employeeProfile = data;
      });
    }


  }

  /**
   * Toggle the menu bar when having mobile screen
   */
  toggleMobileMenu(event: any) {
    event.preventDefault();
    this.mobileMenuButtonClicked.emit();
    if (document.documentElement.getAttribute('data-layout') === "twocolumn") {
      document.body.classList.contains('twocolumn-panel') ? document.body.classList.remove('twocolumn-panel') : document.body.classList.add('twocolumn-panel');
    }
  }

  /**
   * Fullscreen method
   */
  fullscreen() {
    document.body.classList.toggle('fullscreen-enable');
    if (
      !document.fullscreenElement && !this.element.mozFullScreenElement &&
      !this.element.webkitFullscreenElement) {
      if (this.element.requestFullscreen) {
        this.element.requestFullscreen();
      } else if (this.element.mozRequestFullScreen) {
        /* Firefox */
        this.element.mozRequestFullScreen();
      } else if (this.element.webkitRequestFullscreen) {
        /* Chrome, Safari and Opera */
        this.element.webkitRequestFullscreen();
      } else if (this.element.msRequestFullscreen) {
        /* IE/Edge */
        this.element.msRequestFullscreen();
      }
    } else {
      if (this.document.exitFullscreen) {
        this.document.exitFullscreen();
      } else if (this.document.mozCancelFullScreen) {
        /* Firefox */
        this.document.mozCancelFullScreen();
      } else if (this.document.webkitExitFullscreen) {
        /* Chrome, Safari and Opera */
        this.document.webkitExitFullscreen();
      } else if (this.document.msExitFullscreen) {
        /* IE/Edge */
        this.document.msExitFullscreen();
      }
    }
  }

  /**
  * Topbar Light-Dark Mode Change
  */
  changeMode(mode: string) {
    this.mode = mode;
    this.eventService.broadcast('changeMode', mode);

    switch (mode) {
      case 'light':
        document.body.setAttribute('data-layout-mode', "dark");
        document.body.setAttribute('data-sidebar', "dark");
        break;
      case 'dark':
        document.body.setAttribute('data-layout-mode', "dark");
        document.body.setAttribute('data-sidebar', "dark");
        break;
      default:
        document.body.setAttribute('data-layout-mode', "dark");
        break;
    }
  }

  /***
   * Language Listing
   */
  listLang = [
    { text: 'English', flag: 'assets/images/flags/us.svg', lang: 'en' },
    { text: 'Española', flag: 'assets/images/flags/spain.svg', lang: 'es' },
    { text: 'Deutsche', flag: 'assets/images/flags/germany.svg', lang: 'de' },
    { text: 'Italiana', flag: 'assets/images/flags/italy.svg', lang: 'it' },
    { text: 'русский', flag: 'assets/images/flags/russia.svg', lang: 'ru' },
    { text: '中国人', flag: 'assets/images/flags/china.svg', lang: 'ch' },
    { text: 'français', flag: 'assets/images/flags/french.svg', lang: 'fr' },
  ];

  /***
   * Language Value Set
   */
  setLanguage(text: string, lang: string, flag: string) {
    this.countryName = text;
    this.flagvalue = flag;
    this.cookieValue = lang;
    this.languageService.setLanguage(lang);
  }

  /**
   * Logout the user
   */
  logout() {
    this.storageService.clear();
    this.router.navigate(['/account/login']);
  }

  gotoProfile() {
    this.router.navigate(['/portal/profile']);
  }

  gotoHelpDocuments() {
    this.router.navigate(['/portal/downloads/help-documents']);
  }

  gotoSettings() {
    this.router.navigate(['/portal/settings']);
  }

  gotoLockScreen() {
    this.router.navigate(['/account/lockscreen']);
  }
  onMarkAsRead(item: any){
    if(item.hasOwnProperty('notificationType') && item.notificationType == 'Leave'){
      this.openLeave(item);
    }
  }
  openLeave(item: any) {
    const modalRef = this.modalService.open(ApproveLeaveComponent, { size: 'lg', centered: true, backdrop: 'static', backdropClass: 'customBackdrop' });
    modalRef.componentInstance.selectedRowData = item;
    modalRef.componentInstance.visibleButton = this.employeeProfile.EmployeeSlno == item?.employeeSno ? this.leaveAction.view:this.leaveAction.approveOrReject;
    modalRef.result.then(() => {
      // this.refreshData = true;
    });
  }
}
