using Phoenix.Infrastructure.BusinessModel;

namespace Phoenix.Model.Business.Employee
{
    public class WorkFlowFlag : BaseBusinessEntity
    {
        public int WorkFlowId { get; set; }
        public int LevelCount { get; set; }
        public int Status { get; set; }
        public int EmpstepsCount { get; set; }
    }
}
