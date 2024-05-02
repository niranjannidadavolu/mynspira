import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-group-medi-claim',
  templateUrl: './group-medi-claim.component.html',
  styleUrls: ['./group-medi-claim.component.scss']
})
export class GroupMediClaimComponent implements OnInit {

  breadCrumbItems!: Array<{}>;

  constructor() { 
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Group Medi Claim', active: true }
    ];}

  ngOnInit(): void {
  }

}
