import { AssessmentTypeDetails } from "./assessmentType.models";
import { TdsEmployeeDetals } from "./tdsEmployeeDetails.models";

import { TdsSectionDetails } from "./tdsSection.models";
import { TdsSubHeadingDetails } from "./subHeading.models";
import { TdsEmployeeSubHeadingDetails } from "./tdsEmployeeSubHeading.models.";
import { HouseIncomeDetails } from "./houseIncomeDetails.models";
import { TdsEmployeeHouseIncomeDetails } from "./tdsEmpHouseIncome.models";
import { OtherIncomeDetails } from "./otherIncome.models";
import { TdsEmployeeHRADetails } from "./tdsEmployeeHRA.models";
import { HRALocations } from "./hraLocations.models";
import { EmployeeOtherIncomeDetails } from "./tdsEmpOtherIncome.models";



export class InvestmentDeclaration{
    EmployeeDetails?:TdsEmployeeDetals;
    TdsSectionDetails?:TdsSectionDetails[];
    TdsSubHeadingDetails?:TdsSubHeadingDetails[];
    TdsEmployeeSubHeadingDetails?:TdsEmployeeSubHeadingDetails[];
    HouseIncomeDetails?:HouseIncomeDetails[];
    TdsEmployeeHouseIncomeDetails?:TdsEmployeeHouseIncomeDetails[];
    OtherIncomeDetails?:OtherIncomeDetails[];
    EmployeeOtherIncomeDetails?:EmployeeOtherIncomeDetails[];
    TdsEmployeeHRADetails?:TdsEmployeeHRADetails[];    
}