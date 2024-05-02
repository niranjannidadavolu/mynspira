import { Component, OnInit, QueryList, ViewChildren } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { TreeviewItem } from 'ngx-treeview';
import {  RoleInformationService } from 'src/app/core/services';

@Component({
  selector: 'app-user-role-mapping',
  templateUrl: './user-role-mapping.component.html',
  styleUrls: ['./user-role-mapping.component.scss']
})
export class UserRoleMappingComponent implements OnInit {

  // bread crumb items
  breadCrumbItems!: Array<{}>;
  submitted = false;
  listJsForm!: FormGroup;
  checkedList: any;
  masterSelected!: boolean;
  searchTerm: any;
  roles: any;
  isSubmitted: boolean;
  // Table data
  ListJsList: any;
  constructor(private readonly roleInformationService: RoleInformationService) {
    this.isSubmitted = false;
  }

  items: any;

  simpleItems = {
    text: 'parent-1',
    value: 'p1',
    children: [
      {
        text: 'child-1',
        value: 'c1'
      }, {
        text: 'child-2',
        value: 'c2',
        children: [
          {
            text: 'child-1-2',
            value: 'c12'
          },
          {
            text: 'child-1-2',
            value: 'c12',
            disabled: true,
            collapsed: true,
            checked: true,
            children: [
              {
                text: 'child-1-2',
                value: 'c12'
              },
              {
                text: 'child-1-2',
                value: 'c12'
              }
            ]
          }
        ]
      },
    ]
  };

  simpleItems2 = {
    text: 'parent-2',
    value: 'p2',
    collapsed: true,
    children: [
      {
        text: 'child-1',
        value: 'c1'
      }, {
        text: 'child-2',
        value: 'c2',
        children: [
          {
            text: 'child-1-2',
            value: 'c12'
          },
          {
            text: 'child-1-2',
            value: 'c12',
            disabled: true,
            collapsed: true,
            checked: true,
            children: [
              {
                text: 'child-1-2',
                value: 'c12'
              },
              {
                text: 'child-1-2',
                value: 'c12'
              }
            ]
          }
        ]
      },
    ]
  };

  ngOnInit(): void {
    this.getActiveRoles();
  }
  getActiveRoles() {
    this.roleInformationService.getAllActiveRoles()
      .subscribe((data: any) => {
        this.roles = data;
      });
  }

  getItems(parentChildObj: any[]) {
    let itemsArray: any[] = [];
    parentChildObj.forEach(set => {
      itemsArray.push(new TreeviewItem(set))
    });
    return itemsArray;
  }

}
