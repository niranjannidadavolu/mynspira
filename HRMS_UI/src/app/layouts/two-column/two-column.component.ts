import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-two-column',
  templateUrl: './two-column.component.html',
  styleUrls: ['./two-column.component.scss']
})

/**
 * TwoColumnComponent
 */
export class TwoColumnComponent implements OnInit {

  constructor() { }
  isCondensed = false;

  ngOnInit(): void {
    document.documentElement.setAttribute('data-layout', 'twocolumn');
    document.documentElement.setAttribute('data-topbar', 'light');
    document.documentElement.setAttribute('data-sidebar', 'light');
    document.documentElement.setAttribute('data-sidebar-size', 'lg');
    document.documentElement.setAttribute('data-layout-style', 'default');
    document.documentElement.setAttribute('data-layout-mode', 'light');
    document.documentElement.setAttribute('data-layout-width', 'fluid');
    document.documentElement.setAttribute('data-layout-position', 'fixed');
  }

  /**
   * On mobile toggle button clicked
   */
   onToggleMobileMenu() {
    document.body.classList.toggle('twocolumn-panel');
  }

  /**
   * on settings button clicked from topbar
   */
   onSettingsButtonClicked() {
    document.body.classList.toggle('right-bar-enabled');
    const rightBar = document.getElementById('theme-settings-offcanvas');
    if(rightBar != null){
      rightBar.classList.toggle('show');
      rightBar.setAttribute('style',"visibility: visible;");
    }
  }

}
