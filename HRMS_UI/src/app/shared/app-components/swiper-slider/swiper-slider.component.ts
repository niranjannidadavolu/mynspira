import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-swiper-slider',
  templateUrl: './swiper-slider.component.html',
  styleUrls: ['./swiper-slider.component.scss']
})
export class SwiperSliderComponent implements OnInit, OnDestroy {
  @Input() public attchmentmentDetails: any;
  isaccept = true;
  public document = 'https://cdn.syncfusion.com/content/pdf/pdf-succinctly.pdf';
  public resource: string = "https://cdn.syncfusion.com/ej2/23.1.40/dist/ej2-pdfviewer-lib";
  activeIndex = 0;
  // currentVideo = this.videoItems[this.activeIndex];
  data: any;
  currentItem: any;
  currentIndex: any;
  disablePrevious: boolean;
  disableNext: boolean;
  isImage: any;
  isDocument: any;
  isVideo: any;
  constructor(
    public activeModal: NgbActiveModal) {
    this.currentIndex = 0;
    this.disablePrevious = true;
    this.disableNext = false;
  }

  ngOnInit(): void {
    
    //console.log(JSON.stringify(this.attchmentmentDetails));
    if (this.attchmentmentDetails) {
      this.getFileItem();
    }
    if (this.attchmentmentDetails.accept) {
      this.isaccept = false;
    }
  }
  /**
    * Swiper Nav&Pagination setting
    */
  NavAndPaginatoion = {
    initialSlide: 0,
    slidesPerView: 1,
    pagination: true,
    navigation: true
  };

  checkIsDocument(path: any) {
    let type = path.split('?')[0].split('.').pop();
    if (type == 'pdf' || type == 'docx' || type == 'doc') {
      this.isDocument = true;
    }
  }

  checkIsImage(path: any) {
    let type = path.split('?')[0].split('.').pop();
    if (type == 'jpg' || type == 'png' || type == 'jpeg') {
      this.isImage = true;
    }
  }

  // checkFileType(path: any) {
  //   let type = path.split('?')[0].split('.').pop();
  //   if (type == 'pdf' || type == 'docx' || type == 'doc') {
  //     this.isImage = false;
  //     this.isVideo = true;
  //     this.isDocument = false;
  //   }
  // }
  checkVideoFileType(path: any) {
    let type = path.split('?')[0].split('.').pop();
    if (type == 'mp4') {
      this.isVideo = true;
    }
  }
  getFileItem() {
    this.isImage = false;
    this.isDocument = false;
    this.isVideo = false;
    if (this.attchmentmentDetails.attachments) {
      this.currentItem = this.attchmentmentDetails.attachments[this.currentIndex];
      this.checkIsImage(this.currentItem.FileName);
      this.checkIsDocument(this.currentItem.FileName);
      this.checkVideoFileType(this.currentItem.FileName);

    }
  }
  previousClick() {
    this.currentIndex = this.currentIndex - 1;
    if (this.currentIndex >= 0) {
      if (this.attchmentmentDetails.attachments) {
        this.getFileItem();
      }
    }
    this.disableNext = false;
    if (this.currentIndex <= 0) {
      this.disablePrevious = true;
    }
    else {
      this.disablePrevious = false;
    }
  }
  nextClick() {
    
    this.currentIndex = this.currentIndex + 1;
    if (this.currentIndex <= this.attchmentmentDetails.attachments.length) {
      if (this.attchmentmentDetails) {
        this.getFileItem();
      }
    }
    this.disablePrevious = false;
    if (this.currentIndex >= (this.attchmentmentDetails.attachments.length - 1)) {
      this.disableNext = true;
    }
  }
  onClose() {
    if (this.isaccept) {
      this.activeModal.dismiss('Cross click');
    } else {
      Swal.fire({
        icon: 'info',
        title: 'Oops...',
        html: 'Please read the document & click on check box to accept to confirm this document',
        // footer: 'Please accept to confirm this document'
      });
    }
  }
  videoPlayerInit(data: any) {
    this.data = data;
    this.data.getDefaultMedia().subscriptions.loadedMetadata.subscribe(this.initVdo.bind(this));
    this.data.getDefaultMedia().subscriptions.ended.subscribe(this.nextVideo.bind(this));
  }
  // getVideoLink(path: any){
  //   let data = path.split('http:');
  //   return 'http:'+data[2];
  // }
  nextVideo() {
    this.activeIndex++;
    // if (this.activeIndex === this.videoItems.length) {
    //   this.activeIndex = 0;
    // }
    // this.currentVideo = this.videoItems[this.activeIndex];
  }
  initVdo() {
    this.data.play();
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
