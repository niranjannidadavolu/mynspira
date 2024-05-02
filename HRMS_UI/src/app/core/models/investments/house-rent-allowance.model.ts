import { StateInformation } from "../states/states.models";

export class HouseRentAllowance {
    TdsHraSLNo: number;
    TdsEmpSLNo: number;
    FinSLNo: number;
    EmployeeSLNo: number;
    EmpSlNo: number;
    UniqueNo: number;
    OwnerName: string;
    OwnerPan: string;
    NoOfMonths: number;
    Amount: number;
    VerifiedAmount: number;
    State!: StateInformation;
    VerifiedRemarks: string;
    VerifiedUserSlNo: number;
    FileCount:number;

    constructor() {
        this.TdsHraSLNo = 0;
        this.TdsEmpSLNo = 0;
        this.FinSLNo = 0;
        this.EmployeeSLNo = 0;
        this.EmpSlNo = 0;
        this.UniqueNo = 0;
        this.OwnerName = '';
        this.OwnerPan = '';
        this.NoOfMonths = 0;
        this.Amount = 0;
        this.VerifiedAmount = 0;
        this.VerifiedRemarks = '';
        this.VerifiedUserSlNo = 0
        this.FileCount = 0;
    }
}