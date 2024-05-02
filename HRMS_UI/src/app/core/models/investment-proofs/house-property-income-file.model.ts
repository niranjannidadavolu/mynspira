import { FileUpload } from "../file-upload/file-upload.model";

export class HousePropertyIncomeFile {

  constructor(){
    this.TdsEmpHIFileSLNo=0
    this.TdsEmpHISLNo=0;
    this.FileName='';
    this.FileName_Original='';
    this.FilePath='';
    this.Status=false;
    this.FileToUpload=new FileUpload();
  }
    public TdsEmpHIFileSLNo: number;
    public TdsEmpHISLNo: number;
    public FileName: string;
    public FileName_Original: string;
    public FilePath: string;
    public Status: boolean;
    public FileToUpload: FileUpload;

}
