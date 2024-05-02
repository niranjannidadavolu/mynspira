export class MandalsDetails {
    MandalSLNo?: number;
    DistrictSLNo?: number;
    StateSLNo?: number;
    Name?: string;

    constructor(MandalSLNo: any, name: any) {
        this.MandalSLNo = MandalSLNo;
        this.Name = name;
    }
}