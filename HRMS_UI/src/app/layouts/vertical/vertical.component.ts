import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Component, OnInit, OnDestroy } from '@angular/core';
// import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { finalize } from 'rxjs/operators';
import { LeaveManagementService } from 'src/app/core/services/leave-management';
import Swal from 'sweetalert2';
import { SiteNotificationsService } from 'src/app/core/services/site-notifications';
import { StorageService } from 'src/app/core/services';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { VideoPlayerComponent } from 'src/app/shared/app-components/video-player/video-player.component';
import { YoutubeVideoPlayerComponent } from 'src/app/shared/app-components/youtube-video-player/youtube-video-player.component';
declare var window: any;

@Component({
  selector: 'app-vertical',
  templateUrl: './vertical.component.html',
  styleUrls: ['./vertical.component.scss']
})
export class VerticalComponent implements OnInit, OnDestroy {

  isCondensed = false;
  // public Editor = ClassicEditor;
  formModal: any;
  message: any = null;
  isSubmitted: boolean = false;
  feedback!: FormGroup;
  employeeProfile: any;
  isProcessing: boolean = false;


  constructor(
    private readonly leaveManagementService: LeaveManagementService,
    private readonly siteNotificationsService: SiteNotificationsService,
    private readonly storageService: StorageService,
    private readonly modalService: NgbModal

  ) {
    this.createForm();
  }


  ngOnInit(): void {
    document.documentElement.setAttribute('data-layout', 'vertical');
    document.documentElement.setAttribute('data-topbar', 'dark');
    document.documentElement.setAttribute('data-sidebar', 'dark');
    document.documentElement.setAttribute('data-sidebar-size', 'lg');
    document.documentElement.setAttribute('data-layout-style', 'default');
    document.documentElement.setAttribute('data-layout-mode', 'light');
    document.documentElement.setAttribute('data-layout-width', 'fluid');
    document.documentElement.setAttribute('data-layout-position', 'fixed');
    window.addEventListener('resize', function () {
      if (window.screen.width <= 767) {
        document.documentElement.setAttribute('data-sidebar-size', '');
      }
      else if (window.screen.width <= 1024) {
        document.documentElement.setAttribute('data-sidebar-size', 'sm');
      }
      else if (window.screen.width >= 1024) {
        document.documentElement.setAttribute('data-sidebar-size', 'lg');
      }
    })
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.feedback.patchValue({
      Office_Type_Slno: this.employeeProfile.OfficeTypeSlno,
      Created_by: this.employeeProfile.EmployeeSlno,
      FromEmail: this.employeeProfile.WorkEmail == null ? 'NA' : this.employeeProfile.WorkEmail
    });
    this.getNotificationMessage();
  }
  createForm() {
    this.feedback = new FormGroup({
      // Feedback_Id: new FormControl(''),
      Feedback: new FormControl('', Validators.required),
      Office_Type_Slno: new FormControl(''),
      Created_by: new FormControl(''),
      // Created_Date: new FormControl(''),
      // Display_Duration: new FormControl(''),
      // Status: new FormControl(''),
      ToEmail: new FormControl(''),
      FromEmail: new FormControl(''),
      Body: new FormControl(''),
      CCEmail: new FormControl(''),
      Subject: new FormControl(''),
    });
  }
  get f() { return this.feedback.controls; }

  /**
   * On mobile toggle button clicked
   */
  onToggleMobileMenu() {
    document.body.classList.toggle('sidebar-enable');
    const currentSIdebarSize = document.documentElement.getAttribute("data-sidebar-size");
    if (window.screen.width >= 767) {
      if (currentSIdebarSize == null) {
        (document.documentElement.getAttribute('data-sidebar-size') == null || document.documentElement.getAttribute('data-sidebar-size') == "lg") ? document.documentElement.setAttribute('data-sidebar-size', 'sm') : document.documentElement.setAttribute('data-sidebar-size', 'lg')
      } else if (currentSIdebarSize == "md") {
        (document.documentElement.getAttribute('data-sidebar-size') == "md") ? document.documentElement.setAttribute('data-sidebar-size', 'sm') : document.documentElement.setAttribute('data-sidebar-size', 'md')
      } else {
        (document.documentElement.getAttribute('data-sidebar-size') == "sm") ? document.documentElement.setAttribute('data-sidebar-size', 'lg') : document.documentElement.setAttribute('data-sidebar-size', 'sm')
      }
    }
    if (window.screen.width <= 767) {
      document.body.classList.toggle('vertical-sidebar-enable');
    }
    this.isCondensed = !this.isCondensed;
  }

