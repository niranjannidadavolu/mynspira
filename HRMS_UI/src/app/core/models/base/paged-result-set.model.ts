
export class PagedResultSet<T> {
    Items: T[];
    FilteredCount: number;
    TotalItems: number;
    PageIndex: number;
    PageSize: number;
    constructor() {
        this.Items = [];
        this.FilteredCount = 0;
        this.TotalItems = 0;
        this.PageIndex = 0;
        this.PageSize = 0;
    }
}