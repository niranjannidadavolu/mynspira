import { BaseBusinessEntity } from "../base-business-entity.model";
import { EmployeeInformation } from "../employee/employee-information.model";

export class UserInformation implements BaseBusinessEntity {
    EmployeeSlno: number;
    EmployeeId: string;
    CustomizedId: string;
    EmployeeName: string;
    UserName: string;
    FirstName: string;
    LastName: string;
    Password: string;
    PasswordSalt: string;
    IsFirstLogin: boolean;
    Status: number;
    LastLoginTime: string;
    EmployeeProfile: EmployeeInformation | undefined;
    Token: string;

    StatusId: number;
    StatusName: string;
    CreatedBy: number;
    CreatedDate: string;
    ModifiedBy: number;
    ModifiedDate: string;
    PhotoBinary: string;

    constructor() {
        this.EmployeeSlno = 0;
        this.EmployeeId = '';
        this.CustomizedId = '';
        this.EmployeeName = '';
        this.UserName = '';
        this.FirstName = '';
        this.LastName = '';
        this.Password = '';
        this.PasswordSalt = '';
        this.IsFirstLogin = false;
        this.Status = 0;
        this.LastLoginTime = '';
        //this.EmployeeProfile = {};
        //UserRoles: RoleInformation[];
        this.Token = '';

        this.StatusId = 0;
        this.StatusName = '';
        this.CreatedBy = 0;
        this.CreatedDate = '';
        this.ModifiedBy = 0;
        this.ModifiedDate = '';
        this.PhotoBinary = '';
    }
}