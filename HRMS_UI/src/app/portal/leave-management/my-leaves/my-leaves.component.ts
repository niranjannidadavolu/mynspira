import { Component, OnInit } from '@angular/core';

import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-my-leaves',
  templateUrl: './my-leaves.component.html',
  styleUrls: ['./my-leaves.component.scss']
})
export class MyLeavesComponent implements OnInit {
  refreshData: boolean = false;
  breadCrumbItems: ({ label: string; active?: undefined; } | { label: string; active: boolean; })[];

  constructor(private modalService: NgbModal) {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'My Leaves', active: true }
    ];

  }

  ngOnInit(): void {
  }





}
