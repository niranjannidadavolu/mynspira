import { Component, Input, OnInit } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-play-video',
  templateUrl: './play-video.component.html',
  styleUrls: ['./play-video.component.scss']
})
export class PlayVideoComponent implements OnInit {

  @Input() public fileData: any;
  VideoUrl: any;
  Title: any;
  constructor(
    public activeModal: NgbActiveModal
  ) { }

  ngOnInit(): void {
    if (this.fileData) {
      this.Title = this.fileData.title,
      this.VideoUrl = this.fileData.attachment.FilePath;
    }
  }

  onClose() {
    this.activeModal.dismiss('Cross click');
  }

}
