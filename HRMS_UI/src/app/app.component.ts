import { Component, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { DEFAULT_INTERRUPTSOURCES, Idle } from '@ng-idle/core';
import { Keepalive } from '@ng-idle/keepalive';
import { StorageService } from './core/services';
// import { loadCldr, setCulture, setCurrencyCode, L10n } from '@syncfusion/ej2-base';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  static isChief(Position: any) {
    throw new Error('Method not implemented.');
  }
  @ViewChild('content') content: any;
  @ViewChild('content1') content1: any;
  title = 'nspira';
  idleState = 'Not started.';
  timedOut = false;
  lastPing?: Date;
  modelRef: any;
  closeResult: any;
  modalReference: any;
  modalReference1: any;
  offers: any;
  hubHelloMessage: string | undefined;

  constructor(private idle: Idle, private keepalive: Keepalive,
    private readonly storageService: StorageService,
    private router: Router, private modalService: NgbModal) {
    //loadCldr(calendar, timeZoneNames, weekData, numbers, numberingSystems, currencies);
    // setCulture('en-IN');
    // setCurrencyCode('INR');
    // sets an idle timeout of 5 seconds, for testing purposes.
    idle.setIdle(600);
    // sets a timeout period of 5 seconds. after 10 seconds of inactivity, the user will be considered timed out.
    idle.setTimeout(20);
    // sets the default interrupts, in this case, things like clicks, scrolls, touches to the document
    idle.setInterrupts(DEFAULT_INTERRUPTSOURCES);

    idle.onIdleEnd.subscribe(() => {
      this.idleState = 'No longer idle.'
      this.modalReference.close();
      this.reset();
    });

    idle.onTimeout.subscribe(() => {
      this.idleState = 'Timed out!';
      this.timedOut = true;
      let user = storageService.get('LoggedInUser', 1);
      if (user) {
        this.modalReference1.close();
        this.modalReference = this.modalService.open(this.content1);

        this.modalReference.result.then((result: any) => {

          this.logout();
          this.reset();
        }, (reason: any) => {

          this.reset();
        });
      }
    });

    idle.onIdleStart.subscribe(() => {
      this.idleState = 'You\'ve gone idle!'
      let user = storageService.get('LoggedInUser', 1);
      if (user) {
        this.modalReference1 = this.modalService.open(this.content);

        this.modalReference1.result.then((result: any) => {

          this.logout();
          this.reset();
        }, (reason: any) => {

          this.reset();
        });
      }
    });

    idle.onTimeoutWarning.subscribe((countdown) => {
      this.idleState = countdown + '';
    });

    // sets the ping interval to 15 seconds
    keepalive.interval(15);

    keepalive.onPing.subscribe(() => this.lastPing = new Date());

    this.reset();

    // Disable right-click
    // document.addEventListener('contextmenu', (e) => e.preventDefault());

    // function ctrlShiftKey(e: any, keyCode: any) {
    //   return e.ctrlKey && e.shiftKey && e.keyCode === keyCode.charCodeAt(0);
    // }

    // document.onkeydown = (e: any) => {
    //   // Disable F12, Ctrl + Shift + I, Ctrl + Shift + J, Ctrl + U
    //   if (
    //     e.keyCode === 123 ||
    //     ctrlShiftKey(e, 'I') ||
    //     ctrlShiftKey(e, 'J') ||
    //     ctrlShiftKey(e, 'C') ||
    //     (e.ctrlKey && e.keyCode === 'U'.charCodeAt(0))
    //   ){
    //     return false;  
    //   }
    //     return true;
    // };
  }

  reset() {
    this.idle.watch();
    this.idleState = 'Started.';
    this.timedOut = false;
  }
  hideChildModal(): void {
    this.modelRef.dismiss()
  }
  stay() {
    this.modelRef.hide();
    this.reset();
  }
  /**
   * Logout the user
   */
  logout() {
    this.storageService.clear();
    this.router.navigate(['/account/login']);
  }

  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }

  ngOnInit(): void {
    // ////

    // this.signalrService.hubHelloMessage.subscribe((hubHelloMessage: string) => {
    //   this.hubHelloMessage = hubHelloMessage;
    // });
    // if (this.signalrService.connection != undefined) {
    //   this.signalrService.connection
    //     .invoke('Hello')
    //     .catch(error => {
    //       alert('SignalrDemoHub.Hello() error!, see console for details.');
    //     }
    //     );
    // }


  }
}
