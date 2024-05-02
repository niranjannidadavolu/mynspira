import { FileUpload } from "../file-upload/file-upload.model";
export class OtherIncomeFile{

    constructor(){
        this.TdsEmpOIFileSLNo=0
        this.TdsEmpOISLNo=0;
        this.FileName='';
        this.FileName_Original='';
        this.FilePath='';
        this.Status=false;
        this.FileToUpload=new FileUpload();
      }
        public TdsEmpOIFileSLNo: number;
        public TdsEmpOISLNo: number;
        public FileName: string;
        public FileName_Original: string;
        public FilePath: string;
        public Status: boolean;
        public FileToUpload: FileUpload;
}