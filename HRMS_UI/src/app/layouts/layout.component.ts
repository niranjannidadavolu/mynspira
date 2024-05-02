import { AfterViewInit, Component, OnInit } from '@angular/core';
import { SignalrService } from '../core/hub/signalr.service';

import { EventService } from '../core/services/event.service';
import {
  LAYOUT_VERTICAL, LAYOUT_HORIZONTAL, LAYOUT_TWOCOLUMN, LAYOUT_MODE, LAYOUT_WIDTH,
  LAYOUT_POSITION, SIDEBAR_SIZE, SIDEBAR_COLOR, TOPBAR
} from './layout.model';

@Component({
  selector: 'app-layout',
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.scss']
})

/**
 * Layout Component
 */
export class LayoutComponent implements OnInit, AfterViewInit {

  layoutType!: string;

  constructor(private eventService: EventService,
    private readonly signalrService: SignalrService) { }

  ngOnInit(): void {
    this.layoutType = LAYOUT_VERTICAL;

     // listen to event and change the layout, theme, etc
     this.eventService.subscribe('changeLayout', (layout) => {
      this.layoutType = layout;
    });
    
  }
  
  ngAfterViewInit(): void {
    //this.signalrService.invoke()
  }
  /**
  * Check if the vertical layout is requested
  */
   isVerticalLayoutRequested() {
    return this.layoutType === LAYOUT_VERTICAL;
  }

  /**
   * Check if the horizontal layout is requested
   */
   isHorizontalLayoutRequested() {
    return this.layoutType === LAYOUT_HORIZONTAL;
  }

  /**
   * Check if the horizontal layout is requested
   */
   isTwoColumnLayoutRequested() {
    return this.layoutType === LAYOUT_TWOCOLUMN;
  }

}
