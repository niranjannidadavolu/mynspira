import { ChangeDetectorRef, Component, Input, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { saveAs as importedSaveAs } from 'file-saver';
import { Chapter6FileDetails } from 'src/app/core/models/investment-proofs/chapter6-file-model';
import { InvestmentProofsService } from 'src/app/core/services/investment-proofs';
import Swal from 'sweetalert2';
import { finalize } from 'rxjs/operators';
import { FileUpload } from 'src/app/core/models/file-upload/file-upload.model';

@Component({
  selector: 'upload-chapter6-proofs',
  templateUrl: './upload-chapter6-proofs.component.html',
  styleUrls: ['./upload-chapter6-proofs.component.scss']
})
export class UploadChapter6ProofsComponent implements OnInit, OnDestroy {
  @Input() public chapter6Details:any;
  uploadForm: FormGroup;
  isSubmitted:boolean;
  chapter6Files:any[];
  processing: boolean; 
  chapter6DetailId:number;
  fileUpload:FileUpload;

  constructor(
    private readonly investmentProofsService: InvestmentProofsService,
    private formBuilder: FormBuilder,
    public activeModal: NgbActiveModal,
    private cdr: ChangeDetectorRef) { 
    this.uploadForm = this.formBuilder.group({      
      file: ['', [Validators.required]]
  }); 
  this.isSubmitted=false;
  this.chapter6Files=[];
  this.processing=false;
  this.chapter6DetailId=0;
  this.fileUpload = new FileUpload();
  }

  ngOnInit(): void {
    this.chapter6DetailId =(this.chapter6Details.Chapter6DetailId || 0)
    this.getChapter6Files(this.chapter6DetailId);
  }
  ngAfterViewChecked(){
    //your code to update the model
    this.downloadFile = this.downloadFile.bind(this);

    this.cdr.detectChanges();
 }
  get f() { return this.uploadForm.controls; }
  onFileChange(event: any) {
    const reader = new FileReader();
    if (event.value.length && event.value.length > 0) {
      reader.readAsDataURL(event.value[0]);
      reader.onload = () => {
        if (reader != null && reader.result != null) {
          this.fileUpload.fileName = event.value[0].name;;
          this.fileUpload.fileSize =  event.value[0].size;
          this.fileUpload.fileType =  event.value[0].type;
          this.fileUpload.lastModifiedTime =  event.value[0].lastModified;
          this.fileUpload.lastModifiedDate =  event.value[0].lastModifiedDate;
          this.fileUpload.fileAsBase64 = reader.result.toString();
        }
      }
    }
  }

  onSubmit(){
    this.isSubmitted = true;
    let chapter6FileDetails = new Chapter6FileDetails();
    chapter6FileDetails.FileToUpload =this.fileUpload;
    chapter6FileDetails.TdsEmpSHSLNo=this.chapter6DetailId;
    chapter6FileDetails.FileName_Original=(this.fileUpload.fileName ||'' );
         this.investmentProofsService.uploadChapter6File(chapter6FileDetails)
         .pipe(finalize(() => this.isSubmitted = false))
         .subscribe((data: any) => {
           if (data) {
  this.fileUpload = new FileUpload();
  this.uploadForm.controls['file'].patchValue([]);
             Swal.fire({
               title: 'Well done !',
               text: `Aww yeah, ${this.chapter6Details.Particulars} document is successfully saved.`,
               icon: 'success',
               confirmButtonColor: 'rgb(54, 69, 116)',
               confirmButtonText: 'Ok'
             }).then(() => {
              this.investmentProofsService.sendRefreshRquest(true);
              this.getChapter6Files(this.chapter6DetailId);
             });
           }
           else {
             Swal.fire({
               title: 'Oops...! Something went Wrong !',
               text: `${this.chapter6Details.Particulars} document is not Saved.`,
               icon: 'warning',
               confirmButtonColor: 'rgb(54, 69, 116)',
               confirmButtonText: 'Ok'
             }).then(()=>{
               this.isSubmitted = false;
             });
           }
         });
  }

  downloadFile(e:any){
    let filePath =e.row.data.FilePath
    if(filePath){
      this.investmentProofsService.downloadFile(filePath)
      .pipe()
      .subscribe((data: any) => {
        importedSaveAs(data,e.row.data.FileName_Original);
      });
    }
  }

  getChapter6Files = (chapter6DetailId:number) => {
    this.processing = false;
    this.investmentProofsService.getChapt6Files(chapter6DetailId).subscribe((data: any[]) => {
      if (data) {
        this.chapter6Files = data;
      }
      else {
        this.chapter6Files = [];;
      }
      this.processing = true;
    });
  }

  deleteChapter6File(event: any) {
    let rowData = event.data;
    let fileId = rowData.TdsEmpSHFileSLNo;
    this.investmentProofsService.removeChapt6File(fileId).subscribe((data: any) => {
      if (data) {
        Swal.fire({
          title: 'Well done !',
          text: `Aww yeah, ${rowData.FileName_Original} file is successfully deleted.`,
          icon: 'success',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        }).then((result) => {
          this.investmentProofsService.sendRefreshRquest(true);
          this.getChapter6Files(this.chapter6DetailId);
        });
      }
      else {
        Swal.fire({
          title: 'Oops...! Something went Wrong !',
          text: `${rowData.FileName_Original} file is not deleted.`,
          icon: 'warning',
          confirmButtonColor: 'rgb(54, 69, 116)',
          confirmButtonText: 'Ok'
        });
      }
    });
  }
  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.activeModal.dismiss();
  }
}
