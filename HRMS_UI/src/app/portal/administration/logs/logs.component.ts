import { Component, OnInit } from '@angular/core';
import { ErrorLogService } from 'src/app/core/services';
import { saveAs as importedSaveAs } from 'file-saver';
import { LogFolders } from 'src/app/core/enum/application-enums';
import { HttpEventType, HttpResponse } from '@angular/common/http';
@Component({
  selector: 'app-logs',
  templateUrl: './logs.component.html',
  styleUrls: ['./logs.component.scss']
})
export class LogsComponent implements OnInit {
  breadCrumbItems!: Array<{}>;
  values: any;
  fileUrl: string = '';
  filterSettings: any;
  pageSettings: any;
  loadingIndicator: any;
  constructor(
    private readonly errorLogService: ErrorLogService) {
    this.getErrorLogs();
  }
  helpDocuments: any = [];
  logFolders = LogFolders;
  ngOnInit(): void {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Logs', active: true }
    ];
    this.filterSettings = { type: 'Menu' };
    this.pageSettings = { pageSize: 10 };
    this.loadingIndicator = { indicatorType: 'Shimmer' };
  }
  getErrorLogs() {
    this.errorLogService.getAllLogs().subscribe((data: any) => {
      this.helpDocuments = data;
    });
  }
  downloadDocument(item: any) {
    this.errorLogService.download(item).subscribe((event) => {
      if (event.type === HttpEventType.Response) {
        this.downloadFile(event);
      }
    });
  }
  downloadFile = (data: any) => {
    const downloadedFile: BlobPart = new Blob([data.body], { type: data.body.type });
    const a = document.createElement('a');
    a.setAttribute('style', 'display:none;');
    document.body.appendChild(a);
    a.download = this.fileUrl;
    a.href = URL.createObjectURL(downloadedFile);
    a.target = '_blank';
    a.click();
    document.body.removeChild(a);
  }
}
