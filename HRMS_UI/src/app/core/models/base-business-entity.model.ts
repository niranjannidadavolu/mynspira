export interface BaseBusinessEntity {
    StatusId: number;
    StatusName: string;
    CreatedBy: number;
    CreatedDate: string;
    ModifiedBy: number | null;
    ModifiedDate: string | null;
}