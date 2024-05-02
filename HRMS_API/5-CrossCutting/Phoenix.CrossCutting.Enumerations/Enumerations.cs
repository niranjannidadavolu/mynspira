using Phoenix.CrossCutting.Helper;

namespace Phoenix.CrossCutting.Enumerations
{
    public class Enumerations
    {
        public enum DbSchema { PORTAL, NERP }

        public enum Employee_Details
        {
            EMPLOYEE = 1,
            EDUCATIONDTLS = 2,
            FAMILYDTLS = 3,
            EXPERIENACEDTLS = 4,
            ADDRESSDTLS = 5,
            ASSET = 6
        }
        public enum NodeLevel
        {
            Module = 1,
            Page = 2,
            PagePermissions = 3
        }

        public enum NodeType
        {
            Module = 1,
            Page = 2,
            PagePermissions = 3
        }

        public enum RecordStatus
        {
            Active = 1,
            InActive = 2,
            Deleted = 3
        }

        public enum LeaveStatusNames
        {
            PendingAndApproval = 0,
            PendingForApproval = 1,
            Approved = 2,
            Rejected = 3,
            OnHold = 4,
            Canceled = 5
        }

        public enum LeaveDayTypeNames
        {
            FullDay = 1,
            FirstHalf = 2,
            SecondHalf = 3
        }
        public enum LeaveTypeNames
        {
            [DisplayValue("Present")] 
            PRESENT = 1,
            [DisplayValue("Leave")]
            LEAVE = 2,
            [DisplayValue("On Duty")]
            ON_DUTY = 3,
            [DisplayValue("Manual Present")]
            MANUAL_PRESENT = 4,
            [DisplayValue("Absent")]
            ABSENT = 5,
            [DisplayValue("Casual Leave")]
            CASUAL_LEAVE = 6,
            [DisplayValue("Sick Leave")]
            SICK_LEAVE = 7,
            [DisplayValue("Maternity Leave")]
            MATERNITY_LEAVE = 8,
            [DisplayValue("Marriage Leave (Self)")]
            MARRIAGE_LEAVE = 9,
            [DisplayValue("Covid Leave")]
            COVID_LEAVE = 10,
            [DisplayValue("Bereavement Leave")]
            BEREAVEMENT_LEAVE = 11,
            [DisplayValue("Summer Vacation")]
            SUMMER_VACATION = 12,
            [DisplayValue("Winter Vacation")]
            WINTER_VACATION = 13,
            [DisplayValue("Paternity Leave")]
            PATERNITY_LEAVE = 14,
            [DisplayValue("Pivilege Leave")]
            EARNED_LEAVE = 15,
            [DisplayValue("Special Casual Leave")]
            SPECIAL_CASUAL_LEAVE = 16,
            [DisplayValue("Special Sick Leave")]
            SPECIAL_SICK_LEAVE = 17,
            [DisplayValue("Compensatory Off")]
            COMPENSATORY_OFF = 18,
            [DisplayValue("Early Logout Time")]
            EARLY_LOGOUT_TIME = 19,
            [DisplayValue("Session Break Leave")]
            SESSION_BREAK = 20
        }
        public enum ApplyingFor
        {
            Self = 1,
            ForTeam = 2,
            ForTeamAndSelf = 3
        }

        public enum WorkFlowType
        {
            Leave = 1,
            Travel = 2,
            Encashment = 3
        }

        public enum ReviewerType
        {
            Self = 1,
            Appriser = 2,
            Reviewer = 3
        }
    }
}
