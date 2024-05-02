using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.Helper;

namespace Phoenix.Model.Business.Administration
{
    public class UserInformation : BaseBusinessEntity
    {
        public int UserId { get; set; }
        public int EmployeeSlno { get; set; }
        public string EmployeeId { get; set; }
        public string EmpId { get; set; }
        public string CustomizedId { get; set; }
        public string EmployeeName { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public string PasswordSalt { get; set; }
        public bool IsFirstLogin { get; set; }
        public int Status { get; set; }
        public DateTime LastLoginTime { get; set; }
        public List<RoleInformation> UserRoles { get; set; }
        public string Token { get; set; }
        public string Company { get; set; }
        public string OneTimePassword { get; set; }
        public string Message { get; set; }
        public List<ScreenInformation> MappedScreens { get; set; }
        public int UserSlno { get; set; }
        public string DesignationName { get; set; }
        public RefreshToken RefreshToken { get; set; }
        public bool IsVerified { get; set; }
        public bool IsHrVerified { get; set; }
        public bool ProcessedByPayroll { get; set; }
        public string EqualToken { get; set; }
        public string ClientId { get; set; }
        public string IdempotencyId { get; set; }
        public bool CanApplyLeave { get; set; }
    }
}
