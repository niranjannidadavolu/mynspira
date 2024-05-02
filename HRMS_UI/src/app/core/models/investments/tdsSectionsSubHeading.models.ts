import { TdsSubHeadingDetails } from "./subHeading.models";

export class TdsSectionsSubHeadings {

    constructor(SectionSlNo: number, Name: string, TdsSubHeadingsDetails: TdsSubHeadingDetails) {
        this.SectionSlNo = SectionSlNo;
        this.Name = Name;
        this.TdsSubHeadingsDetails = TdsSubHeadingsDetails;
    }

    SectionSlNo?: number;
    Name?: string;
    TdsSubHeadingsDetails?: TdsSubHeadingDetails;
}
