import { AfterViewInit, ChangeDetectorRef, Component } from '@angular/core';
import { LoaderService } from 'src/app/core/services/helper/loader-service.service';

@Component({
  selector: 'app-loading',
  templateUrl: './loading.component.html',
  styleUrls: ['./loading.component.css']
})
export class LoadingComponent implements AfterViewInit  {

  loading: boolean = false;

  constructor(private loaderService: LoaderService,private cdRef : ChangeDetectorRef) {
    this.loading = false;
    

  }
  ngAfterViewInit(): void {
    this.loaderService.isLoading.subscribe((v) => {
      this.loading = v;
      this.cdRef.detectChanges(); 
    });
    
  }
}