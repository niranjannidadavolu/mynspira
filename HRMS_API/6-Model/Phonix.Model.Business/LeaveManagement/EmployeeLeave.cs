
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.Model.Business.Attendance;
using Phoenix.Model.Business.Masters;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class EmployeeLeave
    {
        public LeaveType? LeaveType { get; set; }
        public LeaveTypeReason? LeaveTypeReason { get; set; }

        public DateTime FromDate
        {
            get
            {
                DateTime fromDate = LeaveFrom.ToDateTimeOrDefault();
                return fromDate;
            }
        }
        public DateTime ToDate
        {
            get
            {
                DateTime toDate = LeaveTo.ToDateTimeOrDefault();
                return toDate;
            }
        }
        public int FromDateDayTypeId { get; set; }

        public int ToDateDayTypeId { get; set; }

        public string Remarks { get; set; }

        public int EmployeeSlno { get; set; }

        public string LeaveFrom { get; set; }

        public string LeaveTo { get; set; }

        public int ApplyingFor { get; set; }

        public List<int> SelectedEmployees { get; set; }

        public List<LeaveFileUpload> LeaveFileUploads { get; set; }
        public DateTime? CompOffDate { get; set; }
        public string EarlyLogoutTime { get; set; }
        public double? RatificationTime
        {
            get
            {
                double? ret = null;
                if (!string.IsNullOrEmpty(EarlyLogoutTime))
                {
                    string[] timeValues = EarlyLogoutTime.Split(':');
                    if (timeValues.Length > 0)
                    {
                        double totalHours = timeValues[0].ToDoubleOrDefault();
                        double totalMins = timeValues[1].ToDoubleOrDefault();
                        ret = (totalHours * 60) + totalMins;
                    }
                }
                return ret;

            }
        }

        public List<HolidayInformation>? HolidayInformations { get; set; }
        public List<LeaveDetail>? AppliedLeaves { get; set; }
    }


}