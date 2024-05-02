import { Component, Input, OnInit } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-video-player',
  templateUrl: './video-player.component.html',
  styleUrls: ['./video-player.component.scss']
})
export class VideoPlayerComponent implements OnInit {

  @Input() public VideoUrl: any;
  @Input() public Title: any;

  constructor(
    public activeModal: NgbActiveModal
  ) { }

  ngOnInit(): void {
  }
  onClose() {
    this.activeModal.dismiss('Cross click');
  }
}
