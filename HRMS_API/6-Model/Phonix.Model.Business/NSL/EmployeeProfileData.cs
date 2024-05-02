using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.NSL
{
    public class EmployeeProfileData
    {
        public string WorkerId { get; set; }
        public string ManagerId { get; set; }
        public string OrganisationId { get; set; }
        public string BusinessUnitId { get; set; }
        public string BusinessUnitName { get; set; }
        public string Salutation { get; set; }
        public string FullName { get; set; }
        public string NickName { get; set; }
        public string EmailAddress { get; set; }
        public string PersonalEmailAddress { get; set; }
        public string InternalEmailAddress { get; set; }
        public string JobTitle { get; set; }
        public string MobileNumber { get; set; }
        public DateTime BirthDate { get; set; }
        public string GovernmentId { get; set; }
        public string Address { get; set; }
        public string MarritalStatus { get; set; }
        public int MarritalStatusId { get; set; }
        public string StateCode { get; set; }
        public string Gender { get; set; }
        public DateTime DateOfJoining { get; set; }
        public DateTime DateOfConfirmation { get; set; }
        public string WorkLocation { get; set; }
        public string EmploymentType { get; set; }
        public string Designation { get; set; }
        public string OfficeType { get; set; }
        public string Branch { get; set; }
        public string BranchState { get; set; }
        public string BranchDistrict { get; set; }
        public string Category { get; set; }
        public string SubCategory { get; set; }
        public string Department { get; set; }
        public string Entity { get; set; }
        public int NoOfChildren { get; set; }

    }
}
