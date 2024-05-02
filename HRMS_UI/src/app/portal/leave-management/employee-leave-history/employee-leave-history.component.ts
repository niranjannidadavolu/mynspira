import { Component, Input, OnDestroy, OnInit, ViewChild } from "@angular/core";
import { NgbActiveModal } from "@ng-bootstrap/ng-bootstrap";
import { DxDataGridComponent } from "devextreme-angular";
import { LeaveManagementService } from "src/app/core/services/leave-management";

@Component({
  selector: "app-employee-leave-history",
  templateUrl: "./employee-leave-history.component.html",
  styleUrls: ["./employee-leave-history.component.scss"],
})
export class EmployeeLeaveHistoryComponent implements OnInit, OnDestroy {
  @ViewChild("leaveHistory", { static: false }) leaveHistory:
    | DxDataGridComponent
    | undefined;
  @Input() public selectedRowData: any;
  myLeaves: any;

  constructor(
    private readonly leaveService: LeaveManagementService,
    public activeModal: NgbActiveModal
  ) {}
  ngOnInit(): void {
    this.getMyLeaves();
  }
  getMyLeaves() {
    this.leaveService
      .getMyLeaves(this.selectedRowData.EmployeeSlno, 0, true)
      .subscribe((data) => {
        this.myLeaves = data;
        if (this.leaveHistory) {
          this.leaveHistory.instance.refresh();
        }
      });
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
