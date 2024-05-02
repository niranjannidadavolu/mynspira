import { filter } from 'rxjs/operators';
import { Component, OnInit } from '@angular/core';
import { UserInformation } from 'src/app/core/models';
import { EmployeeService, HelpDocuments, StorageService } from 'src/app/core/services';
import { saveAs as importedSaveAs } from 'file-saver';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { SwiperSliderComponent } from 'src/app/shared/app-components/swiper-slider/swiper-slider.component';
import { PlayVideoComponent } from './play-video/play-video.component';

@Component({
  selector: 'app-help-documents',
  templateUrl: './help-documents.component.html',
  styleUrls: ['./help-documents.component.scss']
})
export class HelpDocumentsComponent implements OnInit {

  searchTerm: any;
  // bread crumb items
  breadCrumbItems!: Array<{}>;
  loggedInUser: UserInformation;
  helpDocuments: any;
  pdfSrc: any;
  years: any[] = [];
  profile: any;

  public Collapsed = false;
  public HCollapsed = false;
  public DownCollapsed = false;
  public FilterCollapsed = false;
  public InlineCollapsed = false;
  public BlockCollapsed = false;
  public firstColleaps = false;
  public secondColleaps = false;
  public bothColleaps = false;
  employeeProfile: any;
  helpVideos: any;

  constructor(private readonly storageService: StorageService, private employeeService: EmployeeService, private readonly helpDocumentsService: HelpDocuments,
    private readonly modalService: NgbModal) {
    this.loggedInUser = JSON.parse(this.storageService.get("LoggedInUser", 1));
    this.employeeProfile = JSON.parse(this.storageService.get("EmployeeProfile", 1));
  }

  ngOnInit(): void {
    this.breadCrumbItems = [
      { label: 'ESSP' },
      { label: 'Help Documents', active: true }
    ];
    this.getHelpDocuments();
  }

  // Getting all help documents
  getHelpDocuments() {
    this.helpDocumentsService.getHelpDocuments(this.employeeProfile.OfficeTypeSlno).subscribe(data => {
      this.helpDocuments = data.filter((s: any) => s.DocType == 1);
      this.helpVideos = data.filter((s: any) => s.DocType == 2);
    });
  }

  //Download help documents into local
  downloadDocument(helpItem: any) {
    helpItem.EmployeeSlno = this.loggedInUser.EmployeeSlno;
    this.helpDocumentsService.downloadDocument(helpItem).pipe().subscribe(data => {
      let fileName = helpItem.FileName;
      importedSaveAs(data, fileName);
    });
  }
  playVideo(item: any) {
    let helpItem = JSON.parse(JSON.stringify(item));
    helpItem.FilePath = helpItem.FilePath;
    const modalRef = this.modalService.open(PlayVideoComponent, { size: 'xl', centered: true, keyboard: false, backdrop: 'static', backdropClass: 'customBackdrop' });
    let data = {
      title: helpItem.FileDisplayName,
      attachment: helpItem
    }
    modalRef.componentInstance.fileData = data;
    modalRef.result.then(() => {

    });
  }
  previewDocument(item: any, isAccept: boolean) {
    let helpItem = JSON.parse(JSON.stringify(item));
    helpItem.FilePath = helpItem.FilePath;
    const modalRef = this.modalService.open(SwiperSliderComponent, { size: 'lg', centered: true, keyboard: false, backdrop: 'static', backdropClass: 'customBackdrop' });
    let data = {
      accept: isAccept,
      title: helpItem.FileDisplayName,
      attachments: [
        {
          ...helpItem,
        }
      ]
    }
    modalRef.componentInstance.attchmentmentDetails = data;
    modalRef.result.then(() => {

    },
      (reason) => {
        let closeResult = `Dismissed ${this.getDismissReason(reason)}`;
      });
  }
  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }
}
