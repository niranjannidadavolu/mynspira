import { Component, OnInit } from '@angular/core';
import { DocumentManagementService, StorageService } from 'src/app/core/services';

@Component({
  selector: 'app-my-documents',
  templateUrl: './my-documents.component.html',
  styleUrls: ['./my-documents.component.scss']
})
export class MyDocumentsComponent implements OnInit {

  fileItems: any = [];
  breadCrumbItems: any;
  constructor(
    private readonly documentManagementService: DocumentManagementService,
    private readonly storageService: StorageService) {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'My Documents', active: true }
    ];
  }

  ngOnInit(): void {
    this.getFiles();
  }
  getFiles() {
    let employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
    let employeeid = employeeProfile.EmpId;
    this.documentManagementService.getAllFiles(employeeid).subscribe((data: any) => {
      this.fileItems = data;
    });
  }
  downloadFile(fileKey: any) {
    this.documentManagementService.downloadFile(fileKey).subscribe((res: any) => {
      const blob = new Blob([res], { type: 'application/octet-stream' });

      // Create a download link element and simulate a click to initiate the download
      const link = document.createElement('a');
      link.href = window.URL.createObjectURL(blob);
      link.download = fileKey;
      link.click();
    });
  }
  customizeIcon(fileSystemItem: any) {
    if (fileSystemItem.isDirectory) {
      return 'assets/images/thumbnails/folder.svg';
    }

    const fileExtension = fileSystemItem.getFileExtension();
    switch (fileExtension) {
      case '.png':
        return 'assets/images/thumbnails/png.svg';
      case '.jpg':
        return 'assets/images/thumbnails/jpg.svg';
      case '.jpeg':
        return 'assets/images/thumbnails/jpg.svg';
      case '.txt':
        return 'assets/images/thumbnails/doc-txt.svg';
      case '.rtf':
        return 'assets/images/thumbnails/doc-rtf.svg';
      case '.xml':
        return 'assets/images/thumbnails/doc-xml.svg';
    }
    return 'assets/images/thumbnails/pdf.svg';
  }
  
  onItemDownloading(event: any) {
    // your code
    event.cancel = true;
    this.downloadFile(event.item.key);
}

}
