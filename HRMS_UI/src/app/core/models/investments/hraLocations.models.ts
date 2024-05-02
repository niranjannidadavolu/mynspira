export  class HRALocations{
    HRALocationSLNo:number;
    Name:string;

    constructor(locationId: any, name:any)
    {
        this.HRALocationSLNo = locationId;
        this.Name = name;
    }
}