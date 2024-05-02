import { Component, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { ControlValueAccessor } from '@angular/forms';
import { DxDataGridComponent } from 'devextreme-angular';

@Component({
  selector: 'app-special-casual-leave',
  templateUrl: './special-casual-leave.component.html',
  styleUrls: ['./special-casual-leave.component.scss']
})
export class SpecialCasualLeaveComponent implements OnInit {

  @ViewChild(DxDataGridComponent, { static: false }) dataGrid!: DxDataGridComponent;
  @Input() entitlements: any;
  @Output() entitlementsChange: EventEmitter<any> = new EventEmitter<any>();
  
  allMode: any;
  checkBoxesMode: any;
  editMode: any = 'row';
  editDateMode: any = false;

  iterableDiffer: any;
  onChange = (value: any) => { };
  onTouched = () => { };
  
  constructor() {
    this.allMode = 'allPages';
    this.checkBoxesMode = 'always';
   }

   writeValue(obj: any): void {
    if (obj) {
      this.entitlements = [];
      this.entitlements = JSON.parse(JSON.stringify(obj));
    }
  }
  registerOnChange(fn: any): void {
    this.onChange = fn;
  }
  registerOnTouched(fn: any): void {
    this.onTouched = fn;
  }
  setDisabledState?(isDisabled: boolean): void {
    throw new Error('Method not implemented.');
  }

  ngDoCheck() {
    this.onChange(this.entitlements);
  }

  ngOnInit(): void {
  }

  changeValue() {
    this.entitlementsChange.emit(this.entitlements);
  }

  updateRow(e: any) {
    
    let data = this.dataGrid.instance.getSelectedRowsData();
    let foundIndex = data.findIndex(x => x.EmployeeSlno == e.changes[0].key);
    if (foundIndex < 0) {
      this.dataGrid.instance.selectRows(e.changes[0].key, true);
    }
  }

}
