import { Component, OnInit, Input, OnDestroy } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-employee-holidays',
  templateUrl: './employee-holidays.component.html',
  styleUrls: ['./employee-holidays.component.scss']
})
export class EmployeeHolidaysComponent implements OnInit , OnDestroy{
@Input() holidays: any;
  constructor(
    public activeModal: NgbActiveModal,

  ) { }

  ngOnInit(): void {
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
