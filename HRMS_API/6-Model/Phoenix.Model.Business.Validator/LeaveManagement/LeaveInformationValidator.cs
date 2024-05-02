using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.Object.ValueComparison;
using Phoenix.Model.Business.Attendance;
using Phoenix.Model.Business.LeaveManagement;

namespace Phoenix.Model.Business.Validator.LeaveManagement
{
    public class LeaveInformationValidator : AbstractValidator<EmployeeLeave>
    {
        public List<HolidayInformation> HolidayInformations { get; set; }
        public List<LeaveDetail> AppliedLeaves { get; set; }

        public LeaveInformationValidator()
        {
            RuleFor(x => x.FromDate).NotEmpty().WithMessage("Leave From date is required.")
                .Must(BeAWeekday).WithMessage("Start date must be a weekday or should not fall on Holiday.");
            RuleFor(x => x.ToDate).NotEmpty().WithMessage("Leave To date is required.")
                .GreaterThanOrEqualTo(x => x.FromDate).WithMessage("Leave To date must be on or after FromDate Date.")
                .Must(BeAWeekday).WithMessage("End date must be a weekday or should not fall on Holiday.");
            RuleFor(x => x.Remarks).NotEmpty().WithMessage("Remarks for leave is required.");
            RuleFor(x => x.LeaveType).NotEmpty().WithMessage("Invalid leave type.");
        }
        private bool BeAWeekday(DateTime date)
        {
            if (HolidayInformations == null || HolidayInformations.Count <= 0) return true;
            bool x = HolidayInformations.Any(x => x.HolidayDate.Date == date.Date);

            return !x; 
           // return HolidayInformations.Any(x => x.HolidayDate.Date == date.Date);
        }
    }
}
