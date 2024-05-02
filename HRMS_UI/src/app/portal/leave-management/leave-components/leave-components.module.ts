import { NgModule } from "@angular/core";
import { ApplyCasualLeaveComponent } from "./apply-casual-leave/apply-casual-leave.component";
import { ApplyMarriageLeaveComponent } from "./apply-marriage-leave/apply-marriage-leave.component";
import { ApplyMaternityLeaveComponent } from "./apply-maternity-leave/apply-maternity-leave.component";
import { ApplyPaternityLeaveComponent } from "./apply-paternity-leave/apply-paternity-leave.component";
import { ApplySessionBreakLeaveComponent } from "./apply-session-break-leave/apply-session-break-leave.component";
import { ApplySickLeaveComponent } from "./apply-sick-leave/apply-sick-leave.component";
import { DatePickerAllModule } from "@syncfusion/ej2-angular-calendars";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import { CommonModule } from "@angular/common";
import { SharedModule } from "src/app/shared/shared.module";

@NgModule({
    declarations: [
        ApplySessionBreakLeaveComponent,
        ApplyCasualLeaveComponent,
        ApplySickLeaveComponent,
        ApplyMarriageLeaveComponent,
        ApplyMaternityLeaveComponent,
        ApplyPaternityLeaveComponent
    ],
    imports: [
        CommonModule,
        SharedModule,
        DatePickerAllModule,
        FormsModule,
        ReactiveFormsModule
    ],
    exports: [
        ApplySessionBreakLeaveComponent,
        ApplyCasualLeaveComponent,
        ApplySickLeaveComponent,
        ApplyMarriageLeaveComponent,
        ApplyMaternityLeaveComponent,
        ApplyPaternityLeaveComponent
    ],
    providers: []
})
export class LeaveComponentsModule {

}
