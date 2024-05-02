import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-car-lease',
  templateUrl: './car-lease.component.html',
  styleUrls: ['./car-lease.component.scss']
})
export class CarLeaseComponent implements OnInit {
  breadCrumbItems!: Array<{}>;
  

  constructor() {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Car Lease', active: true }
    ];
   }

  ngOnInit(): void {
  }
  
}


