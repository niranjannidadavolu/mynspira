import { Component, Input, OnInit } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-youtube-video-player',
  templateUrl: './youtube-video-player.component.html',
  styleUrls: ['./youtube-video-player.component.scss']
})
export class YoutubeVideoPlayerComponent implements OnInit {

  @Input() public VideoId: any;
  @Input() public Title: any;
  playerVars: any;
  constructor(
    public activeModal: NgbActiveModal
  ) {
    this.playerVars = {
      'autoplay': 1,
      'controls': 0,
      'autohide': 1,
      'wmode': 'opaque',
      'origin': 'http://localhost:5100'
    }
  }

  ngOnInit(): void {
  }

  onClose() {
    this.activeModal.dismiss('Cross click');
  }

}
