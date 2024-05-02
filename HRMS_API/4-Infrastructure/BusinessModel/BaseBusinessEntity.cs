// ***********************************************************************
// Assembly         : Phoenix.Infrastructure.BusinessModel

using System;

namespace Phoenix.Infrastructure.BusinessModel
{
    public class BaseBusinessEntity
    {
        public int StatusId { get; set; }
        public long CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public long? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }

        public string Status
        {
            get
            {
                string status = string.Empty;
                status = StatusId == 1 ? "Active" : StatusId == 3 ? "Resigned" : "In-Active";
                return status;
            }
        }
        public string StatusColor
        {
            get
            {
                string status = string.Empty;
                status = StatusId == 1 ? "success" : StatusId == 3 ? "warning" : "danger";
                return status;
            }
        }
    }
}
