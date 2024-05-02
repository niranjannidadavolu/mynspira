import { Component, OnInit } from '@angular/core';
import CustomStore from 'devextreme/data/custom_store';

@Component({
  selector: 'app-my-time-sheet',
  templateUrl: './my-time-sheet.component.html',
  styleUrls: ['./my-time-sheet.component.scss']
})
export class MyTimeSheetComponent implements OnInit {
  myTimeSheets: any;

  constructor() { }

  ngOnInit(): void {
  }

  //Education Details  
  getMyTimeSheets() {
    // this.employeeService.getEducationDetails().subscribe(data => {
    //   this.educationData = data;
    // })
  }

  initDataSource() {
    // this.myTimeSheets = new CustomStore({
    //   key: "Slno",
    //   load: (loadOptions: any) => {
    //     //let searchCrietria = new ProductSearchCriteria();
    //     // this.searchCrietria.PageSize = loadOptions.take;
    //     // this.searchCrietria.PageIndex = (loadOptions.skip / loadOptions.take) + 1;
    //     // this.searchCrietria.Filters = JSON.stringify(loadOptions.filter);
    //     // this.searchCrietria.SortFields = JSON.stringify(loadOptions.sort);
    //     let searchControl = this.searchForm.get('searchValue');
    //     let searchValue = searchControl?.value;
    //     let searchCritera =
    //     {
    //       SearchValue: searchValue,
    //       StartIndex: loadOptions.skip + 1,
    //       EndIndex: loadOptions.skip + loadOptions.take
    //     }
    //     return this.employeeInformationService.searchEmployees(searchCritera)
    //       .toPromise()
    //       .then((data: any) => {

    //         this.users = data.Items;
    //         return {
    //           data: data.Items,
    //           totalCount: data.TotalItems,
    //           filteredCount: data.TotalItems,
    //           summary: null,
    //           groupCount: null
    //         };
    //       })
    //       .catch(() => { throw 'Data Loading Error' });
    //   },
    //   insert: () => {
    //     return of(null).toPromise();
    //   },
    //   update: () => {
    //     return of(null).toPromise();
    //   }
    // });
  }

}
