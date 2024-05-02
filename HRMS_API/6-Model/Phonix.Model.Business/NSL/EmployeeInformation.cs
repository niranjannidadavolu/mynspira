using Phoenix.Infrastructure.BusinessModel;

namespace Phoenix.Model.Business.NSL
{
    public class EmployeeInformation : BaseBusinessEntity
    {
        public string Workerid { get; set; }
        public string Managerid { get; set; }
        public string Organisationid { get; set; }
        public string Businessunitid { get; set; }
        public string Businessunitname { get; set; }
        public string Salutation { get; set; }
        public string Firstname { get; set; }
        public string Middlename { get; set; }
        public string Lastname { get; set; }
        public string Fullname { get; set; }
        public string Nickname { get; set; }
        public string Emailaddress { get; set; }
        public string Personalemailaddress { get; set; }
        public string Internalemailaddress { get; set; }
        public string Jobtitle { get; set; }
        public string HomePhone { get; set; }
        public string MobileNumber { get; set; }
        public string PreferedContactMode { get; set; }
        public string Birthdate { get; set; }
        public string Description { get; set; }
        public string DisabledReason { get; set; }
        public string Isdisabled { get; set; }
        public string GovernmentId { get; set; }
        public string Address { get; set; }
        public string Skills { get; set; }
        public string MarritalStatus { get; set; }
        public string Statecode { get; set; }
        public string Gender { get; set; }
        public string DateofJoining { get; set; }
        public string DateofConfirmation { get; set; }
        public string Worklocation { get; set; }
        public string Employmenttype { get; set; }
        public string Designation { get; set; }
        public string Officetype { get; set; }
        public string Branch { get; set; }
        public string BranchState { get; set; }
        public string BranchDistrict { get; set; }
        public string Category { get; set; }
        public string SubCategory { get; set; }
        public string Department { get; set; }
        public string Entity { get; set; }
        public string NoofChildren { get; set; }
        public string Territory { get; set; }

    }
}
