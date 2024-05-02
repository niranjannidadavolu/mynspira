import { FileUpload } from "../file-upload/file-upload.model";

export class Chapter6FileDetails{
    constructor(){
        this.TdsEmpSHFileSLNo=0
        this.TdsEmpSHSLNo=0;
        this.FileName='';
        this.FileName_Original='';
        this.FilePath='';
        this.Status=false;
        this.FileToUpload=new FileUpload();
      }
        public TdsEmpSHFileSLNo: number;
        public TdsEmpSHSLNo: number;
        public FileName: string;
        public FileName_Original: string;
        public FilePath: string;
        public Status: boolean;
        public FileToUpload: FileUpload;
}