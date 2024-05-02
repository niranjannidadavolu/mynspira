
export class DistrictsDetails {
    DistrictSLNo?: number;
    StateSLNo?: number;
    Name?: string;

    constructor(districtSLNo: any, name: any) {
        this.DistrictSLNo = districtSLNo;
        this.Name = name;
        this.StateSLNo = 0;
    }
}