import { FileUpload } from "../file-upload/file-upload.model";

export class HouseRentAllowanceFile {

  constructor(){
    this.TdsHRAFileSLNo=0
    this.TdsHRASLNo=0;
    this.FileName='';
    this.FileName_Original='';
    this.FilePath='';
    this.Status=false;
    this.FileToUpload=new FileUpload();
  }
    public TdsHRAFileSLNo: number;
    public TdsHRASLNo: number;
    public FileName: string;
    public FileName_Original: string;
    public FilePath: string;
    public Status: boolean;
    public FileToUpload: FileUpload;

}
