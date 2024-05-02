import { Byte } from "@angular/compiler/src/util";
import { FileUpload } from "../file-upload/file-upload.model";

export class UploadReimbursement {
    BillNumber:string=''
    BillDate?:Date;
    Amount: number = 0;
    FilePath?: string;
    FileName?:string;
    File?: FileUpload;
    MonthSLNo: number = 0;
    PBranchSLNo: number = 0;
    EmpSLNo: number = 0;
    UniqueNo: number = 0;
    UserSLNo: number = 0;
    HeadSLNo: number = 0;
}