  /**
   * on settings button clicked from topbar
   */
  onSettingsButtonClicked() {
    document.body.classList.toggle('right-bar-enabled');
    const rightBar = document.getElementById('theme-settings-offcanvas');
    if (rightBar != null) {
      rightBar.classList.toggle('show');
      rightBar.setAttribute('style', "visibility: visible;");

    }
  }
  hide() {
    document.body.classList.remove('right-bar-enabled');
    const rightBar = document.getElementById('theme-settings-offcanvas');
    if (rightBar != null) {
      rightBar.classList.remove('show');
      rightBar.removeAttribute('style');
    }
  }
  getNotificationMessage() {
    if (!this.message) {
      let officeTypeSlno = this.employeeProfile.OfficeTypeSlno;
      this.siteNotificationsService.getNotificationMessage(officeTypeSlno).subscribe((data: any) => {
        debugger;
        if (data) {
          if (data.IsVideo) {
            this.playVideo(data);
          }
          else {
            this.message = data;
            let today = new Date();
            let created_Date = new Date(data.Created_Date);
            created_Date.setDate(created_Date.getDate() + data.Display_Duration);
            if (created_Date >= today) {
              let formModal = new window.bootstrap.Modal(
                document.getElementById('staticBackdrop')
              );
              if (formModal) {
                document.addEventListener("keydown", function (event) {
                  // //console.log(event.which);
                  if (event.which == 13 || event.which == 27) {
                    // Escape key pressed
                    formModal.hide();
                  }
                })
              }

              formModal.show(); // show
            }
          }
        }
      })
    }

  }
  playVideo(helpItem: any) {
    debugger;
    //helpItem.VideoUrl = helpItem.Notification;
    const modalRef = this.modalService.open(YoutubeVideoPlayerComponent, { size: 'xl', centered: true, keyboard: false, backdrop: 'static', backdropClass: 'customBackdrop' });
    // let data = {
    //   title: "Organization Videos",
    //   attachment: helpItem
    // }
    modalRef.componentInstance.Title = helpItem.Notification;
    modalRef.componentInstance.VideoUrl = helpItem.VideoId;
    modalRef.result.then(() => {

    });
  }
  openFeedback() {
    this.formModal = new window.bootstrap.Offcanvas(
      document.getElementById('theme-feedback-offcanvas')
    );
    this.formModal.show(); // show
  }
  close() {
    this.createForm();
    this.hide();
    this.formModal.hide(); // closing
  }
  onSendFeedback() {
    if (this.feedback.invalid) {
      return;
    }
    this.isProcessing = true;
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    this.feedback.patchValue({
      Office_Type_Slno: this.employeeProfile.OfficeTypeSlno,
      Created_by: this.employeeProfile.EmployeeSlno,
      FromEmail: this.employeeProfile.WorkEmail == null ? 'NA' : this.employeeProfile.WorkEmail
    });
    this.siteNotificationsService.sendFeedback(this.feedback.value).pipe(finalize(() => this.isSubmitted = false)).subscribe((item: any) => {
      this.isProcessing = false;

      if (item) {
        if (item.Response) {
          this.applyLeaveSuccessMsg();
        }
        else {
          Swal.fire({
            title: 'Oops...! Something went Wrong !',
            html: '<p class="text-danger" >' + item.Message + '</p>',
            icon: 'error',
            confirmButtonColor: 'rgb(54, 69, 116)',
            confirmButtonText: 'Ok'
          });
        }
      }
      else {
        this.isProcessing = false;
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          html: 'Your feedback is not sent.',
          icon: 'error',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    }, err => {
      this.isProcessing = false;
      Swal.fire({
        title: 'Oops...! Something went Wrong !',
        html: 'Your feedback is not sent.',
        icon: 'error',
        confirmButtonColor: 'rgb(54, 69, 116)',
        confirmButtonText: 'Ok'
      });
    })
  }
  applyLeaveSuccessMsg() {
    // this.activeModal.dismiss('Saved Successfully');
    this.close();
    Swal.fire({
      title: 'Well done !',
      html: 'Aww yeah, your feedback is successfully sent.',
      icon: 'success',
      confirmButtonColor: 'rgb(54, 69, 116)',
      confirmButtonText: 'Ok'
    });
    return;
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.hide();
    // let formModal = new window.bootstrap.Modal(
    //   document.getElementById('staticBackdrop')
    // );
    // formModal.hide();
    // this.formModal.hide();
  }
}
