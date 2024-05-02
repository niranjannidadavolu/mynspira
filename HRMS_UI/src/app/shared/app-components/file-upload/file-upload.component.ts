import { Component, OnInit, Output, EventEmitter, Input } from '@angular/core';

@Component({
  selector: 'app-file-upload',
  templateUrl: './file-upload.component.html',
  styleUrls: ['./file-upload.component.scss']
})
export class FileUploadComponent implements OnInit {
  result: any = [];
  @Output() onValueChanged =  new EventEmitter();
  @Output() onValueRemoved=  new EventEmitter();
  @Input() isMultiple = false;
  @Input() labelName: string = '';

  constructor() { }

  ngOnInit(): void {
  }
  save(event: any): void {
    var selectedFiles = event.target.files;
    this.onValueChanged.emit(selectedFiles);
    for (var i = 0; i < selectedFiles.length; i++) {
      let obj ={
        fileName: selectedFiles[i].name,
        fileSize: selectedFiles[i].size,
        fileConvertSize: this.formatBytes(selectedFiles[i].size,2),
        fileType: selectedFiles[i].type
      }
      this.result.push(obj);
    }
  }
  formatBytes(bytes: any, decimals = 2) {
    if (!+bytes) return '0 Bytes'
    const k = 1024
    const dm = decimals < 0 ? 0 : decimals
    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB']
    const i = Math.floor(Math.log(bytes) / Math.log(k))
    return `${parseFloat((bytes / Math.pow(k, i)).toFixed(dm))} ${sizes[i]}`
}
removeFile(index: any){
  this.result.splice(index, 1);
  this.onValueRemoved.emit(index);
}
}
